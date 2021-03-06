#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(77981);
  script_version("$Revision: 1.1 $");
  script_cvs_date("$Date: 2014/09/30 13:19:10 $");

  script_cve_id("CVE-2013-4002");

  script_name(english:"Scientific Linux Security Update : xerces-j2 on SL6.x i386/x86_64");
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
"A resource consumption issue was found in the way Xerces-J handled XML
declarations. A remote attacker could use an XML document with a
specially crafted declaration using a long pseudo-attribute name that,
when parsed by an application using Xerces-J, would cause that
application to use an excessive amount of CPU. (CVE-2013-4002)

Applications using the Xerces-J must be restarted for this update to
take effect."
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1409&L=scientific-linux-errata&T=0&P=2369
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?323e659a"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/09/29");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/09/30");
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
if (rpm_check(release:"SL6", reference:"xerces-j2-2.7.1-12.7.el6_5")) flag++;
if (rpm_check(release:"SL6", reference:"xerces-j2-debuginfo-2.7.1-12.7.el6_5")) flag++;
if (rpm_check(release:"SL6", reference:"xerces-j2-demo-2.7.1-12.7.el6_5")) flag++;
if (rpm_check(release:"SL6", reference:"xerces-j2-javadoc-apis-2.7.1-12.7.el6_5")) flag++;
if (rpm_check(release:"SL6", reference:"xerces-j2-javadoc-impl-2.7.1-12.7.el6_5")) flag++;
if (rpm_check(release:"SL6", reference:"xerces-j2-javadoc-other-2.7.1-12.7.el6_5")) flag++;
if (rpm_check(release:"SL6", reference:"xerces-j2-javadoc-xni-2.7.1-12.7.el6_5")) flag++;
if (rpm_check(release:"SL6", reference:"xerces-j2-scripts-2.7.1-12.7.el6_5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
