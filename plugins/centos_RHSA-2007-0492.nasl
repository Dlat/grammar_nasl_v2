#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2007:0492 and 
# CentOS Errata and Security Advisory 2007:0492 respectively.
#

include("compat.inc");

if (description)
{
  script_id(25527);
  script_version("$Revision: 1.11 $");
  script_cvs_date("$Date: 2015/05/19 23:34:17 $");

  script_cve_id("CVE-2007-2873");
  script_bugtraq_id(22584);
  script_osvdb_id(37234);
  script_xref(name:"RHSA", value:"2007:0492");

  script_name(english:"CentOS 4 / 5 : spamassassin (CESA-2007:0492)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated spamassassin packages that fix a security issue are now
available for Red Hat Enterprise Linux 4 and 5.

This update has been rated as having moderate security impact by the
Red Hat Security Response Team.

SpamAssassin provides a way to reduce unsolicited commercial email
(spam) from incoming email.

Martin Krafft discovered a symlink issue in SpamAssassin that affects
certain non-default configurations. A local user could use this flaw
to create or overwrite files writable by the spamd process
(CVE-2007-2873).

Users of SpamAssassin should upgrade to these updated packages which
contain a backported patch to correct this issue.

Note: This issue did not affect the version of SpamAssassin shipped
with Red Hat Enterprise Linux 3."
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-June/013929.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?d27baa81"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-June/013930.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?85fcfeed"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-June/013946.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?db62e760"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-June/013963.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?d5a3e2f4"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-June/013964.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?991d0ae0"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected spamassassin package."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:N/I:N/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:spamassassin");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/06/17");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/06/18");
  script_set_attribute(attribute:"vuln_publication_date", value:"2007/06/11");
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
if (rpm_check(release:"CentOS-4", reference:"spamassassin-3.1.9-1.el4")) flag++;

if (rpm_check(release:"CentOS-5", reference:"spamassassin-3.1.9-1.el5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_note(port:0, extra:rpm_report_get());
  else security_note(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");