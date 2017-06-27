#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2014:1919 and 
# CentOS Errata and Security Advisory 2014:1919 respectively.
#

include("compat.inc");

if (description)
{
  script_id(79693);
  script_version("$Revision: 1.10 $");
  script_cvs_date("$Date: 2015/07/23 14:53:34 $");

  script_cve_id("CVE-2014-1587", "CVE-2014-1590", "CVE-2014-1592", "CVE-2014-1593", "CVE-2014-1594");
  script_bugtraq_id(71391, 71395, 71396, 71397, 71398);
  script_osvdb_id(115195, 115196, 115198, 115200, 115202, 115293, 115294, 115295, 115296, 115297);
  script_xref(name:"RHSA", value:"2014:1919");

  script_name(english:"CentOS 5 / 6 / 7 : firefox (CESA-2014:1919)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated firefox packages that fix multiple security issues are now
available for Red Hat Enterprise Linux 5, 6, and 7.

Red Hat Product Security has rated this update as having Critical
security impact. Common Vulnerability Scoring System (CVSS) base
scores, which give detailed severity ratings, are available for each
vulnerability from the CVE links in the References section.

Mozilla Firefox is an open source web browser. XULRunner provides the
XUL Runtime environment for Mozilla Firefox.

Several flaws were found in the processing of malformed web content. A
web page containing malicious content could cause Firefox to crash or,
potentially, execute arbitrary code with the privileges of the user
running Firefox. (CVE-2014-1587, CVE-2014-1590, CVE-2014-1592,
CVE-2014-1593)

A flaw was found in the Alarm API, which could allow applications to
schedule actions to be run in the future. A malicious web application
could use this flaw to bypass the same-origin policy. (CVE-2014-1594)

This update disables SSL 3.0 support by default in Firefox. Details on
how to re-enable SSL 3.0 support are available at:
https://access.redhat.com/articles/1283153

Red Hat would like to thank the Mozilla project for reporting these
issues. Upstream acknowledges Gary Kwong, Randell Jesup, Nils
Ohlmeier, Jesse Ruderman, Max Jonas Werner, Joe Vennix, Berend-Jan
Wever, Abhishek Arya, and Boris Zbarsky as the original reporters of
these issues.

For technical details regarding these flaws, refer to the Mozilla
security advisories for Firefox 31.3.0 ESR. You can find a link to the
Mozilla advisories in the References section of this erratum.

All Firefox users should upgrade to these updated packages, which
contain Firefox version 31.3.0 ESR, which corrects these issues. After
installing the update, Firefox must be restarted for the changes to
take effect."
  );
  # http://lists.centos.org/pipermail/centos-announce/2014-December/020796.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?b35ffbd5"
  );
  # http://lists.centos.org/pipermail/centos-announce/2014-December/020798.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?78a4f55e"
  );
  # http://lists.centos.org/pipermail/centos-announce/2014-December/020801.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?ba51368d"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected firefox package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:firefox");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:6");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:7");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/12/03");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/12/04");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-5", reference:"firefox-31.3.0-4.el5.centos")) flag++;

if (rpm_check(release:"CentOS-6", reference:"firefox-31.3.0-3.el6.centos")) flag++;

if (rpm_check(release:"CentOS-7", cpu:"x86_64", reference:"firefox-31.3.0-3.el7.centos")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");