#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandriva Linux Security Advisory MDVSA-2012:093. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(59519);
  script_version("$Revision: 1.12 $");
  script_cvs_date("$Date: 2014/08/16 19:14:48 $");

  script_cve_id("CVE-2012-2143", "CVE-2012-2386");
  script_bugtraq_id(47545, 53729);
  script_xref(name:"MDVSA", value:"2012:093");

  script_name(english:"Mandriva Linux Security Advisory : php (MDVSA-2012:093)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Mandriva Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Multiple vulnerabilities has been identified and fixed in php :

There is a programming error in the DES implementation used in crypt()
in ext/standard/crypt_freesec.c when handling input which contains
characters that can not be represented with 7-bit ASCII. When the
input contains characters with only the most significant bit set
(0x80), that character and all characters after it will be ignored
(CVE-2012-2143).

An integer overflow, leading to heap-based buffer overflow was found
in the way Phar extension of the PHP scripting language processed
certain fields by manipulating TAR files. A remote attacker could
provide a specially crafted TAR archive file, which once processed in
an PHP application using the Phar extension could lead to denial of
service (application crash), or, potentially arbitary code execution
with the privileges of the user running the application
(CVE-2012-2386).

The updated php packages have been upgraded to the 5.3.14 version
which is not vulnerable to these issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://secunia.com/advisories/44335"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.php.net/ChangeLog-5.php#5.3.14"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:apache-mod_php");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lib64php5_common5");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:libphp5_common5");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-bcmath");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-bz2");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-calendar");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-cgi");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-cli");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-ctype");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-curl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-dba");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-dom");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-enchant");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-exif");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-fileinfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-filter");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-fpm");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-ftp");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-gd");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-gettext");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-gmp");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-hash");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-iconv");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-imap");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-ini");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-intl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-json");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-ldap");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-mbstring");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-mcrypt");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-mssql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-mysql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-mysqli");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-mysqlnd");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-odbc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-openssl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pcntl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pdo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pdo_dblib");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pdo_mysql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pdo_odbc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pdo_pgsql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pdo_sqlite");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pgsql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-phar");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-posix");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-pspell");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-readline");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-recode");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-session");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-shmop");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-snmp");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-soap");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-sockets");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-sqlite");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-sqlite3");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-sybase_ct");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-sysvmsg");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-sysvsem");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-sysvshm");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-tidy");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-tokenizer");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-wddx");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-xml");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-xmlreader");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-xmlrpc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-xmlwriter");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-xsl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-zip");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:php-zlib");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:linux:2010.1");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:linux:2011");

  script_set_attribute(attribute:"patch_publication_date", value:"2012/06/15");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/06/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2014 Tenable Network Security, Inc.");
  script_family(english:"Mandriva Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/Mandrake/release", "Host/Mandrake/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/Mandrake/release")) audit(AUDIT_OS_NOT, "Mandriva / Mandake Linux");
if (!get_kb_item("Host/Mandrake/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu !~ "^(amd64|i[3-6]86|x86_64)$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Mandriva / Mandrake Linux", cpu);


flag = 0;
if (rpm_check(release:"MDK2010.1", reference:"apache-mod_php-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", cpu:"x86_64", reference:"lib64php5_common5-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", cpu:"i386", reference:"libphp5_common5-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-bcmath-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-bz2-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-calendar-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-cgi-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-cli-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-ctype-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-curl-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-dba-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-devel-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-doc-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-dom-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-enchant-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-exif-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-fileinfo-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-filter-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-fpm-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-ftp-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-gd-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-gettext-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-gmp-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-hash-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-iconv-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-imap-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-ini-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-intl-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-json-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-ldap-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-mbstring-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-mcrypt-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-mssql-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-mysql-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-mysqli-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-mysqlnd-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-odbc-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-openssl-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pcntl-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pdo-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pdo_dblib-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pdo_mysql-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pdo_odbc-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pdo_pgsql-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pdo_sqlite-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pgsql-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-phar-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-posix-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-pspell-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-readline-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-recode-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-session-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-shmop-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-snmp-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-soap-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-sockets-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-sqlite-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-sqlite3-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-sybase_ct-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-sysvmsg-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-sysvsem-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-sysvshm-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-tidy-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-tokenizer-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-wddx-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-xml-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-xmlreader-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-xmlrpc-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-xmlwriter-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-xsl-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-zip-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"php-zlib-5.3.14-0.1mdv2010.2", yank:"mdv")) flag++;

if (rpm_check(release:"MDK2011", reference:"apache-mod_php-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", cpu:"x86_64", reference:"lib64php5_common5-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", cpu:"i386", reference:"libphp5_common5-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-bcmath-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-bz2-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-calendar-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-cgi-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-cli-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-ctype-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-curl-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-dba-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-devel-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-doc-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-dom-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-enchant-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-exif-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-fileinfo-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-filter-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-fpm-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-ftp-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-gd-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-gettext-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-gmp-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-hash-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-iconv-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-imap-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-ini-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-intl-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-json-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-ldap-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-mbstring-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-mcrypt-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-mssql-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-mysql-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-mysqli-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-mysqlnd-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-odbc-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-openssl-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pcntl-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pdo-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pdo_dblib-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pdo_mysql-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pdo_odbc-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pdo_pgsql-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pdo_sqlite-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pgsql-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-phar-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-posix-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-pspell-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-readline-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-recode-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-session-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-shmop-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-snmp-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-soap-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-sockets-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-sqlite-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-sqlite3-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-sybase_ct-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-sysvmsg-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-sysvsem-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-sysvshm-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-tidy-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-tokenizer-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-wddx-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-xml-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-xmlreader-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-xmlrpc-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-xmlwriter-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-xsl-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-zip-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"php-zlib-5.3.14-0.1-mdv2011.0", yank:"mdv")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");