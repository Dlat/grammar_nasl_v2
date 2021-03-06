#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Oracle Linux Security Advisory ELSA-2013-2538.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(68978);
  script_version("$Revision: 1.8 $");
  script_cvs_date("$Date: 2015/12/01 17:25:13 $");

  script_cve_id("CVE-2012-6548", "CVE-2013-0914", "CVE-2013-2634", "CVE-2013-2635", "CVE-2013-2852", "CVE-2013-3222", "CVE-2013-3224", "CVE-2013-3225", "CVE-2013-3301");
  script_bugtraq_id(58426, 58597, 58994, 59055, 59377, 59383, 59385, 60410);

  script_name(english:"Oracle Linux 5 / 6 : Unbreakable Enterprise kernel (ELSA-2013-2538)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Oracle Linux host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Description of changes:

[2.6.39-400.109.3.el6uek]
- Revert 'be2net: enable interrupts in probe' (Jerry Snitselaar) 
[Orabug: 17179597]

[2.6.39-400.109.2.el6uek]
- be2net: enable interrupts in probe (Jerry Snitselaar) [Orabug: 
17080364] - Bluetooth: RFCOMM - Fix missing msg_namelen update in 
rfcomm_sock_recvmsg() (Mathias Krause) [Orabug: 17173830] {CVE-2013-3225}
- Bluetooth: fix possible info leak in bt_sock_recvmsg() (Mathias 
Krause) [Orabug: 17173830] {CVE-2013-3224}
- atm: update msg_namelen in vcc_recvmsg() (Mathias Krause) [Orabug: 
17173830] {CVE-2013-3222}
- rtnl: fix info leak on RTM_GETLINK request for VF devices (Mathias 
Krause) [Orabug: 17173830] {CVE-2013-2635}
- dcbnl: fix various netlink info leaks (Mathias Krause) [Orabug: 
17173830] {CVE-2013-2634}
- udf: avoid info leak on export (Mathias Krause) [Orabug: 17173830] 
{CVE-2012-6548}
- tracing: Fix possible NULL pointer dereferences (Namhyung Kim) 
[Orabug: 17173830] {CVE-2013-3301}
- b43: stop format string leaking into error msgs (Kees Cook) [Orabug: 
17173830] {CVE-2013-2852}
- signal: always clear sa_restorer on execve (Kees Cook) [Orabug: 
17173830] {CVE-2013-0914}"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://oss.oracle.com/pipermail/el-errata/2013-July/003588.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://oss.oracle.com/pipermail/el-errata/2013-July/003589.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected unbreakable enterprise kernel packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-debug");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-debug-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-firmware");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:linux:5");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:linux:6");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/07/18");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/07/19");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2015 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(5|6)([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Oracle Linux 5 / 6", "Oracle Linux " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && "ia64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Oracle Linux", cpu);

flag = 0;
if (rpm_exists(release:"EL5", rpm:"kernel-uek-2.6.39") && rpm_check(release:"EL5", reference:"kernel-uek-2.6.39-400.109.3.el5uek")) flag++;
if (rpm_exists(release:"EL5", rpm:"kernel-uek-debug-2.6.39") && rpm_check(release:"EL5", reference:"kernel-uek-debug-2.6.39-400.109.3.el5uek")) flag++;
if (rpm_exists(release:"EL5", rpm:"kernel-uek-debug-devel-2.6.39") && rpm_check(release:"EL5", reference:"kernel-uek-debug-devel-2.6.39-400.109.3.el5uek")) flag++;
if (rpm_exists(release:"EL5", rpm:"kernel-uek-devel-2.6.39") && rpm_check(release:"EL5", reference:"kernel-uek-devel-2.6.39-400.109.3.el5uek")) flag++;
if (rpm_exists(release:"EL5", rpm:"kernel-uek-doc-2.6.39") && rpm_check(release:"EL5", reference:"kernel-uek-doc-2.6.39-400.109.3.el5uek")) flag++;
if (rpm_exists(release:"EL5", rpm:"kernel-uek-firmware-2.6.39") && rpm_check(release:"EL5", reference:"kernel-uek-firmware-2.6.39-400.109.3.el5uek")) flag++;

if (rpm_exists(release:"EL6", rpm:"kernel-uek-2.6.39") && rpm_check(release:"EL6", reference:"kernel-uek-2.6.39-400.109.3.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-debug-2.6.39") && rpm_check(release:"EL6", reference:"kernel-uek-debug-2.6.39-400.109.3.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-debug-devel-2.6.39") && rpm_check(release:"EL6", reference:"kernel-uek-debug-devel-2.6.39-400.109.3.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-devel-2.6.39") && rpm_check(release:"EL6", reference:"kernel-uek-devel-2.6.39-400.109.3.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-doc-2.6.39") && rpm_check(release:"EL6", reference:"kernel-uek-doc-2.6.39-400.109.3.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-firmware-2.6.39") && rpm_check(release:"EL6", reference:"kernel-uek-firmware-2.6.39-400.109.3.el6uek")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "affected kernel");
}
