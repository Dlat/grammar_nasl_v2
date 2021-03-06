#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2011-11.
#

include("compat.inc");

if (description)
{
  script_id(69570);
  script_version("$Revision: 1.4 $");
  script_cvs_date("$Date: 2015/01/30 14:43:52 $");

  script_cve_id("CVE-2011-3869", "CVE-2011-3870", "CVE-2011-3871");
  script_xref(name:"ALAS", value:"2011-11");

  script_name(english:"Amazon Linux AMI : puppet (ALAS-2011-11)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Puppet 2.7.x before 2.7.5, 2.6.x before 2.6.11, and 0.25.x, when
running in --edit mode, uses a predictable file name, which allows
local users to run arbitrary Puppet code or trick a user into editing
arbitrary files.

Puppet 2.7.x before 2.7.5, 2.6.x before 2.6.11, and 0.25.x allows
local users to modify the permissions of arbitrary files via a symlink
attack on the SSH authorized_keys file.

Puppet 2.7.x before 2.7.5, 2.6.x before 2.6.11, and 0.25.x allows
local users to overwrite arbitrary files via a symlink attack on the
.k5login file."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2011-11.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update puppet' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:N/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:puppet");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:puppet-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:puppet-server");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/10/31");
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
if (rpm_check(release:"ALA", reference:"puppet-2.6.6-3.2.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"puppet-debuginfo-2.6.6-3.2.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"puppet-server-2.6.6-3.2.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "puppet / puppet-debuginfo / puppet-server");
}
