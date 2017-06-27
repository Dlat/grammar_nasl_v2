#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandrake Linux Security Advisory MDKSA-2001:076. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(13891);
  script_version ("$Revision: 1.13 $");
  script_cvs_date("$Date: 2013/05/31 23:43:25 $");

  script_cve_id("CVE-2001-1389");
  script_xref(name:"MDKSA", value:"2001:076");

  script_name(english:"Mandrake Linux Security Advisory : xinetd (MDKSA-2001:076)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Mandrake Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"An audit has been performed on the xinetd 2.3.0 source code by Solar
Designer for many different possible vulnerabilities. The 2.3.1
release incorporated his patches into the xinetd source tree. The
audit was very thorough and found and fixed many problems. This xinetd
update includes his audit patch."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.xinetd.org/#changes"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected xinetd and / or xinetd-ipv6 packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:xinetd");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:xinetd-ipv6");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandrakesoft:mandrake_linux:7.2");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandrakesoft:mandrake_linux:8.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2001/08/31");
  script_set_attribute(attribute:"plugin_publication_date", value:"2004/07/31");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2004-2013 Tenable Network Security, Inc.");
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
if (rpm_check(release:"MDK7.2", cpu:"i386", reference:"xinetd-2.3.0-5.2mdk", yank:"mdk")) flag++;

if (rpm_check(release:"MDK8.0", cpu:"i386", reference:"xinetd-2.3.0-5.1mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK8.0", cpu:"i386", reference:"xinetd-ipv6-2.3.0-5.1mdk", yank:"mdk")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");