#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Red Hat Security Advisory RHSA-2015:1978 and 
# Oracle Linux Security Advisory ELSA-2015-1978 respectively.
#

include("compat.inc");

if (description)
{
  script_id(86714);
  script_version("$Revision: 2.4 $");
  script_cvs_date("$Date: 2016/04/28 19:01:51 $");

  script_cve_id("CVE-2014-8559", "CVE-2015-5156");
  script_osvdb_id(114044, 125846);
  script_xref(name:"RHSA", value:"2015:1978");

  script_name(english:"Oracle Linux 7 : kernel (ELSA-2015-1978)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Oracle Linux host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"From Red Hat Security Advisory 2015:1978 :

Updated kernel packages that fix two security issues, several bugs,
and add one enhancement are now available for Red Hat Enterprise Linux
7.

Red Hat Product Security has rated this update as having Moderate
security impact. Common Vulnerability Scoring System (CVSS) base
scores, which give detailed severity ratings, are available for each
vulnerability from the CVE links in the References section.

The kernel packages contain the Linux kernel, the core of any Linux
operating system.

* A flaw was found in the way the Linux kernel's VFS subsystem handled
file system locks. A local, unprivileged user could use this flaw to
trigger a deadlock in the kernel, causing a denial of service on the
system. (CVE-2014-8559, Moderate)

* A buffer overflow flaw was found in the way the Linux kernel's
virtio-net subsystem handled certain fraglists when the GRO (Generic
Receive Offload) functionality was enabled in a bridged network
configuration. An attacker on the local network could potentially use
this flaw to crash the system, or, although unlikely, elevate their
privileges on the system. (CVE-2015-5156, Moderate)

The CVE-2015-5156 issue was discovered by Jason Wang of Red Hat.

This update also fixes several bugs and adds one enhancement. Refer to
the following Knowledgebase article for further information :

https://access.redhat.com/articles/2039563

All kernel users are advised to upgrade to these updated packages,
which contain backported patches to correct these issues and add this
enhancement. The system must be rebooted for this update to take
effect."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://oss.oracle.com/pipermail/el-errata/2015-November/005488.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected kernel packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:A/AC:L/Au:N/C:N/I:N/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-abi-whitelists");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-debug");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-debug-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-headers");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-tools");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-tools-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-tools-libs-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:perf");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:python-perf");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:linux:7");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/11/03");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/11/04");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015-2016 Tenable Network Security, Inc.");
  script_family(english:"Oracle Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/OracleLinux", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/OracleLinux")) audit(AUDIT_OS_NOT, "Oracle Linux");
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || !eregmatch(pattern: "Oracle (?:Linux Server|Enterprise Linux)", string:release)) audit(AUDIT_OS_NOT, "Oracle Linux");
os_ver = eregmatch(pattern: "Oracle (?:Linux Server|Enterprise Linux) .*release ([0-9]+(\.[0-9]+)?)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Oracle Linux");
os_ver = os_ver[1];
if (! ereg(pattern:"^7([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Oracle Linux 7", "Oracle Linux " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Oracle Linux", cpu);
if ("x86_64" >!< cpu) audit(AUDIT_ARCH_NOT, "x86_64", cpu);

flag = 0;
if (rpm_exists(release:"EL7", rpm:"kernel-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-abi-whitelists-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-abi-whitelists-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-debug-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-debug-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-debug-devel-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-debug-devel-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-devel-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-devel-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-doc-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-doc-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-headers-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-headers-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-tools-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-tools-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-tools-libs-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-tools-libs-3.10.0-229.20.1.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-tools-libs-devel-3.10.0") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-tools-libs-devel-3.10.0-229.20.1.el7")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"perf-3.10.0-229.20.1.el7")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"python-perf-3.10.0-229.20.1.el7")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "affected kernel");
}