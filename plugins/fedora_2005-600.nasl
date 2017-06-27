#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2005-600.
#

include("compat.inc");

if (description)
{
  script_id(19290);
  script_version ("$Revision: 1.12 $");
  script_cvs_date("$Date: 2015/10/21 21:38:05 $");

  script_xref(name:"FEDORA", value:"2005-600");

  script_name(english:"Fedora Core 3 : perl-5.8.5-14.FC3 (2005-600)");
  script_summary(english:"Checks rpm output for the updated packages.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora Core host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Paul Szabo discovered another vulnerability in the File::Path::rmtree
function of perl, the popular scripting language. When a process is
deleting a directory tree, a different user could exploit a race
condition to create setuid binaries in this directory tree, provided
that he already had write permissions in any subdirectory of that
tree.

Perl interpreter would cause a segmentation fault when environment
changes during the runtime. 

Code in lib/FindBin contained a regression which caused problems with
MRTG software package.

All of the above problems are now fixed in perl-5.8.5-14.FC3. Please
test as much as you can and report any problems/regressions.

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  # https://lists.fedoraproject.org/pipermail/announce/2005-July/001123.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?d883dcde"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Update the affected perl, perl-debuginfo and / or perl-suidperl
packages."
  );
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:perl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:perl-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:perl-suidperl");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora_core:3");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/07/22");
  script_set_attribute(attribute:"plugin_publication_date", value:"2005/07/24");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2015 Tenable Network Security, Inc.");
  script_family(english:"Fedora Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Fedora" >!< release) audit(AUDIT_OS_NOT, "Fedora");
os_ver = eregmatch(pattern: "Fedora.*release ([0-9]+)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Fedora");
os_ver = os_ver[1];
if (! ereg(pattern:"^3([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 3.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC3", reference:"perl-5.8.5-14.FC3")) flag++;
if (rpm_check(release:"FC3", reference:"perl-debuginfo-5.8.5-14.FC3")) flag++;
if (rpm_check(release:"FC3", reference:"perl-suidperl-5.8.5-14.FC3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "perl / perl-debuginfo / perl-suidperl");
}