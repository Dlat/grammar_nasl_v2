#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2005:081. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(19827);
  script_version ("$Revision: 1.19 $");
  script_cvs_date("$Date: 2017/01/10 18:05:23 $");

  script_cve_id("CVE-2004-0467", "CVE-2004-0967");
  script_osvdb_id(11069, 13196);
  script_xref(name:"RHSA", value:"2005:081");

  script_name(english:"RHEL 3 : ghostscript (RHSA-2005:081)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated ghostscript packages that fix a PDF output issue and a
temporary file security bug are now available.

This update has been rated as having low security impact by the Red
Hat Security Response Team.

Ghostscript is a program for displaying PostScript files or printing
them to non-PostScript printers.

A bug was found in the way several of Ghostscript's utility scripts
created temporary files. A local user could cause these utilities to
overwrite files that the victim running the utility has write access
to. The Common Vulnerabilities and Exposures project assigned the name
CVE-2004-0967 to this issue.

Additionally, this update addresses the following issue :

A problem has been identified in the PDF output driver, which can
cause output to be delayed indefinitely on some systems. The fix has
been backported from GhostScript 7.07.

All users of ghostscript should upgrade to these updated packages,
which contain backported patches to resolve these issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2004-0967.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2005-081.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Update the affected ghostscript, ghostscript-devel and / or hpijs
packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:ND/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:ghostscript");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:ghostscript-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:hpijs");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:3");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/09/28");
  script_set_attribute(attribute:"plugin_publication_date", value:"2005/10/05");
  script_set_attribute(attribute:"vuln_publication_date", value:"2004/09/30");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2017 Tenable Network Security, Inc.");
  script_family(english:"Red Hat Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/RedHat/release", "Host/RedHat/rpm-list", "Host/cpu");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("misc_func.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Red Hat" >!< release) audit(AUDIT_OS_NOT, "Red Hat");
os_ver = eregmatch(pattern: "Red Hat Enterprise Linux.*release ([0-9]+(\.[0-9]+)?)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Red Hat");
os_ver = os_ver[1];
if (! ereg(pattern:"^3([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Red Hat 3.x", "Red Hat " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$" && "s390" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Red Hat", cpu);

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2005:081";
  yum_report = redhat_generate_yum_updateinfo_report(rhsa:rhsa);
  if (!empty_or_null(yum_report))
  {
    security_report_v4(
      port       : 0,
      severity   : SECURITY_HOLE,
      extra      : yum_report 
    );
    exit(0);
  }
  else
  {
    audit_message = "affected by Red Hat security advisory " + rhsa;
    audit(AUDIT_OS_NOT, audit_message);
  }
}
else
{
  flag = 0;
  if (rpm_check(release:"RHEL3", reference:"ghostscript-7.05-32.1.10")) flag++;
  if (rpm_check(release:"RHEL3", reference:"ghostscript-devel-7.05-32.1.10")) flag++;
  if (rpm_check(release:"RHEL3", reference:"hpijs-1.3-32.1.10")) flag++;

  if (flag)
  {
    security_report_v4(
      port       : 0,
      severity   : SECURITY_HOLE,
      extra      : rpm_report_get() + redhat_report_package_caveat()
    );
    exit(0);
  }
  else
  {
    tested = pkg_tests_get();
    if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "ghostscript / ghostscript-devel / hpijs");
  }
}