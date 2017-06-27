#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(61004);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2014/08/16 19:42:09 $");

  script_cve_id("CVE-2011-1098", "CVE-2011-1154", "CVE-2011-1155");

  script_name(english:"Scientific Linux Security Update : logrotate on SL6.x i386/x86_64");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Scientific Linux host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A shell command injection flaw was found in the way logrotate handled
the shred directive. A specially crafted log file could cause
logrotate to execute arbitrary commands with the privileges of the
user running logrotate (root, by default). Note: The shred directive
is not enabled by default. (CVE-2011-1154)

A race condition flaw was found in the way logrotate applied
permissions when creating new log files. In some specific
configurations, a local attacker could use this flaw to open new log
files before logrotate applies the final permissions, possibly leading
to the disclosure of sensitive information. (CVE-2011-1098)

An input sanitization flaw was found in logrotate. A log file with a
specially crafted file name could cause logrotate to abort when
attempting to process that file a subsequent time. (CVE-2011-1155)"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1104&L=scientific-linux-errata&T=0&P=204
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?c6ccb5bb"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected logrotate package."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/03/31");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/08/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2014 Tenable Network Security, Inc.");
  script_family(english:"Scientific Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Scientific Linux " >!< release) audit(AUDIT_HOST_NOT, "running Scientific Linux");
if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu >!< "x86_64" && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Scientific Linux", cpu);


flag = 0;
if (rpm_check(release:"SL6", reference:"logrotate-3.7.8-12.el6_0.1")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");