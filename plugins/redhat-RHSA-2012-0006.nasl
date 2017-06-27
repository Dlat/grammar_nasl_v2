#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2012:0006. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(57464);
  script_version ("$Revision: 1.17 $");
  script_cvs_date("$Date: 2017/01/05 16:04:20 $");

  script_cve_id("CVE-2011-3389", "CVE-2011-3545", "CVE-2011-3547", "CVE-2011-3548", "CVE-2011-3549", "CVE-2011-3552", "CVE-2011-3556", "CVE-2011-3557", "CVE-2011-3560");
  script_bugtraq_id(49388, 49778, 50211, 50220, 50223, 50231, 50234, 50236, 50243, 50248);
  script_osvdb_id(74829, 76495, 76497, 76499, 76501, 76505, 76506, 76507, 76511);
  script_xref(name:"RHSA", value:"2012:0006");

  script_name(english:"RHEL 4 / 5 : java-1.4.2-ibm (RHSA-2012:0006) (BEAST)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated java-1.4.2-ibm packages that fix several security issues are
now available for Red Hat Enterprise Linux 4 Extras and Red Hat
Enterprise Linux 5 Supplementary.

The Red Hat Security Response Team has rated this update as having
critical security impact. Common Vulnerability Scoring System (CVSS)
base scores, which give detailed severity ratings, are available for
each vulnerability from the CVE links in the References section.

The IBM Java SE version 1.4.2 release includes the IBM Java 1.4.2
Runtime Environment and the IBM Java 1.4.2 Software Development Kit.

This update fixes several vulnerabilities in the IBM Java 1.4.2
Runtime Environment and the IBM Java 1.4.2 Software Development Kit.
Detailed vulnerability descriptions are linked from the IBM 'Security
alerts' page, listed in the References section. (CVE-2011-3389,
CVE-2011-3545, CVE-2011-3547, CVE-2011-3548, CVE-2011-3549,
CVE-2011-3552, CVE-2011-3556, CVE-2011-3557, CVE-2011-3560)

All users of java-1.4.2-ibm are advised to upgrade to these updated
packages, which contain the IBM Java 1.4.2 SR13-FP11 release. All
running instances of IBM Java must be restarted for this update to
take effect."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3389.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3545.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3547.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3548.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3549.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3552.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3556.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3557.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3560.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.ibm.com/developerworks/java/jdk/alerts/"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2012-0006.html"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:java-1.4.2-ibm");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:java-1.4.2-ibm-demo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:java-1.4.2-ibm-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:java-1.4.2-ibm-javacomm");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:java-1.4.2-ibm-jdbc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:java-1.4.2-ibm-plugin");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:java-1.4.2-ibm-src");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2012/01/09");
  script_set_attribute(attribute:"in_the_news", value:"true");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/01/10");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2017 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(4|5)([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Red Hat 4.x / 5.x", "Red Hat " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$" && "s390" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Red Hat", cpu);

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2012:0006";
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
  if (rpm_check(release:"RHEL4", reference:"java-1.4.2-ibm-1.4.2.13.11-1jpp.1.el4")) flag++;
  if (rpm_check(release:"RHEL4", reference:"java-1.4.2-ibm-demo-1.4.2.13.11-1jpp.1.el4")) flag++;
  if (rpm_check(release:"RHEL4", reference:"java-1.4.2-ibm-devel-1.4.2.13.11-1jpp.1.el4")) flag++;
  if (rpm_check(release:"RHEL4", cpu:"i386", reference:"java-1.4.2-ibm-javacomm-1.4.2.13.11-1jpp.1.el4")) flag++;
  if (rpm_check(release:"RHEL4", cpu:"x86_64", reference:"java-1.4.2-ibm-javacomm-1.4.2.13.11-1jpp.1.el4")) flag++;
  if (rpm_check(release:"RHEL4", cpu:"i386", reference:"java-1.4.2-ibm-jdbc-1.4.2.13.11-1jpp.1.el4")) flag++;
  if (rpm_check(release:"RHEL4", cpu:"s390", reference:"java-1.4.2-ibm-jdbc-1.4.2.13.11-1jpp.1.el4")) flag++;
  if (rpm_check(release:"RHEL4", cpu:"i386", reference:"java-1.4.2-ibm-plugin-1.4.2.13.11-1jpp.1.el4")) flag++;
  if (rpm_check(release:"RHEL4", reference:"java-1.4.2-ibm-src-1.4.2.13.11-1jpp.1.el4")) flag++;

  if (rpm_check(release:"RHEL5", reference:"java-1.4.2-ibm-1.4.2.13.11-1jpp.1.el5")) flag++;
  if (rpm_check(release:"RHEL5", reference:"java-1.4.2-ibm-demo-1.4.2.13.11-1jpp.1.el5")) flag++;
  if (rpm_check(release:"RHEL5", reference:"java-1.4.2-ibm-devel-1.4.2.13.11-1jpp.1.el5")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"java-1.4.2-ibm-javacomm-1.4.2.13.11-1jpp.1.el5")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"x86_64", reference:"java-1.4.2-ibm-javacomm-1.4.2.13.11-1jpp.1.el5")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"java-1.4.2-ibm-jdbc-1.4.2.13.11-1jpp.1.el5")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"s390", reference:"java-1.4.2-ibm-jdbc-1.4.2.13.11-1jpp.1.el5")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"java-1.4.2-ibm-plugin-1.4.2.13.11-1jpp.1.el5")) flag++;
  if (rpm_check(release:"RHEL5", reference:"java-1.4.2-ibm-src-1.4.2.13.11-1jpp.1.el5")) flag++;

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
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "java-1.4.2-ibm / java-1.4.2-ibm-demo / java-1.4.2-ibm-devel / etc");
  }
}