#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from openSUSE Security Update openSUSE-2015-476.
#
# The text description of this plugin is (C) SUSE LLC.
#

include("compat.inc");

if (description)
{
  script_id(84655);
  script_version("$Revision: 1.3 $");
  script_cvs_date("$Date: 2016/10/13 14:27:27 $");

  script_cve_id("CVE-2014-8127", "CVE-2014-8128", "CVE-2014-8129", "CVE-2014-8130", "CVE-2014-9655", "CVE-2015-1547");

  script_name(english:"openSUSE Security Update : tiff (openSUSE-2015-476)");
  script_summary(english:"Check for the openSUSE-2015-476 patch");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote openSUSE host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"tiff was updated to version 4.0.4 to fix six security issues found by
fuzzing initiatives.

These security issues were fixed :

  - CVE-2014-8127: Out-of-bounds write (bnc#914890).

  - CVE-2014-9655: Access of uninitialized memory
    (bnc#916927).

  - CVE-2014-8130: Out-of-bounds write (bnc#914890).

  - CVE-2015-1547: Use of uninitialized memory in NeXTDecode
    (bnc#916925).

  - CVE-2014-8129: Out-of-bounds write (bnc#914890).

  - CVE-2014-8128: Out-of-bounds write (bnc#914890)."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.opensuse.org/show_bug.cgi?id=914890"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.opensuse.org/show_bug.cgi?id=916925"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.opensuse.org/show_bug.cgi?id=916927"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected tiff packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:N/I:N/A:H");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:libtiff-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:libtiff-devel-32bit");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:libtiff5");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:libtiff5-32bit");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:libtiff5-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:libtiff5-debuginfo-32bit");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:tiff");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:tiff-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:tiff-debugsource");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:novell:opensuse:13.1");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:novell:opensuse:13.2");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/07/01");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/07/13");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015-2016 Tenable Network Security, Inc.");
  script_family(english:"SuSE Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/SuSE/release", "Host/SuSE/rpm-list", "Host/cpu");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/SuSE/release");
if (isnull(release) || release =~ "^(SLED|SLES)") audit(AUDIT_OS_NOT, "openSUSE");
if (release !~ "^(SUSE13\.1|SUSE13\.2)$") audit(AUDIT_OS_RELEASE_NOT, "openSUSE", "13.1 / 13.2", release);
if (!get_kb_item("Host/SuSE/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

ourarch = get_kb_item("Host/cpu");
if (!ourarch) audit(AUDIT_UNKNOWN_ARCH);
if (ourarch !~ "^(i586|i686|x86_64)$") audit(AUDIT_ARCH_NOT, "i586 / i686 / x86_64", ourarch);

flag = 0;

if ( rpm_check(release:"SUSE13.1", reference:"libtiff-devel-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"libtiff5-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"libtiff5-debuginfo-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"tiff-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"tiff-debuginfo-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"tiff-debugsource-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", cpu:"x86_64", reference:"libtiff-devel-32bit-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", cpu:"x86_64", reference:"libtiff5-32bit-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", cpu:"x86_64", reference:"libtiff5-debuginfo-32bit-4.0.4-8.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"libtiff-devel-4.0.4-10.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"libtiff5-4.0.4-10.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"libtiff5-debuginfo-4.0.4-10.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"tiff-4.0.4-10.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"tiff-debuginfo-4.0.4-10.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"tiff-debugsource-4.0.4-10.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", cpu:"x86_64", reference:"libtiff-devel-32bit-4.0.4-10.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", cpu:"x86_64", reference:"libtiff5-32bit-4.0.4-10.10.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", cpu:"x86_64", reference:"libtiff5-debuginfo-32bit-4.0.4-10.10.1") ) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "libtiff-devel-32bit / libtiff-devel / libtiff5-32bit / libtiff5 / etc");
}