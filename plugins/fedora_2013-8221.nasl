#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2013-8221.
#

include("compat.inc");

if (description)
{
  script_id(66580);
  script_version("$Revision: 1.6 $");
  script_cvs_date("$Date: 2015/10/19 21:56:45 $");

  script_cve_id("CVE-2013-1888");
  script_xref(name:"FEDORA", value:"2013-8221");

  script_name(english:"Fedora 17 : python-virtualenv-1.9.1-1.fc17 (2013-8221)");
  script_summary(english:"Checks rpm output for the updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"  - Fixes two security issues with the bundled copy of pip :

    - Insecure tempdir usage CVE-2013-1888

    - Uses http:// to download packages instead of https://
      See changelog at:
      http://pypi.python.org/pypi/virtualenv#id2 Multiple
      bugfixes. See
      http://pypi.python.org/pypi/virtualenv/1.7.1.2 for
      information. Multiple bugfixes. See
      http://pypi.python.org/pypi/virtualenv/1.7.1.2 for
      information. See changelog at:
      http://pypi.python.org/pypi/virtualenv#id2 Multiple
      bugfixes. See
      http://pypi.python.org/pypi/virtualenv/1.7.1.2 for
      information. Multiple bugfixes. See
      http://pypi.python.org/pypi/virtualenv/1.7.1.2 for
      information. See changelog at:
      http://pypi.python.org/pypi/virtualenv#id2 Multiple
      bugfixes. See
      http://pypi.python.org/pypi/virtualenv/1.7.1.2 for
      information. Multiple bugfixes. See
      http://pypi.python.org/pypi/virtualenv/1.7.1.2 for
      information.

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://pypi.python.org/pypi/virtualenv#id2"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://pypi.python.org/pypi/virtualenv/1.7.1.2"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=923974"
  );
  # https://lists.fedoraproject.org/pipermail/package-announce/2013-May/105989.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?82c18a90"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected python-virtualenv package."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:python-virtualenv");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora:17");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/05/15");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/05/24");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2015 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^17([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 17.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC17", reference:"python-virtualenv-1.9.1-1.fc17")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "python-virtualenv");
}