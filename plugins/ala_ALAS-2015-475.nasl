#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2015-475.
#

include("compat.inc");

if (description)
{
  script_id(81321);
  script_version("$Revision: 1.9 $");
  script_cvs_date("$Date: 2015/10/05 13:44:21 $");

  script_cve_id("CVE-2014-9427", "CVE-2015-0231", "CVE-2015-0232");
  script_xref(name:"ALAS", value:"2015-475");

  script_name(english:"Amazon Linux AMI : php54 (ALAS-2015-475)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"sapi/cgi/cgi_main.c in the CGI component in PHP through 5.4.36, 5.5.x
through 5.5.20, and 5.6.x through 5.6.4, when mmap is used to read a
.php file, does not properly consider the mapping's length during
processing of an invalid file that begins with a # character and lacks
a newline character, which causes an out-of-bounds read and might (1)
allow remote attackers to obtain sensitive information from php-cgi
process memory by leveraging the ability to upload a .php file or (2)
trigger unexpected code execution if a valid PHP script is present in
memory locations adjacent to the mapping. (CVE-2014-9427)

Use-after-free vulnerability in the process_nested_data function in
ext/standard/var_unserializer.re in PHP before 5.4.37, 5.5.x before
5.5.21, and 5.6.x before 5.6.5 allows remote attackers to execute
arbitrary code via a crafted unserialize call that leverages improper
handling of duplicate numerical keys within the serialized properties
of an object. NOTE: this vulnerability exists because of an incomplete
fix for CVE-2014-8142 . (CVE-2015-0231)

The exif_process_unicode function in ext/exif/exif.c in PHP before
5.4.37, 5.5.x before 5.5.21, and 5.6.x before 5.6.5 allows remote
attackers to execute arbitrary code or cause a denial of service
(uninitialized pointer free and application crash) via crafted EXIF
data in a JPEG image. (CVE-2015-0232)"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2015-475.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update php54' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-bcmath");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-cli");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-dba");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-embedded");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-enchant");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-fpm");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-gd");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-imap");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-intl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-ldap");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-mbstring");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-mcrypt");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-mssql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-mysql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-mysqlnd");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-odbc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-pdo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-pgsql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-process");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-pspell");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-recode");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-snmp");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-soap");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-tidy");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-xml");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:php54-xmlrpc");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/02/11");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/02/13");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"ALA", reference:"php54-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-bcmath-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-cli-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-common-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-dba-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-debuginfo-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-devel-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-embedded-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-enchant-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-fpm-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-gd-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-imap-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-intl-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-ldap-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-mbstring-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-mcrypt-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-mssql-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-mysql-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-mysqlnd-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-odbc-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-pdo-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-pgsql-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-process-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-pspell-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-recode-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-snmp-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-soap-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-tidy-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-xml-5.4.37-1.65.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"php54-xmlrpc-5.4.37-1.65.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "php54 / php54-bcmath / php54-cli / php54-common / php54-dba / etc");
}