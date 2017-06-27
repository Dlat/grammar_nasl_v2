#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2013:0550 and 
# CentOS Errata and Security Advisory 2013:0550 respectively.
#

include("compat.inc");

if (description)
{
  script_id(65158);
  script_version("$Revision: 1.8 $");
  script_cvs_date("$Date: 2016/05/04 14:39:52 $");

  script_cve_id("CVE-2012-5689");
  script_bugtraq_id(57556);
  script_osvdb_id(89584);
  script_xref(name:"RHSA", value:"2013:0550");

  script_name(english:"CentOS 6 : bind (CESA-2013:0550)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated bind packages that fix one security issue and add one
enhancement are now available for Red Hat Enterprise Linux 6.

The Red Hat Security Response Team has rated this update as having
moderate security impact. A Common Vulnerability Scoring System (CVSS)
base score, which gives a detailed severity rating, is available from
the CVE link in the References section.

The Berkeley Internet Name Domain (BIND) is an implementation of the
Domain Name System (DNS) protocols. BIND includes a DNS server
(named); a resolver library (routines for applications to use when
interfacing with DNS); and tools for verifying that the DNS server is
operating correctly. DNS64 is used to automatically generate DNS
records so IPv6 based clients can access IPv4 systems through a NAT64
server.

A flaw was found in the DNS64 implementation in BIND when using
Response Policy Zones (RPZ). If a remote attacker sent a specially
crafted query to a named server that is using RPZ rewrite rules, named
could exit unexpectedly with an assertion failure. Note that DNS64
support is not enabled by default. (CVE-2012-5689)

This update also adds the following enhancement :

* Previously, it was impossible to configure the the maximum number of
responses sent per second to one client. This allowed remote attackers
to conduct traffic amplification attacks using DNS queries with
spoofed source IP addresses. With this update, it is possible to use
the new 'rate-limit' configuration option in named.conf and configure
the maximum number of queries which the server responds to. Refer to
the BIND documentation for more details about the 'rate-limit' option.
(BZ#906312)

All bind users are advised to upgrade to these updated packages, which
contain patches to correct this issue and add this enhancement. After
installing the update, the BIND daemon (named) will be restarted
automatically."
  );
  # http://lists.centos.org/pipermail/centos-announce/2013-March/019615.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?63114fed"
  );
  # http://lists.centos.org/pipermail/centos-cr-announce/2013-February/000806.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?c381ecb6"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected bind packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:TF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:bind");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:bind-chroot");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:bind-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:bind-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:bind-sdb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:bind-utils");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:6");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/03/08");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/03/10");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-6", reference:"bind-9.8.2-0.17.rc1.el6.3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"bind-chroot-9.8.2-0.17.rc1.el6.3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"bind-devel-9.8.2-0.17.rc1.el6.3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"bind-libs-9.8.2-0.17.rc1.el6.3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"bind-sdb-9.8.2-0.17.rc1.el6.3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"bind-utils-9.8.2-0.17.rc1.el6.3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");