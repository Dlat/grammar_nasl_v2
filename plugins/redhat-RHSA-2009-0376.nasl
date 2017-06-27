#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2009:0376. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(40740);
  script_version ("$Revision: 1.27 $");
  script_cvs_date("$Date: 2017/01/03 17:27:01 $");

  script_cve_id("CVE-2009-0193", "CVE-2009-0658", "CVE-2009-0928", "CVE-2009-1061", "CVE-2009-1062");
  script_osvdb_id(52073, 53644, 53645, 53646, 53648);
  script_xref(name:"RHSA", value:"2009:0376");

  script_name(english:"RHEL 3 / 4 / 5 : acroread (RHSA-2009:0376)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated acroread packages that fix multiple security issues are now
available for Red Hat Enterprise Linux 3 Extras, Red Hat Enterprise
Linux 4 Extras, and Red Hat Enterprise Linux 5 Supplementary.

This update has been rated as having critical security impact by the
Red Hat Security Response Team.

Adobe Reader allows users to view and print documents in Portable
Document Format (PDF).

Multiple input validation flaws were discovered in the JBIG2
compressed images decoder used by Adobe Reader. A malicious PDF file
could cause Adobe Reader to crash or, potentially, execute arbitrary
code as the user running Adobe Reader. (CVE-2009-0193, CVE-2009-0658,
CVE-2009-0928, CVE-2009-1061, CVE-2009-1062)

All Adobe Reader users should install these updated packages. They
contain Adobe Reader version 8.1.4, which is not vulnerable to these
issues. All running instances of Adobe Reader must be restarted for
the update to take effect."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0193.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0658.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0928.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-1061.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-1062.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.adobe.com/support/security/bulletins/apsb09-04.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2009-0376.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected acroread and / or acroread-plugin packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:H/RL:ND/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");
  script_set_attribute(attribute:"metasploit_name", value:'Adobe JBIG2Decode Memory Corruption');
  script_set_attribute(attribute:"exploit_framework_metasploit", value:"true");
  script_set_attribute(attribute:"exploit_framework_canvas", value:"true");
  script_set_attribute(attribute:"canvas_package", value:'CANVAS');
  script_cwe_id(20, 119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:acroread");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:acroread-plugin");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:3");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:4.7");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:5");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:5.3");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/03/25");
  script_set_attribute(attribute:"plugin_publication_date", value:"2009/08/24");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2009-2017 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(3|4|5)([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Red Hat 3.x / 4.x / 5.x", "Red Hat " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$" && "s390" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Red Hat", cpu);
if (cpu !~ "^i[3-6]86$") audit(AUDIT_ARCH_NOT, "i386", cpu);

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2009:0376";
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
  if (rpm_check(release:"RHEL3", cpu:"i386", reference:"acroread-8.1.4-1")) flag++;

  if (rpm_check(release:"RHEL3", cpu:"i386", reference:"acroread-plugin-8.1.4-1")) flag++;


  if (rpm_check(release:"RHEL4", cpu:"i386", reference:"acroread-8.1.4-1.el4")) flag++;

  if (rpm_check(release:"RHEL4", cpu:"i386", reference:"acroread-plugin-8.1.4-1.el4")) flag++;


  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"acroread-8.1.4-1.el5")) flag++;

  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"acroread-plugin-8.1.4-1.el5")) flag++;


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
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "acroread / acroread-plugin");
  }
}