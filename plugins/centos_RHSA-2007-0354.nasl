#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2007:0354 and 
# CentOS Errata and Security Advisory 2007:0354 respectively.
#

include("compat.inc");

if (description)
{
  script_id(25224);
  script_version("$Revision: 1.14 $");
  script_cvs_date("$Date: 2016/05/04 14:30:41 $");

  script_cve_id("CVE-2007-2446", "CVE-2007-2447");
  script_bugtraq_id(23972, 23973, 24195, 24196, 24197, 24198);
  script_osvdb_id(34698, 34699, 34700, 34731, 34732, 34733);
  script_xref(name:"RHSA", value:"2007:0354");

  script_name(english:"CentOS 3 / 4 / 5 : samba (CESA-2007:0354)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated samba packages that fix several security flaws are now
available.

This update has been rated as having critical security impact by the
Red Hat Security Response Team.

Samba provides file and printer sharing services to SMB/CIFS clients.

Various bugs were found in NDR parsing, used to decode MS-RPC requests
in Samba. A remote attacker could have sent carefully crafted requests
causing a heap overflow, which may have led to the ability to execute
arbitrary code on the server. (CVE-2007-2446)

Unescaped user input parameters were being passed as arguments to
/bin/sh. A remote, authenticated, user could have triggered this flaw
and executed arbitrary code on the server. Additionally, on Red Hat
Enterprise Linux 5 only, this flaw could be triggered by a remote
unauthenticated user if Samba was configured to use the non-default
'username map script' option. (CVE-2007-2447)

Users of Samba should upgrade to these packages, which contain
backported patches to correct these issues. After upgrading, Samba
should be restarted using 'service smb restart'

On Red Hat Enterprise Linux 5 the impact of these issues is reduced as
Samba is constrained by the default SELinux 'targeted' policy.

Red Hat would like to thank the Samba developers, TippingPoint, and
iDefense for reporting these issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013755.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013756.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013759.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013760.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013762.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013763.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected samba packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:ND/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"metasploit_name", value:'Samba "username map script" Command Execution');
  script_set_attribute(attribute:"exploit_framework_metasploit", value:"true");
  script_set_attribute(attribute:"exploit_framework_canvas", value:"true");
  script_set_attribute(attribute:"canvas_package", value:'CANVAS');

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-client");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-swat");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:3");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/05/14");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/05/16");
  script_set_attribute(attribute:"vuln_publication_date", value:"2007/05/14");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-3", reference:"samba-3.0.9-1.3E.13.2")) flag++;
if (rpm_check(release:"CentOS-3", reference:"samba-client-3.0.9-1.3E.13.2")) flag++;
if (rpm_check(release:"CentOS-3", reference:"samba-common-3.0.9-1.3E.13.2")) flag++;
if (rpm_check(release:"CentOS-3", reference:"samba-swat-3.0.9-1.3E.13.2")) flag++;

if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"samba-3.0.10-1.4E.12.2")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"samba-client-3.0.10-1.4E.12.2")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"samba-common-3.0.10-1.4E.12.2")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"samba-swat-3.0.10-1.4E.12.2")) flag++;

if (rpm_check(release:"CentOS-5", reference:"samba-3.0.23c-2.el5.2.0.2")) flag++;
if (rpm_check(release:"CentOS-5", reference:"samba-client-3.0.23c-2.el5.2.0.2")) flag++;
if (rpm_check(release:"CentOS-5", reference:"samba-common-3.0.23c-2.el5.2.0.2")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");