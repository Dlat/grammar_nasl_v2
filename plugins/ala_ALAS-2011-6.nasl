#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2011-6.
#

include("compat.inc");

if (description)
{
  script_id(78267);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2015/01/30 14:55:42 $");

  script_cve_id("CVE-2011-3380");
  script_xref(name:"ALAS", value:"2011-6");
  script_xref(name:"RHSA", value:"2011:1356");

  script_name(english:"Amazon Linux AMI : openswan (ALAS-2011-6)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A NULL pointer dereference flaw was found in the way Openswan's pluto
IKE daemon handled certain error conditions. A remote, unauthenticated
attacker could send a specially crafted IKE packet that would crash
the pluto daemon."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2011-6.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update openswan' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:openswan");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:openswan-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:openswan-doc");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/10/10");
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
if (rpm_check(release:"ALA", reference:"openswan-2.6.36-1.12.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"openswan-debuginfo-2.6.36-1.12.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"openswan-doc-2.6.36-1.12.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "openswan / openswan-debuginfo / openswan-doc");
}