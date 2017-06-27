#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(60340);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2013/03/06 11:47:00 $");

  script_cve_id("CVE-2007-5497");

  script_name(english:"Scientific Linux Security Update : e2fsprogs on SL5.x, SL4.x, SL3.x i386/x86_64");
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
"Multiple integer overflow flaws were found in the way e2fsprogs
processes file system content. If a victim opens a carefully crafted
file system with a program using e2fsprogs, it may be possible to
execute arbitrary code with the permissions of the victim. It may be
possible to leverage this flaw in a virtualized environment to gain
access to other virtualized hosts. (CVE-2007-5497)"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind0801&L=scientific-linux-errata&T=0&P=78
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?092e1ee2"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Update the affected e2fsprogs, e2fsprogs-devel and / or e2fsprogs-libs
packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_cwe_id(189);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2008/01/07");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/08/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2013 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL3", reference:"e2fsprogs-1.32-15.4")) flag++;
if (rpm_check(release:"SL3", reference:"e2fsprogs-devel-1.32-15.4")) flag++;

if (rpm_check(release:"SL4", cpu:"i386", reference:"e2fsprogs-1.35-12.11.el4_6.1")) flag++;
if (rpm_check(release:"SL4", cpu:"x86_64", reference:"e2fsprogs-1.35-12.11.el4.1")) flag++;
if (rpm_check(release:"SL4", cpu:"i386", reference:"e2fsprogs-devel-1.35-12.11.el4_6.1")) flag++;
if (rpm_check(release:"SL4", cpu:"x86_64", reference:"e2fsprogs-devel-1.35-12.11.el4.1")) flag++;

if (rpm_check(release:"SL5", reference:"e2fsprogs-1.39-10.el5_1.1")) flag++;
if (rpm_check(release:"SL5", reference:"e2fsprogs-devel-1.39-10.el5_1.1")) flag++;
if (rpm_check(release:"SL5", reference:"e2fsprogs-libs-1.39-10.el5_1.1")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");