#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2012-147.
#

include("compat.inc");

if (description)
{
  script_id(69637);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2015/01/30 14:43:52 $");

  script_cve_id("CVE-2012-3401", "CVE-2012-4447", "CVE-2012-4564", "CVE-2012-5581");
  script_xref(name:"ALAS", value:"2012-147");
  script_xref(name:"RHSA", value:"2012:1590");

  script_name(english:"Amazon Linux AMI : libtiff (ALAS-2012-147)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A heap-based buffer overflow flaw was found in the way libtiff
processed certain TIFF images using the Pixar Log Format encoding. An
attacker could create a specially crafted TIFF file that, when opened,
could cause an application using libtiff to crash or, possibly,
execute arbitrary code with the privileges of the user running the
application. (CVE-2012-4447)

A stack-based buffer overflow flaw was found in the way libtiff
handled DOTRANGE tags. An attacker could use this flaw to create a
specially crafted TIFF file that, when opened, would cause an
application linked against libtiff to crash or, possibly, execute
arbitrary code. (CVE-2012-5581)

A heap-based buffer overflow flaw was found in the tiff2pdf tool. An
attacker could use this flaw to create a specially crafted TIFF file
that would cause tiff2pdf to crash or, possibly, execute arbitrary
code. (CVE-2012-3401)

A missing return value check flaw, leading to a heap-based buffer
overflow, was found in the ppm2tiff tool. An attacker could use this
flaw to create a specially crafted PPM (Portable Pixel Map) file that
would cause ppm2tiff to crash or, possibly, execute arbitrary code.
(CVE-2012-4564)"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2012-147.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update libtiff' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libtiff");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libtiff-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libtiff-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libtiff-static");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2012/12/20");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/09/04");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"ALA", reference:"libtiff-3.9.4-9.11.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libtiff-debuginfo-3.9.4-9.11.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libtiff-devel-3.9.4-9.11.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libtiff-static-3.9.4-9.11.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "libtiff / libtiff-debuginfo / libtiff-devel / libtiff-static");
}
