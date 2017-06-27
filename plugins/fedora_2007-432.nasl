#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2007-432.
#

include("compat.inc");

if (description)
{
  script_id(25047);
  script_version ("$Revision: 1.12 $");
  script_cvs_date("$Date: 2015/10/21 22:04:02 $");

  script_xref(name:"FEDORA", value:"2007-432");

  script_name(english:"Fedora Core 6 : kernel-2.6.20-1.2944.fc6 (2007-432)");
  script_summary(english:"Checks rpm output for the updated packages.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora Core host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated to upstream linux kernel 2.6.20.6:
http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.20.5
http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.20.6

CVE-2007-1357: The atalk_sum_skb function in AppleTalk for Linux
kernel 2.6.x before 2.6.21, and possibly 2.4.x, allows remote
attackers to cause a denial of service (crash) via an AppleTalk frame
that is shorter than the specified length, which triggers a BUG_ON
call when an attempt is made to perform a checksum.

CVSS Severity: 3.3 (Low) 

Plus additional fixes: Bugfix for ATI SB600 SATA Routing bugfix Libata
LBA48 bugfix Update libata NCQ blacklist Libata request sense bugfix
SCSI error handler fix

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.20.5"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.20.6"
  );
  # https://lists.fedoraproject.org/pipermail/package-announce/2007-April/001663.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?4a46741a"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-PAE");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-PAE-debug");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-PAE-debug-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-PAE-debug-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-PAE-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-PAE-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-debug");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-debug-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-debug-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-debuginfo-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-headers");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-kdump");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-kdump-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-kdump-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-xen");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-xen-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:kernel-xen-devel");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora_core:6");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/04/13");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/04/19");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2015 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^6([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 6.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC6", reference:"kernel-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", cpu:"i386", reference:"kernel-PAE-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", cpu:"i386", reference:"kernel-PAE-debug-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", cpu:"i386", reference:"kernel-PAE-debug-debuginfo-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", cpu:"i386", reference:"kernel-PAE-debug-devel-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", cpu:"i386", reference:"kernel-PAE-debuginfo-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", cpu:"i386", reference:"kernel-PAE-devel-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-debug-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-debug-debuginfo-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-debug-devel-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-debuginfo-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-debuginfo-common-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-devel-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-doc-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-headers-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-kdump-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-kdump-debuginfo-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-kdump-devel-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-xen-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-xen-debuginfo-2.6.20-1.2944.fc6")) flag++;
if (rpm_check(release:"FC6", reference:"kernel-xen-devel-2.6.20-1.2944.fc6")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "kernel / kernel-PAE / kernel-PAE-debug / kernel-PAE-debug-debuginfo / etc");
}