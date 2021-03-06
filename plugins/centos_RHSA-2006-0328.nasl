#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2006:0328 and 
# CentOS Errata and Security Advisory 2006:0328 respectively.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(21993);
  script_version("$Revision: 1.14 $");
  script_cvs_date("$Date: 2016/11/17 20:59:08 $");

  script_cve_id("CVE-2006-0748", "CVE-2006-0749", "CVE-2006-1724", "CVE-2006-1727", "CVE-2006-1728", "CVE-2006-1729", "CVE-2006-1730", "CVE-2006-1731", "CVE-2006-1732", "CVE-2006-1733", "CVE-2006-1734", "CVE-2006-1735", "CVE-2006-1737", "CVE-2006-1738", "CVE-2006-1739", "CVE-2006-1740", "CVE-2006-1741", "CVE-2006-1742", "CVE-2006-1790");
  script_osvdb_id(24658, 24659, 24660, 24661, 24662, 24663, 24664, 24665, 24666, 24667, 24668, 24669, 24670, 24671, 24672, 24673, 24674, 24675, 24676, 24677, 24678, 24679, 24680, 24681, 24682, 24683);
  script_xref(name:"RHSA", value:"2006:0328");

  script_name(english:"CentOS 4 : firefox (CESA-2006:0328)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated firefox packages that fix several security bugs are now
available.

This update has been rated as having critical security impact by the
Red Hat Security Response Team.

[Updated 24 Apr 2006] The erratum text has been updated to include
CVE-2006-0748, an issue fixed by these erratum packages but which was
not public at the time of release. No changes have been made to the
packages.

Mozilla Firefox is an open source Web browser.

Several bugs were found in the way Firefox processes malformed
JavaScript. A malicious web page could modify the content of a
different open web page, possibly stealing sensitive information or
conducting a cross-site scripting attack. (CVE-2006-1731,
CVE-2006-1732, CVE-2006-1741)

Several bugs were found in the way Firefox processes certain
JavaScript actions. A malicious web page could execute arbitrary
JavaScript instructions with the permissions of 'chrome', allowing the
page to steal sensitive information or install browser malware.
(CVE-2006-1727, CVE-2006-1728, CVE-2006-1733, CVE-2006-1734,
CVE-2006-1735, CVE-2006-1742)

Several bugs were found in the way Firefox processes malformed web
pages. A carefully crafted malicious web page could cause the
execution of arbitrary code as the user running Firefox.
(CVE-2006-0748, CVE-2006-0749, CVE-2006-1724, CVE-2006-1730,
CVE-2006-1737, CVE-2006-1738, CVE-2006-1739, CVE-2006-1790)

A bug was found in the way Firefox displays the secure site icon. If a
browser is configured to display the non-default secure site modal
warning dialog, it may be possible to trick a user into believing they
are viewing a secure site. (CVE-2006-1740)

A bug was found in the way Firefox allows JavaScript mutation events
on 'input' form elements. A malicious web page could be created in
such a way that when a user submits a form, an arbitrary file could be
uploaded to the attacker. (CVE-2006-1729)

Users of Firefox are advised to upgrade to these updated packages
containing Firefox version 1.0.8 which corrects these issues."
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-April/012812.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?87636e3e"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-April/012815.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?39b69440"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-April/012816.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?c8ec17c7"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected firefox package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cwe_id(20, 79, 119, 189, 264, 399);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:firefox");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");

  script_set_attribute(attribute:"patch_publication_date", value:"2006/04/14");
  script_set_attribute(attribute:"plugin_publication_date", value:"2006/07/05");
  script_set_attribute(attribute:"vuln_publication_date", value:"2006/02/28");
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
if (rpm_check(release:"CentOS-4", reference:"firefox-1.0.8-1.4.1.centos4")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
