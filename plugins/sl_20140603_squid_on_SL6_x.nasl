#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(74308);
  script_version("$Revision: 1.1 $");
  script_cvs_date("$Date: 2014/06/04 10:49:57 $");

  script_cve_id("CVE-2014-0128");

  script_name(english:"Scientific Linux Security Update : squid on SL6.x i386/x86_64");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Scientific Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A denial of service flaw was found in the way Squid processed certain
HTTPS requests when the SSL Bump feature was enabled. A remote
attacker could send specially crafted requests that could cause Squid
to crash. (CVE-2014-0128)

After installing this update, the squid service will be restarted
automatically."
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1406&L=scientific-linux-errata&T=0&P=426
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?a5f8427c"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected squid and / or squid-debuginfo packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/06/03");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/06/04");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL6", reference:"squid-3.1.10-20.el6_5.3")) flag++;
if (rpm_check(release:"SL6", reference:"squid-debuginfo-3.1.10-20.el6_5.3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");