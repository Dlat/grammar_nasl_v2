#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2011:0305 and 
# CentOS Errata and Security Advisory 2011:0305 respectively.
#

include("compat.inc");

if (description)
{
  script_id(52505);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2016/05/04 14:30:42 $");

  script_cve_id("CVE-2011-0719");
  script_bugtraq_id(46597);
  script_osvdb_id(71268);
  script_xref(name:"RHSA", value:"2011:0305");

  script_name(english:"CentOS 4 / 5 : samba (CESA-2011:0305)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated samba packages that fix one security issue are now available
for Red Hat Enterprise Linux 4, 5, and 6.

The Red Hat Security Response Team has rated this update as having
important security impact. A Common Vulnerability Scoring System
(CVSS) base score, which gives a detailed severity rating, is
available from the CVE link in the References section.

Samba is a suite of programs used by machines to share files,
printers, and other information.

A flaw was found in the way Samba handled file descriptors. If an
attacker were able to open a large number of file descriptors on the
Samba server, they could flip certain stack bits to '1' values,
resulting in the Samba server (smbd) crashing. (CVE-2011-0719)

Red Hat would like to thank the Samba team for reporting this issue.

Users of Samba are advised to upgrade to these updated packages, which
contain a backported patch to resolve this issue. After installing
this update, the smb service will be restarted automatically."
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-April/017389.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?3170f862"
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-April/017390.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?83f16f34"
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-March/017260.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?e5c6aa17"
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-March/017261.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?d6966f98"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected samba packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:libsmbclient");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:libsmbclient-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-client");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-swat");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");

  script_set_attribute(attribute:"plugin_publication_date", value:"2011/03/03");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2011-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"samba-3.0.33-0.30.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"samba-3.0.33-0.30.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"samba-client-3.0.33-0.30.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"samba-client-3.0.33-0.30.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"samba-common-3.0.33-0.30.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"samba-common-3.0.33-0.30.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"samba-swat-3.0.33-0.30.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"samba-swat-3.0.33-0.30.el4")) flag++;

if (rpm_check(release:"CentOS-5", reference:"libsmbclient-3.0.33-3.29.el5_6.2")) flag++;
if (rpm_check(release:"CentOS-5", reference:"libsmbclient-devel-3.0.33-3.29.el5_6.2")) flag++;
if (rpm_check(release:"CentOS-5", reference:"samba-3.0.33-3.29.el5_6.2")) flag++;
if (rpm_check(release:"CentOS-5", reference:"samba-client-3.0.33-3.29.el5_6.2")) flag++;
if (rpm_check(release:"CentOS-5", reference:"samba-common-3.0.33-3.29.el5_6.2")) flag++;
if (rpm_check(release:"CentOS-5", reference:"samba-swat-3.0.33-3.29.el5_6.2")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
