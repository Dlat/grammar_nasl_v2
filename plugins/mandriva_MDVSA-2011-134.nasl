#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandriva Linux Security Advisory MDVSA-2011:134. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(56160);
  script_version("$Revision: 1.8 $");
  script_cvs_date("$Date: 2016/05/17 17:02:55 $");

  script_cve_id("CVE-2011-3200");
  script_bugtraq_id(49413);
  script_xref(name:"MDVSA", value:"2011:134");
  script_xref(name:"MDVSA", value:"2011:134-1");

  script_name(english:"Mandriva Linux Security Advisory : rsyslog (MDVSA-2011:134-1)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Mandriva Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A vulnerability was discovered and corrected in rsyslog :

Stack-based buffer overflow in the parseLegacySyslogMsg function in
tools/syslogd.c in rsyslogd in rsyslog 4.6.x before 4.6.8 and 5.2.0
through 5.8.4 might allow remote attackers to cause a denial of
service (application exit) via a long TAG in a legacy syslog message
(CVE-2011-3200).

The updated packages have been patched to correct this issue."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rsyslog");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rsyslog-dbi");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rsyslog-docs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rsyslog-gssapi");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rsyslog-mysql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rsyslog-pgsql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rsyslog-relp");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rsyslog-snmp");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:linux:2010.1");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:linux:2011");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/09/09");
  script_set_attribute(attribute:"plugin_publication_date", value:"2011/09/12");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2011-2016 Tenable Network Security, Inc.");
  script_family(english:"Mandriva Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/Mandrake/release", "Host/Mandrake/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/Mandrake/release")) audit(AUDIT_OS_NOT, "Mandriva / Mandake Linux");
if (!get_kb_item("Host/Mandrake/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu !~ "^(amd64|i[3-6]86|x86_64)$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Mandriva / Mandrake Linux", cpu);


flag = 0;
if (rpm_check(release:"MDK2010.1", reference:"rsyslog-4.6.2-3.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"rsyslog-dbi-4.6.2-3.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"rsyslog-docs-4.6.2-3.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"rsyslog-gssapi-4.6.2-3.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"rsyslog-mysql-4.6.2-3.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"rsyslog-pgsql-4.6.2-3.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"rsyslog-relp-4.6.2-3.1mdv2010.2", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2010.1", reference:"rsyslog-snmp-4.6.2-3.1mdv2010.2", yank:"mdv")) flag++;

if (rpm_check(release:"MDK2011", reference:"rsyslog-5.8.5-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"rsyslog-dbi-5.8.5-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"rsyslog-docs-5.8.5-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"rsyslog-gssapi-5.8.5-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"rsyslog-mysql-5.8.5-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"rsyslog-pgsql-5.8.5-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"rsyslog-relp-5.8.5-0.1-mdv2011.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2011", reference:"rsyslog-snmp-5.8.5-0.1-mdv2011.0", yank:"mdv")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");