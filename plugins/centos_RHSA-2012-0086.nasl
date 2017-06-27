#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2012:0086 and 
# CentOS Errata and Security Advisory 2012:0086 respectively.
#

include("compat.inc");

if (description)
{
  script_id(57806);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2016/08/29 13:57:36 $");

  script_cve_id("CVE-2011-4576", "CVE-2011-4619");
  script_bugtraq_id(51281);
  script_osvdb_id(78188, 78190);
  script_xref(name:"RHSA", value:"2012:0086");

  script_name(english:"CentOS 4 : openssl (CESA-2012:0086)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated openssl packages that fix two security issues are now
available for Red Hat Enterprise Linux 4.

The Red Hat Security Response Team has rated this update as having
moderate security impact. Common Vulnerability Scoring System (CVSS)
base scores, which give detailed severity ratings, are available for
each vulnerability from the CVE links in the References section.

OpenSSL is a toolkit that implements the Secure Sockets Layer (SSL
v2/v3) and Transport Layer Security (TLS v1) protocols, as well as a
full-strength, general purpose cryptography library.

An information leak flaw was found in the SSL 3.0 protocol
implementation in OpenSSL. Incorrect initialization of SSL record
padding bytes could cause an SSL client or server to send a limited
amount of possibly sensitive data to its SSL peer via the encrypted
connection. (CVE-2011-4576)

It was discovered that OpenSSL did not limit the number of TLS/SSL
handshake restarts required to support Server Gated Cryptography. A
remote attacker could use this flaw to make a TLS/SSL server using
OpenSSL consume an excessive amount of CPU by continuously restarting
the handshake. (CVE-2011-4619)

All OpenSSL users should upgrade to these updated packages, which
contain backported patches to resolve these issues. For the update to
take effect, all services linked to the OpenSSL library must be
restarted, or the system rebooted."
  );
  # http://lists.centos.org/pipermail/centos-announce/2012-February/018412.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?239c0dbe"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected openssl packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:openssl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:openssl-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:openssl-perl");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");

  script_set_attribute(attribute:"plugin_publication_date", value:"2012/02/03");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"openssl-0.9.7a-43.18.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"openssl-0.9.7a-43.18.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"openssl-devel-0.9.7a-43.18.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"openssl-devel-0.9.7a-43.18.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"openssl-perl-0.9.7a-43.18.el4")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"openssl-perl-0.9.7a-43.18.el4")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");