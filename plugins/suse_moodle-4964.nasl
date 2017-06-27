#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from openSUSE Security Update moodle-4964.
#
# The text description of this plugin is (C) SUSE LLC.
#

include("compat.inc");

if (description)
{
  script_id(30181);
  script_version ("$Revision: 1.6 $");
  script_cvs_date("$Date: 2014/06/13 20:31:03 $");

  script_cve_id("CVE-2008-0123");

  script_name(english:"openSUSE 10 Security Update : moodle (moodle-4964)");
  script_summary(english:"Check for the moodle-4964 patch");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote openSUSE host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The install script of moodle is vulnerable to cross site scripting
(XSS). This flaw is only exploitable if moodle isn't fully installed
yet. Therefore it's unlikely to be much of a problem in practice. To
actually exploit it an attacker would have to know about a person that
is just about to install moodle (CVE-2008-0123)."
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected moodle packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cwe_id(79);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-af");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ar");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-be");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-bg");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-bs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ca");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-cs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-da");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-de");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-de_du");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-el");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-es");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-et");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-eu");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-fa");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-fi");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-fr");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ga");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-gl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-he");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-hi");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-hr");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-hu");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-id");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-is");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-it");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ja");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ka");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-km");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-kn");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ko");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-lt");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-lv");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-mi_tn");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ms");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-nl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-nn");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-no");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-pl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-pt");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ro");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-ru");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-sk");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-sl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-so");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-sq");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-sr");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-sv");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-th");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-tl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-tr");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-uk");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-vi");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:moodle-zh_cn");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:novell:opensuse:10.2");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:novell:opensuse:10.3");

  script_set_attribute(attribute:"patch_publication_date", value:"2008/01/31");
  script_set_attribute(attribute:"plugin_publication_date", value:"2008/02/05");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2008-2014 Tenable Network Security, Inc.");
  script_family(english:"SuSE Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/SuSE/release", "Host/SuSE/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/SuSE/release");
if (isnull(release) || release =~ "^(SLED|SLES)") audit(AUDIT_OS_NOT, "openSUSE");
if (release !~ "^(SUSE10\.2|SUSE10\.3)$") audit(AUDIT_OS_RELEASE_NOT, "openSUSE", "10.2 / 10.3", release);
if (!get_kb_item("Host/SuSE/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);



flag = 0;

if ( rpm_check(release:"SUSE10.2", reference:"moodle-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-af-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ar-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-be-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-bg-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-bs-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ca-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-cs-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-da-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-de-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-el-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-es-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-et-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-eu-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-fa-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-fi-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-fr-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ga-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-gl-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-he-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-hi-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-hr-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-hu-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-id-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-is-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-it-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ja-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ka-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-km-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-kn-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ko-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-lt-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-lv-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-mi_tn-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ms-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-nl-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-nn-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-no-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-pl-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-pt-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ro-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-ru-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-sk-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-sl-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-so-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-sq-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-sr-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-sv-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-th-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-tl-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-tr-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-uk-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-vi-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.2", reference:"moodle-zh_cn-1.7.2-0.3") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-af-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ar-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-be-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-bg-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-bs-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ca-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-cs-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-da-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-de-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-de_du-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-el-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-es-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-et-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-eu-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-fa-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-fi-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-fr-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ga-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-gl-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-he-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-hi-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-hr-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-hu-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-id-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-is-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-it-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ja-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ka-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-km-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-kn-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ko-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-lt-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-lv-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-mi_tn-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ms-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-nl-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-nn-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-no-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-pl-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-pt-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ro-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-ru-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-sk-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-sl-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-so-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-sq-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-sr-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-sv-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-th-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-tl-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-tr-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-uk-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-vi-1.8.2-17.2") ) flag++;
if ( rpm_check(release:"SUSE10.3", reference:"moodle-zh_cn-1.8.2-17.2") ) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "moodle / moodle-af / moodle-ar / moodle-be / moodle-bg / moodle-bs / etc");
}