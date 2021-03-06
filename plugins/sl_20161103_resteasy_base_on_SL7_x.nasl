#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(95859);
  script_version("$Revision: 3.1 $");
  script_cvs_date("$Date: 2016/12/15 14:46:41 $");

  script_cve_id("CVE-2016-7050");

  script_name(english:"Scientific Linux Security Update : resteasy-base on SL7.x (noarch)");
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
"Security Fix(es) :

  - It was discovered that under certain conditions RESTEasy
    could be forced to parse a request with
    SerializableProvider, resulting in deserialization of
    potentially untrusted data. An attacker could possibly
    use this flaw to execute arbitrary code with the
    permissions of the application using RESTEasy.
    (CVE-2016-7050)

Additional Changes :"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1612&L=scientific-linux-errata&F=&S=&P=2024
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?817ad0c7"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/11/03");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/12/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL7", reference:"resteasy-base-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-atom-provider-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-client-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-jackson-provider-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-javadoc-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-jaxb-provider-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-jaxrs-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-jaxrs-all-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-jaxrs-api-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-jettison-provider-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-providers-pom-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-resteasy-pom-3.0.6-4.el7")) flag++;
if (rpm_check(release:"SL7", reference:"resteasy-base-tjws-3.0.6-4.el7")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
