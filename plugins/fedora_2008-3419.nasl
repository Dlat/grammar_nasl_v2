#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2008-3419.
#

include("compat.inc");

if (description)
{
  script_id(32108);
  script_version ("$Revision: 1.12 $");
  script_cvs_date("$Date: 2015/10/21 22:13:39 $");

  script_cve_id("CVE-2008-1926");
  script_xref(name:"FEDORA", value:"2008-3419");

  script_name(english:"Fedora 8 : util-linux-ng-2.13.1-2.fc8 (2008-3419)");
  script_summary(english:"Checks rpm output for the updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"  - Tue Apr 22 2008 Karel Zak <kzak at redhat.com> 2.13.1-2

    - fix audit log injection attack via login

    - Wed Jan 16 2008 Karel Zak <kzak at redhat.com>
      2.13.1-1

    - upgrade to stable util-linux-ng 2.13.1

    - fix #427874 - util-linux-ng gets 'excess command line
      argument' on update

    - Thu Jan 3 2008 Karel Zak <kzak at redhat.com> 2.13-3.2

    - fix #427207 - util-linux-ng-2.13-3.1.fc8.src.rpm not
      rebuilded

    - Wed Dec 5 2007 Karel Zak <kzak at redhat.com> 2.13-3.1

    - fix #409551 - hwclock: check for ENODEV (upstream
      patch)

    - fix #408391 - setarch: add missing alpha subarchs
      (upstream patch)

    - mkswap: possible to crash with SELinux relabeling
      support (upstream patch)

    - mount: don't call canonicalize(SPEC) for cifs, smbfs
      and nfs (upstream patch)

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=443925"
  );
  # https://lists.fedoraproject.org/pipermail/package-announce/2008-April/009649.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?7297fd44"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected util-linux-ng package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cwe_id(94);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:util-linux-ng");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora:8");

  script_set_attribute(attribute:"patch_publication_date", value:"2008/04/29");
  script_set_attribute(attribute:"plugin_publication_date", value:"2008/05/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2008-2015 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^8([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 8.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC8", reference:"util-linux-ng-2.13.1-2.fc8")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "util-linux-ng");
}