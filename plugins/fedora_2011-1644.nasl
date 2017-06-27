#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2011-1644.
#

include("compat.inc");

if (description)
{
  script_id(52057);
  script_version("$Revision: 1.8 $");
  script_cvs_date("$Date: 2015/10/20 21:56:30 $");

  script_osvdb_id(72538);
  script_xref(name:"FEDORA", value:"2011-1644");

  script_name(english:"Fedora 14 : gitolite-1.5.3-2.fc14 (2011-1644)");
  script_summary(english:"Checks rpm output for the updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Dylan Alex Simon discovered and reported a directory traversal flaw in
the way Gitolite restricted access to admin defined commands ('ADC').
An authenticated attacker could execute arbitrary code with privileges
of Gitolite server user using specially crafted command name.

The flaw does not affect default Gitolite installations. Users who
have enabled ADC in their configurations are advised to install the
updated package which includes a fix to resolve the issue.

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  # https://lists.fedoraproject.org/pipermail/package-announce/2011-February/054250.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?ddc63830"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected gitolite package."
  );
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:gitolite");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora:14");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/02/16");
  script_set_attribute(attribute:"plugin_publication_date", value:"2011/02/22");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2011-2015 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^14([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 14.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC14", reference:"gitolite-1.5.3-2.fc14")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "gitolite");
}