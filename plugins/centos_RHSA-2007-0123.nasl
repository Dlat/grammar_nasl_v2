#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2007:0123 and 
# CentOS Errata and Security Advisory 2007:0123 respectively.
#

include("compat.inc");

if (description)
{
  script_id(25041);
  script_version("$Revision: 1.10 $");
  script_cvs_date("$Date: 2015/05/19 23:34:16 $");

  script_cve_id("CVE-2007-0720");
  script_bugtraq_id(23127);
  script_osvdb_id(34072);
  script_xref(name:"RHSA", value:"2007:0123");

  script_name(english:"CentOS 3 / 4 / 5 : cups (CESA-2007:0123)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated CUPS packages that fix a security issue are now available for
Red Hat Enterprise Linux 3, 4, and 5.

This update has been rated as having moderate security impact by the
Red Hat Security Response Team.

The Common UNIX Printing System (CUPS) provides a portable printing
layer for UNIX(R) operating systems.

A bug was found in the way CUPS handled SSL negotiation. A remote user
capable of connecting to the CUPS daemon could cause a denial of
service to other CUPS users. (CVE-2007-0720)

All users of CUPS should upgrade to these updated packages, which
contain a backported patch introducing a timeout, which prevents
connections being kept open for an arbitrarily long time."
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-April/013663.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?3ec9d891"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-April/013664.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?b860b2df"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-April/013667.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?6ff102ec"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-April/013670.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?a06ca188"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-April/013686.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?a1914141"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-April/013687.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?0126cce2"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-April/013690.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?7f9e109a"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-April/013691.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?18d414cd"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected cups packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:cups");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:cups-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:cups-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:cups-lpd");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:3");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/04/16");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/04/19");
  script_set_attribute(attribute:"vuln_publication_date", value:"2007/03/15");
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
if ("x86_64" >!< cpu && "ia64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "CentOS", cpu);


flag = 0;
if (rpm_check(release:"CentOS-3", reference:"cups-1.1.17-13.3.42")) flag++;
if (rpm_check(release:"CentOS-3", reference:"cups-devel-1.1.17-13.3.42")) flag++;
if (rpm_check(release:"CentOS-3", reference:"cups-libs-1.1.17-13.3.42")) flag++;

if (rpm_check(release:"CentOS-4", reference:"cups-1.1.22-0.rc1.9.18")) flag++;
if (rpm_check(release:"CentOS-4", reference:"cups-devel-1.1.22-0.rc1.9.18")) flag++;
if (rpm_check(release:"CentOS-4", reference:"cups-libs-1.1.22-0.rc1.9.18")) flag++;

if (rpm_check(release:"CentOS-5", reference:"cups-1.2.4-11.5.1.el5")) flag++;
if (rpm_check(release:"CentOS-5", reference:"cups-devel-1.2.4-11.5.1.el5")) flag++;
if (rpm_check(release:"CentOS-5", reference:"cups-libs-1.2.4-11.5.1.el5")) flag++;
if (rpm_check(release:"CentOS-5", reference:"cups-lpd-1.2.4-11.5.1.el5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");