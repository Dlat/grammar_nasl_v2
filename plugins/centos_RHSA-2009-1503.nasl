#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2009:1503 and 
# CentOS Errata and Security Advisory 2009:1503 respectively.
#

include("compat.inc");

if (description)
{
  script_id(43803);
  script_version("$Revision: 1.10 $");
  script_cvs_date("$Date: 2016/11/17 20:59:10 $");

  script_cve_id("CVE-2009-0791", "CVE-2009-1188", "CVE-2009-3604", "CVE-2009-3608", "CVE-2009-3609");
  script_osvdb_id(59175, 59176, 59179, 59180, 59183);
  script_xref(name:"RHSA", value:"2009:1503");

  script_name(english:"CentOS 4 : gpdf (CESA-2009:1503)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"An updated gpdf package that fixes multiple security issues is now
available for Red Hat Enterprise Linux 4.

This update has been rated as having important security impact by the
Red Hat Security Response Team.

GPdf is a viewer for Portable Document Format (PDF) files.

Multiple integer overflow flaws were found in GPdf. An attacker could
create a malicious PDF file that would cause GPdf to crash or,
potentially, execute arbitrary code when opened. (CVE-2009-0791,
CVE-2009-1188, CVE-2009-3604, CVE-2009-3608, CVE-2009-3609)

Red Hat would like to thank Adam Zabrocki for reporting the
CVE-2009-3604 issue, and Chris Rohlf for reporting the CVE-2009-3608
issue.

Users are advised to upgrade to this updated package, which contains a
backported patch to correct these issues."
  );
  # http://lists.centos.org/pipermail/centos-announce/2009-October/016191.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?a0e9fedc"
  );
  # http://lists.centos.org/pipermail/centos-announce/2009-October/016192.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?4fabcca5"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected gpdf package.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");
  script_cwe_id(189, 399);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:gpdf");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/10/16");
  script_set_attribute(attribute:"plugin_publication_date", value:"2010/01/06");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2010-2016 Tenable Network Security, Inc.");
  script_family(english:"CentOS Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/CentOS/release", "Host/CentOS/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/CentOS/release")) audit(AUDIT_OS_NOT, "CentOS");
if (!get_kb_item("Host/CentOS/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);


cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && "ia64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "CentOS", cpu);


flag = 0;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"gpdf-2.8.2-7.7.2.el4_8.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"gpdf-2.8.2-7.7.2.el4_8.5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
