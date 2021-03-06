#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(100097);
  script_version("$Revision: 3.1 $");
  script_cvs_date("$Date: 2017/05/10 13:37:30 $");

  script_cve_id("CVE-2016-9603", "CVE-2017-2633", "CVE-2017-7718", "CVE-2017-7980");

  script_name(english:"Scientific Linux Security Update : qemu-kvm on SL6.x i386/x86_64");
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
"Security Fix(es) :

  - A heap buffer overflow flaw was found in QEMU's Cirrus
    CLGD 54xx VGA emulator's VNC display driver support; the
    issue could occur when a VNC client attempted to update
    its display after a VGA operation is performed by a
    guest. A privileged user/process inside a guest could
    use this flaw to crash the QEMU process or, potentially,
    execute arbitrary code on the host with privileges of
    the QEMU process. (CVE-2016-9603)

  - An out-of-bounds r/w access issue was found in QEMU's
    Cirrus CLGD 54xx VGA Emulator support. The vulnerability
    could occur while copying VGA data via various bitblt
    functions. A privileged user inside a guest could use
    this flaw to crash the QEMU process or, potentially,
    execute arbitrary code on the host with privileges of
    the QEMU process. (CVE-2017-7980)

  - An out-of-bounds memory access issue was found in QEMU's
    VNC display driver support. The vulnerability could
    occur while refreshing the VNC display surface area in
    the 'vnc_refresh_server_surface'. A user/process inside
    a guest could use this flaw to crash the QEMU process,
    resulting in a denial of service. (CVE-2017-2633)

  - An out-of-bounds access issue was found in QEMU's Cirrus
    CLGD 54xx VGA Emulator support. The vulnerability could
    occur while copying VGA data using bitblt functions (for
    example, cirrus_bitblt_rop_fwd_transp_). A privileged
    user inside a guest could use this flaw to crash the
    QEMU process, resulting in denial of service.
    (CVE-2017-7718)"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1705&L=scientific-linux-errata&F=&S=&P=3656
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?486e56e5"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:N/I:N/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/05/09");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/05/10");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2017 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL6", reference:"qemu-guest-agent-0.12.1.2-2.503.el6_9.3")) flag++;
if (rpm_check(release:"SL6", cpu:"x86_64", reference:"qemu-img-0.12.1.2-2.503.el6_9.3")) flag++;
if (rpm_check(release:"SL6", cpu:"x86_64", reference:"qemu-kvm-0.12.1.2-2.503.el6_9.3")) flag++;
if (rpm_check(release:"SL6", reference:"qemu-kvm-debuginfo-0.12.1.2-2.503.el6_9.3")) flag++;
if (rpm_check(release:"SL6", cpu:"x86_64", reference:"qemu-kvm-tools-0.12.1.2-2.503.el6_9.3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_note(port:0, extra:rpm_report_get());
  else security_note(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
