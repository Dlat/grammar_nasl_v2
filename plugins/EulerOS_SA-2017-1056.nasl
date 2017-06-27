#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(99901);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2017/05/02 13:34:09 $");

  script_cve_id(
    "CVE-2017-5669",
    "CVE-2017-6001",
    "CVE-2017-6074",
    "CVE-2017-6214",
    "CVE-2017-6348"
  );
  script_osvdb_id(
    148246,
    152302,
    152453,
    152521,
    152709
  );

  script_name(english:"EulerOS 2.0 SP2 : kernel (EulerOS-SA-2017-1056)");
  script_summary(english:"Checks the rpm output for the updated packages.");

  script_set_attribute(attribute:"synopsis", value:
"The remote EulerOS host is missing multiple security updates.");
  script_set_attribute(attribute:"description", value:
"According to the versions of the kernel packages installed, the
EulerOS installation on the remote host is affected by the following
vulnerabilities :

  - A use-after-free flaw was found in the way the Linux
    kernel's Datagram Congestion Control Protocol (DCCP)
    implementation freed SKB (socket buffer) resources for
    a DCCP_PKT_REQUEST packet when the IPV6_RECVPKTINFO
    option is set on the socket. A local, unprivileged user
    could use this flaw to alter the kernel memory,
    allowing them to escalate their privileges on the
    system. (CVE-2017-6074)

  - The tcp_splice_read function in net/ipv4/tcp.c in the
    Linux kernel before 4.9.11 allows remote attackers to
    cause a denial of service (infinite loop and soft
    lockup) via vectors involving a TCP packet with the URG
    flag.(CVE-2017-6214)

  - The do_shmat function in ipc/shm.c in the Linux kernel
    through 4.9.12 does not restrict the address calculated
    by a certain rounding operation, which allows local
    users to map page zero, and consequently bypass a
    protection mechanism that exists for the mmap system
    call, by making crafted shmget and shmat system calls
    in a privileged context.(CVE-2017-5669)

  - The hashbin_delete function in net/irda/irqueue.c in
    the Linux kernel before 4.9.13 improperly manages lock
    dropping, which allows local users to cause a denial of
    service (deadlock) via crafted operations on IrDA
    devices.(CVE-2017-6348)

  - Race condition in kernel/events/core.c in the Linux
    kernel before 4.9.7 allows local users to gain
    privileges via a crafted application that makes
    concurrent perf_event_open system calls for moving a
    software group into a hardware context.(CVE-2017-6001)

Note that Tenable Network Security has extracted the preceding
description block directly from the EulerOS security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues.");
  # http://developer.huawei.com/ict/en/site-euleros/euleros/security-advisories/EulerOS-SA-2017-1056
  script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?a589f91d");
  script_set_attribute(attribute:"solution", value:
"Update the affected kernel packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:ND");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:H/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/03/16");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/05/02");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:kernel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:kernel-debug");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:kernel-debug-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:kernel-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:kernel-headers");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:kernel-tools");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:kernel-tools-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:perf");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:huawei:euleros:python-perf");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:huawei:euleros:2.0");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"Huawei Local Security Checks");

  script_copyright(english:"This script is Copyright (C) 2017 Tenable Network Security, Inc.");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/EulerOS/release", "Host/EulerOS/rpm-list", "Host/EulerOS/sp");

  exit(0);
}

include("audit.inc");
include("global_settings.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

release = get_kb_item("Host/EulerOS/release");
if (isnull(release) || release !~ "^EulerOS") audit(AUDIT_OS_NOT, "EulerOS");
if (release !~ "^EulerOS release 2\.0(\D|$)") audit(AUDIT_OS_NOT, "EulerOS 2.0");

sp = get_kb_item("Host/EulerOS/sp");
if (isnull(sp) || sp !~ "^(2)$") audit(AUDIT_OS_NOT, "EulerOS 2.0 SP2");

if (!get_kb_item("Host/EulerOS/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "EulerOS", cpu);

flag = 0;

pkgs = ["kernel-3.10.0-327.44.58.28",
        "kernel-debug-3.10.0-327.44.58.28",
        "kernel-debug-devel-3.10.0-327.44.58.28",
        "kernel-devel-3.10.0-327.44.58.28",
        "kernel-headers-3.10.0-327.44.58.28",
        "kernel-tools-3.10.0-327.44.58.28",
        "kernel-tools-libs-3.10.0-327.44.58.28",
        "perf-3.10.0-327.44.58.28",
        "python-perf-3.10.0-327.44.58.28"];

foreach (pkg in pkgs)
  if (rpm_check(release:"EulerOS-2.0", sp:"2", reference:pkg)) flag++;

if (flag)
{
  security_report_v4(
    port       : 0,
    severity   : SECURITY_HOLE,
    extra      : rpm_report_get()
  );
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "kernel");
}