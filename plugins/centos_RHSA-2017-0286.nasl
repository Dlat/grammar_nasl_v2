#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2017:0286 and 
# CentOS Errata and Security Advisory 2017:0286 respectively.
#

include("compat.inc");

if (description)
{
  script_id(97305);
  script_version("$Revision: 3.4 $");
  script_cvs_date("$Date: 2017/05/18 13:19:45 $");

  script_cve_id("CVE-2016-8610", "CVE-2017-3731");
  script_osvdb_id(146198, 151018);
  script_xref(name:"RHSA", value:"2017:0286");

  script_name(english:"CentOS 6 / 7 : openssl (CESA-2017:0286)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"An update for openssl is now available for Red Hat Enterprise Linux 6
and Red Hat Enterprise Linux 7.

Red Hat Product Security has rated this update as having a security
impact of Moderate. A Common Vulnerability Scoring System (CVSS) base
score, which gives a detailed severity rating, is available for each
vulnerability from the CVE link(s) in the References section.

OpenSSL is a toolkit that implements the Secure Sockets Layer (SSL)
and Transport Layer Security (TLS) protocols, as well as a
full-strength general-purpose cryptography library.

Security Fix(es) :

* An integer underflow leading to an out of bounds read flaw was found
in OpenSSL. A remote attacker could possibly use this flaw to crash a
32-bit TLS/SSL server or client using OpenSSL if it used the RC4-MD5
cipher suite. (CVE-2017-3731)

* A denial of service flaw was found in the way the TLS/SSL protocol
defined processing of ALERT packets during a connection handshake. A
remote attacker could use this flaw to make a TLS/SSL server consume
an excessive amount of CPU and fail to accept connections form other
clients. (CVE-2016-8610)"
  );
  # http://lists.centos.org/pipermail/centos-announce/2017-February/022274.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?c6a5cc67"
  );
  # http://lists.centos.org/pipermail/centos-announce/2017-February/022275.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?9f908d7b"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected openssl packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:openssl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:openssl-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:openssl-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:openssl-perl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:openssl-static");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:6");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:7");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/02/21");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/02/22");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2017 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-6", reference:"openssl-1.0.1e-48.el6_8.4")) flag++;
if (rpm_check(release:"CentOS-6", reference:"openssl-devel-1.0.1e-48.el6_8.4")) flag++;
if (rpm_check(release:"CentOS-6", reference:"openssl-perl-1.0.1e-48.el6_8.4")) flag++;
if (rpm_check(release:"CentOS-6", reference:"openssl-static-1.0.1e-48.el6_8.4")) flag++;

if (rpm_check(release:"CentOS-7", cpu:"x86_64", reference:"openssl-1.0.1e-60.el7_3.1")) flag++;
if (rpm_check(release:"CentOS-7", cpu:"x86_64", reference:"openssl-devel-1.0.1e-60.el7_3.1")) flag++;
if (rpm_check(release:"CentOS-7", cpu:"x86_64", reference:"openssl-libs-1.0.1e-60.el7_3.1")) flag++;
if (rpm_check(release:"CentOS-7", cpu:"x86_64", reference:"openssl-perl-1.0.1e-60.el7_3.1")) flag++;
if (rpm_check(release:"CentOS-7", cpu:"x86_64", reference:"openssl-static-1.0.1e-60.el7_3.1")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
