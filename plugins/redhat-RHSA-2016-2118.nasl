#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2016:2118. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(94317);
  script_version("$Revision: 2.12 $");
  script_cvs_date("$Date: 2017/01/16 16:05:33 $");

  script_cve_id("CVE-2016-5195");
  script_osvdb_id(146061);
  script_xref(name:"RHSA", value:"2016:2118");
  script_xref(name:"IAVA", value:"2016-A-0306");

  script_name(english:"RHEL 7 : kernel (RHSA-2016:2118) (Dirty COW)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"An update for kernel is now available for Red Hat Enterprise Linux 7.1
Extended Update Support.

Red Hat Product Security has rated this update as having a security
impact of Important. A Common Vulnerability Scoring System (CVSS) base
score, which gives a detailed severity rating, is available for each
vulnerability from the CVE link(s) in the References section.

The kernel packages contain the Linux kernel, the core of any Linux
operating system.

Security Fix(es) :

* A race condition was found in the way the Linux kernel's memory
subsystem handled the copy-on-write (COW) breakage of private
read-only memory mappings. An unprivileged, local user could use this
flaw to gain write access to otherwise read-only memory mappings and
thus increase their privileges on the system. (CVE-2016-5195,
Important)

Red Hat would like to thank Phil Oester for reporting this issue."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2016-5195.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://access.redhat.com/security/vulnerabilities/2706661"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2016-2118.html"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:ND");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H");
  script_set_cvss3_temporal_vector("CVSS:3.0/E:F/RL:O/RC:X");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");
  script_set_attribute(attribute:"exploit_framework_canvas", value:"true");
  script_set_attribute(attribute:"canvas_package", value:'CANVAS');

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-abi-whitelists");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-debug");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-debug-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-debug-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-debuginfo-common-s390x");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-debuginfo-common-x86_64");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-headers");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-kdump");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-kdump-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-kdump-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-tools");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-tools-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-tools-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:kernel-tools-libs-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:perf");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:perf-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:python-perf");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:python-perf-debuginfo");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:7.1");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/10/26");
  script_set_attribute(attribute:"in_the_news", value:"true");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/10/27");
  script_set_attribute(attribute:"stig_severity", value:"I");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016-2017 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^7\.1([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Red Hat 7.1", "Red Hat " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$" && "s390" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Red Hat", cpu);

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2016:2118";
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
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", reference:"kernel-abi-whitelists-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-debug-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-debug-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-debug-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-debug-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-debug-devel-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-debug-devel-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-debuginfo-common-s390x-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-debuginfo-common-x86_64-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-devel-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-devel-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", reference:"kernel-doc-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-headers-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-headers-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-kdump-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-kdump-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"kernel-kdump-devel-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-tools-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-tools-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-tools-libs-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"kernel-tools-libs-devel-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"perf-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"perf-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"perf-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"perf-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"python-perf-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"python-perf-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"s390x", reference:"python-perf-debuginfo-3.10.0-229.42.2.el7")) flag++;
  if (rpm_check(release:"RHEL7", sp:"1", cpu:"x86_64", reference:"python-perf-debuginfo-3.10.0-229.42.2.el7")) flag++;

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
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "kernel / kernel-abi-whitelists / kernel-debug / etc");
  }
}