#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(71196);
  script_version("$Revision: 1.1 $");
  script_cvs_date("$Date: 2013/12/04 15:28:01 $");

  script_cve_id("CVE-2010-5107");

  script_name(english:"Scientific Linux Security Update : openssh on SL6.x i386/x86_64");
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
"The default OpenSSH configuration made it easy for remote attackers to
exhaust unauthorized connection slots and prevent other users from
being able to log in to a system. This flaw has been addressed by
enabling random early connection drops by setting MaxStartups to
10:30:100 by default. For more information, refer to the
sshd_config(5) man page. (CVE-2010-5107)"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1312&L=scientific-linux-errata&T=0&P=571
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?85aca3db"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/11/21");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/12/04");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL6", reference:"openssh-5.3p1-94.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssh-askpass-5.3p1-94.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssh-clients-5.3p1-94.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssh-debuginfo-5.3p1-94.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssh-ldap-5.3p1-94.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssh-server-5.3p1-94.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssl-1.0.1e-15.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssl-devel-1.0.1e-15.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssl-perl-1.0.1e-15.el6")) flag++;
if (rpm_check(release:"SL6", reference:"openssl-static-1.0.1e-15.el6")) flag++;
if (rpm_check(release:"SL6", reference:"pam_ssh_agent_auth-0.9.3-94.el6")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
