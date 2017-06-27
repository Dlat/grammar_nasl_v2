#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2016-737.
#

include("compat.inc");

if (description)
{
  script_id(93015);
  script_version("$Revision: 2.3 $");
  script_cvs_date("$Date: 2016/10/07 15:17:42 $");

  script_cve_id("CVE-2016-3459", "CVE-2016-3477", "CVE-2016-3486", "CVE-2016-3501", "CVE-2016-3521", "CVE-2016-3614", "CVE-2016-3615", "CVE-2016-5439", "CVE-2016-5440");
  script_xref(name:"ALAS", value:"2016-737");

  script_name(english:"Amazon Linux AMI : mysql56 (ALAS-2016-737)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
remote administrators to affect availability via vectors related to
Server: RBR. (CVE-2016-5440)

Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
remote administrators to affect availability via vectors related to
Server: InnoDB. (CVE-2016-3459)

Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
remote administrators to affect availability via vectors related to
Server: Privileges. (CVE-2016-5439)

Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
local users to affect confidentiality, integrity, and availability via
vectors related to Server: Parser. (CVE-2016-3477)

Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
remote authenticated users to affect availability via vectors related
to Server: Security: Encryption. (CVE-2016-3614)

Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
remote authenticated users to affect availability via vectors related
to Server: DML. (CVE-2016-3615)

Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
remote authenticated users to affect availability via vectors related
to Server: Types. (CVE-2016-3521)

Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
remote authenticated users to affect availability via vectors related
to Server: FTS. (CVE-2016-3486)

Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows
remote authenticated users to affect availability via vectors related
to Server: Optimizer. (CVE-2016-3501)"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2016-737.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update mysql56' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-bench");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-embedded");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-embedded-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-errmsg");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-server");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mysql56-test");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/08/17");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/08/18");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
  script_family(english:"Amazon Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/AmazonLinux/release", "Host/AmazonLinux/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/AmazonLinux/release")) audit(AUDIT_OS_NOT, "Amazon Linux AMI");
if (!get_kb_item("Host/AmazonLinux/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);


flag = 0;
if (rpm_check(release:"ALA", reference:"mysql56-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-bench-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-common-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-debuginfo-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-devel-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-embedded-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-embedded-devel-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-errmsg-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-libs-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-server-5.6.32-1.16.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mysql56-test-5.6.32-1.16.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "mysql56 / mysql56-bench / mysql56-common / mysql56-debuginfo / etc");
}