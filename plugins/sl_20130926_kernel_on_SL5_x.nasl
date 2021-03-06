#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(70188);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2013/10/04 10:47:22 $");

  script_cve_id("CVE-2012-3511", "CVE-2013-2141", "CVE-2013-4162");

  script_name(english:"Scientific Linux Security Update : kernel on SL5.x i386/x86_64");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Scientific Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"This update fixes the following security issues :

  - A use-after-free flaw was found in the madvise() system
    call implementation in the Linux kernel. A local,
    unprivileged user could use this flaw to cause a denial
    of service or, potentially, escalate their privileges.
    (CVE-2012-3511, Moderate)

  - A flaw was found in the way the Linux kernel's TCP/IP
    protocol suite implementation handled IPv6 sockets that
    used the UDP_CORK option. A local, unprivileged user
    could use this flaw to cause a denial of service.
    (CVE-2013-4162, Moderate)

  - An information leak flaw in the Linux kernel could allow
    a local, unprivileged user to leak kernel memory to
    user-space. (CVE-2013-2141, Low)

This update also fixes the following bugs :

  - A bug in the be2net driver prevented communication
    between NICs using be2net. This update applies a patch
    addressing this problem along with several other
    upstream patches that fix various other problems.
    Traffic between NICs using the be2net driver now
    proceeds as expected.

  - A recent patch fixing a problem that prevented
    communication between NICs using the be2net driver
    caused the firmware of NICs to become unresponsive, and
    thus triggered a kernel panic. The problem was caused by
    unnecessary usage of a hardware workaround that allows
    skipping VLAN tag insertion. A patch has been applied
    and the workaround is now used only when the
    multi-channel configuration is enabled on the NIC. Note
    that the bug only affected the NICs with firmware
    version 4.2.xxxx.

  - A bug in the autofs4 mount expiration code could cause
    the autofs4 module to falsely report a busy tree of NFS
    mounts as 'not in use'. Consequently, automount
    attempted to unmount the tree and failed with a 'failed
    to umount offset' error, leaving the mount tree to
    appear as empty directories. A patch has been applied to
    remove an incorrectly used autofs dentry mount check and
    the aforementioned problem no longer occurs.

  - A race condition in the be_open function in the be2net
    driver could trigger the BUG_ON() macro, which resulted
    in a kernel panic. A patch addressing this problem has
    been applied and the race condition is now avoided by
    enabling polling before enabling interrupts globally.
    The kernel no longer panics in this situation.

The system must be rebooted for this update to take effect."
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1309&L=scientific-linux-errata&T=0&P=1828
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?8eb452e1"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:H/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/09/26");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/09/28");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013 Tenable Network Security, Inc.");
  script_family(english:"Scientific Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Scientific Linux " >!< release) audit(AUDIT_HOST_NOT, "running Scientific Linux");
if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu >!< "x86_64" && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Scientific Linux", cpu);


flag = 0;
if (rpm_check(release:"SL5", reference:"kernel-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", cpu:"i386", reference:"kernel-PAE-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", cpu:"i386", reference:"kernel-PAE-debuginfo-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", cpu:"i386", reference:"kernel-PAE-devel-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-debug-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-debug-debuginfo-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-debug-devel-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-debuginfo-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-debuginfo-common-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-devel-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-doc-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-headers-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-xen-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-xen-debuginfo-2.6.18-348.18.1.el5")) flag++;
if (rpm_check(release:"SL5", reference:"kernel-xen-devel-2.6.18-348.18.1.el5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
