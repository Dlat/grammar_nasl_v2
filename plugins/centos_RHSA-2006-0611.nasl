#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2006:0611 and 
# CentOS Errata and Security Advisory 2006:0611 respectively.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(22138);
  script_version("$Revision: 1.16 $");
  script_cvs_date("$Date: 2016/11/17 20:59:08 $");

  script_cve_id("CVE-2006-2776", "CVE-2006-2778", "CVE-2006-2779", "CVE-2006-2780", "CVE-2006-2781", "CVE-2006-2782", "CVE-2006-2783", "CVE-2006-2784", "CVE-2006-2785", "CVE-2006-2786", "CVE-2006-2787", "CVE-2006-2788", "CVE-2006-3113", "CVE-2006-3677", "CVE-2006-3801", "CVE-2006-3802", "CVE-2006-3803", "CVE-2006-3804", "CVE-2006-3805", "CVE-2006-3806", "CVE-2006-3807", "CVE-2006-3808", "CVE-2006-3809", "CVE-2006-3810", "CVE-2006-3811");
  script_osvdb_id(26299, 26300, 26301, 26302, 26303, 26304, 26305, 26306, 26307, 26308, 26309, 26310, 26311, 26312, 26313, 26314, 27558, 27559, 27560, 27561, 27562, 27563, 27565, 27566, 27567, 27568, 27569, 27570, 27571, 27572, 27573, 27574, 27575, 27576, 27577, 94469, 94470, 94471, 94472, 94473, 94474, 94475);
  script_xref(name:"RHSA", value:"2006:0611");

  script_name(english:"CentOS 4 : thunderbird (CESA-2006:0611)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated thunderbird packages that fix several security bugs are now
available for Red Hat Enterprise Linux 4.

This update has been rated as having critical security impact by the
Red Hat Security Response Team.

Mozilla Thunderbird is a standalone mail and newsgroup client.

The Mozilla Foundation has discontinued support for the Mozilla
Thunderbird 1.0 branch. This update deprecates the Mozilla Thunderbird
1.0 branch in Red Hat Enterprise Linux 4 in favor of the supported
Mozilla Thunderbird 1.5 branch.

This update also resolves a number of outstanding Thunderbird security
issues :

Several flaws were found in the way Thunderbird processed certain
JavaScript actions. A malicious mail message could execute arbitrary
JavaScript instructions with the permissions of 'chrome', allowing the
page to steal sensitive information or install browser malware.
(CVE-2006-2776, CVE-2006-2784, CVE-2006-2785, CVE-2006-2787,
CVE-2006-3807, CVE-2006-3809)

Several denial of service flaws were found in the way Thunderbird
processed certain mail messages. A malicious web page could crash the
browser or possibly execute arbitrary code as the user running
Thunderbird. (CVE-2006-2779, CVE-2006-2780, CVE-2006-3801,
CVE-2006-3677, CVE-2006-3113, CVE-2006-3803, CVE-2006-3805,
CVE-2006-3806, CVE-2006-3811)

Several flaws were found in the way Thunderbird processed certain
JavaScript actions. A malicious mail message could conduct a
cross-site scripting attack or steal sensitive information (such as
cookies owned by other domains). (CVE-2006-3802, CVE-2006-3810)

A form file upload flaw was found in the way Thunderbird handled
JavaScript input object mutation. A malicious mail message could
upload an arbitrary local file at form submission time without user
interaction. (CVE-2006-2782)

A denial of service flaw was found in the way Thunderbird called the
crypto.signText() JavaScript function. A malicious mail message could
crash the browser if the victim had a client certificate loaded.
(CVE-2006-2778)

A flaw was found in the way Thunderbird processed Proxy AutoConfig
scripts. A malicious Proxy AutoConfig server could execute arbitrary
JavaScript instructions with the permissions of 'chrome', allowing the
page to steal sensitive information or install client malware.
(CVE-2006-3808)

Note: Please note that JavaScript support is disabled by default in
Thunderbird. The above issues are not exploitable with JavaScript
disabled.

Two flaws were found in the way Thunderbird displayed malformed inline
vcard attachments. If a victim viewed an email message containing a
carefully crafted vcard it was possible to execute arbitrary code as
the user running Thunderbird. (CVE-2006-2781, CVE-2006-3804)

A cross site scripting flaw was found in the way Thunderbird processed
Unicode Byte-order-Mark (BOM) markers in UTF-8 mail messages. A
malicious web page could execute a script within the browser that a
web input sanitizer could miss due to a malformed 'script' tag.
(CVE-2006-2783)

Two HTTP response smuggling flaws were found in the way Thunderbird
processed certain invalid HTTP response headers. A malicious website
could return specially crafted HTTP response headers which may bypass
HTTP proxy restrictions. (CVE-2006-2786)

A double free flaw was found in the way the nsIX509::getRawDER method
was called. If a victim visited a carefully crafted web page, it was
possible to crash Thunderbird. (CVE-2006-2788)

Users of Thunderbird are advised to upgrade to this update, which
contains Thunderbird version 1.5.0.5 that corrects these issues."
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-July/013073.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?3b771c43"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-July/013074.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?7f0889b9"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-July/013085.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?93dcd7a8"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected thunderbird package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");
  script_set_attribute(attribute:"metasploit_name", value:'Mozilla Suite/Firefox Navigator Object Code Execution');
  script_set_attribute(attribute:"exploit_framework_metasploit", value:"true");
  script_cwe_id(20, 94, 119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:thunderbird");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");

  script_set_attribute(attribute:"patch_publication_date", value:"2006/07/29");
  script_set_attribute(attribute:"plugin_publication_date", value:"2006/08/04");
  script_set_attribute(attribute:"vuln_publication_date", value:"2006/06/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2006-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-4", reference:"thunderbird-1.5.0.5-0.el4.1.centos4")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
