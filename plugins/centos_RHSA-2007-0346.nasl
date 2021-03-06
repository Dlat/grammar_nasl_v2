#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2007:0346 and 
# CentOS Errata and Security Advisory 2007:0346 respectively.
#

include("compat.inc");

if (description)
{
  script_id(25205);
  script_version("$Revision: 1.9 $");
  script_cvs_date("$Date: 2015/05/19 23:34:17 $");

  script_cve_id("CVE-2007-2438");
  script_osvdb_id(35488);
  script_xref(name:"RHSA", value:"2007:0346");

  script_name(english:"CentOS 5 : vim (CESA-2007:0346)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated vim packages that fix a security issue are now available for
Red Hat Enterprise Linux 5.

This update has been rated as having moderate security impact by the
Red Hat Security Response Team.

VIM (VIsual editor iMproved) is a version of the vi editor.

An arbitrary command execution flaw was found in the way VIM processes
modelines. If a user with modelines enabled opened a text file
containing a carefully crafted modeline, arbitrary commands could be
executed as the user running VIM. (CVE-2007-2438)

Users of VIM are advised to upgrade to these updated packages, which
resolve this issue.

Please note: this issue did not affect VIM as distributed with Red Hat
Enterprise Linux 2.1, 3, or 4."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013745.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013746.html"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected vim packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:H/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:vim-X11");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:vim-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:vim-enhanced");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:vim-minimal");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/05/10");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/05/11");
  script_set_attribute(attribute:"vuln_publication_date", value:"2007/04/26");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2015 Tenable Network Security, Inc.");
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
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "CentOS", cpu);


flag = 0;
if (rpm_check(release:"CentOS-5", reference:"vim-X11-7.0.109-3.el5.3")) flag++;
if (rpm_check(release:"CentOS-5", reference:"vim-common-7.0.109-3.el5.3")) flag++;
if (rpm_check(release:"CentOS-5", reference:"vim-enhanced-7.0.109-3.el5.3")) flag++;
if (rpm_check(release:"CentOS-5", reference:"vim-minimal-7.0.109-3.el5.3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
