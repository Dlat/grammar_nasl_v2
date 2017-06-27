#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2014-335.
#

include("compat.inc");

if (description)
{
  script_id(78278);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2015/01/30 14:55:42 $");

  script_cve_id("CVE-2013-5705");
  script_xref(name:"ALAS", value:"2014-335");

  script_name(english:"Amazon Linux AMI : mod_security (ALAS-2014-335)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"apache2/modsecurity.c in ModSecurity before 2.7.6 allows remote
attackers to bypass rules by using chunked transfer coding with a
capitalized Chunked value in the Transfer-Encoding HTTP header."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2014-335.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update mod_security' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:N");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mlogc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mod_security");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:mod_security-debuginfo");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/05/06");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/10/12");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"ALA", reference:"mlogc-2.7.3-3.23.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mod_security-2.7.3-3.23.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"mod_security-debuginfo-2.7.3-3.23.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "mlogc / mod_security / mod_security-debuginfo");
}