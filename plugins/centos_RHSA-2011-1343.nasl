#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2011:1343 and 
# CentOS Errata and Security Advisory 2011:1343 respectively.
#

include("compat.inc");

if (description)
{
  script_id(56312);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2015/05/19 23:52:00 $");

  script_cve_id("CVE-2011-2998", "CVE-2011-2999");
  script_osvdb_id(75837, 75838);
  script_xref(name:"RHSA", value:"2011:1343");

  script_name(english:"CentOS 4 / 5 : thunderbird (CESA-2011:1343)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"An updated thunderbird package that fixes two security issues is now
available for Red Hat Enterprise Linux 4 and 5.

The Red Hat Security Response Team has rated this update as having
critical security impact. Common Vulnerability Scoring System (CVSS)
base scores, which give detailed severity ratings, are available for
each vulnerability from the CVE links in the References section.

Mozilla Thunderbird is a standalone mail and newsgroup client.

A flaw was found in the way Thunderbird handled frame objects with
certain names. An attacker could use this flaw to cause a plug-in to
grant its content access to another site or the local file system,
violating the same-origin policy. (CVE-2011-2999)

An integer underflow flaw was found in the way Thunderbird handled
large JavaScript regular expressions. An HTML mail message containing
malicious JavaScript could cause Thunderbird to access already freed
memory, causing Thunderbird to crash or, potentially, execute
arbitrary code with the privileges of the user running Thunderbird.
(CVE-2011-2998)

All Thunderbird users should upgrade to this updated package, which
resolves these issues. All running instances of Thunderbird must be
restarted for the update to take effect."
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-September/018081.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?698d0a53"
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-September/018082.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?bf1420fc"
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-September/018087.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?6d3c6c57"
  );
  # http://lists.centos.org/pipermail/centos-announce/2011-September/018088.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?6c72c40f"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected thunderbird package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:thunderbird");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");

  script_set_attribute(attribute:"plugin_publication_date", value:"2011/09/29");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2011-2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"thunderbird-1.5.0.12-44.el4.centos")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"thunderbird-1.5.0.12-44.el4.centos")) flag++;

if (rpm_check(release:"CentOS-5", reference:"thunderbird-2.0.0.24-26.el5.centos")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");