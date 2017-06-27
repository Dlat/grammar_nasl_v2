#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2011:0013 and 
# CentOS Errata and Security Advisory 2011:0013 respectively.
#

include("compat.inc");

if (description)
{
  script_id(51784);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2016/05/04 14:30:42 $");

  script_cve_id("CVE-2010-4538");
  script_bugtraq_id(45634);
  script_xref(name:"RHSA", value:"2011:0013");

  script_name(english:"CentOS 4 : wireshark (CESA-2011:0013)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated wireshark packages that fix one security issue are now
available for Red Hat Enterprise Linux 4, 5, and 6.

The Red Hat Security Response Team has rated this update as having
moderate security impact. A Common Vulnerability Scoring System (CVSS)
base score, which gives a detailed severity rating, is available from
the CVE link in the References section.

Wireshark is a program for monitoring network traffic. Wireshark was
previously known as Ethereal.

An array index error, leading to a stack-based buffer overflow, was
found in the Wireshark ENTTEC dissector. If Wireshark read a malformed
packet off a network or opened a malicious dump file, it could crash
or, possibly, execute arbitrary code as the user running Wireshark.
(CVE-2010-4538)

Users of Wireshark should upgrade to these updated packages, which
contain a backported patch to correct this issue. All running
instances of Wireshark must be restarted for the update to take
effect."
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-January/017241.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?f436f702"
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-January/017242.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?9c52e572"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected wireshark packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"exploit_framework_canvas", value:"true");
  script_set_attribute(attribute:"canvas_package", value:'White_Phosphorus');

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:wireshark");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:wireshark-gnome");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");

  script_set_attribute(attribute:"plugin_publication_date", value:"2011/01/28");
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
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"wireshark-1.0.15-1.el4_8.3")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"wireshark-1.0.15-1.el4_8.3")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"wireshark-gnome-1.0.15-1.el4_8.3")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"wireshark-gnome-1.0.15-1.el4_8.3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");