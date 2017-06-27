#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Gentoo Linux Security Advisory GLSA 200903-39.
#
# The advisory text is Copyright (C) 2001-2016 Gentoo Foundation, Inc.
# and licensed under the Creative Commons - Attribution / Share Alike 
# license. See http://creativecommons.org/licenses/by-sa/3.0/
#

include("compat.inc");

if (description)
{
  script_id(36027);
  script_version("$Revision: 1.13 $");
  script_cvs_date("$Date: 2016/11/11 20:08:44 $");

  script_cve_id("CVE-2009-0360", "CVE-2009-0361");
  script_bugtraq_id(33740, 33741);
  script_osvdb_id(54343, 54344);
  script_xref(name:"GLSA", value:"200903-39");

  script_name(english:"GLSA-200903-39 : pam_krb5: Privilege escalation");
  script_summary(english:"Checks for updated package(s) in /var/db/pkg");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Gentoo host is missing one or more security-related
patches."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The remote host is affected by the vulnerability described in GLSA-200903-39
(pam_krb5: Privilege escalation)

    The following vulnerabilities were discovered:
    pam_krb5
    does not properly initialize the Kerberos libraries for setuid use
    (CVE-2009-0360).
    Derek Chan reported that calls to
    pam_setcred() are not properly handled when running setuid
    (CVE-2009-0361).
  
Impact :

    A local attacker could set an environment variable to point to a
    specially crafted Kerberos configuration file and launch a PAM-based
    setuid application to elevate privileges, or change ownership and
    overwrite arbitrary files.
  
Workaround :

    There is no known workaround at this time."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security.gentoo.org/glsa/200903-39"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"All pam_krb5 users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose '>=sys-auth/pam_krb5-3.12'"
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:H/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_cwe_id(264, 287);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:pam_krb5");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:gentoo:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/03/25");
  script_set_attribute(attribute:"plugin_publication_date", value:"2009/03/27");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2009-2016 Tenable Network Security, Inc.");
  script_family(english:"Gentoo Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Gentoo/release", "Host/Gentoo/qpkg-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("qpkg.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/Gentoo/release")) audit(AUDIT_OS_NOT, "Gentoo");
if (!get_kb_item("Host/Gentoo/qpkg-list")) audit(AUDIT_PACKAGE_LIST_MISSING);


flag = 0;

if (qpkg_check(package:"sys-auth/pam_krb5", unaffected:make_list("ge 3.12"), vulnerable:make_list("lt 3.12"))) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:qpkg_report_get());
  else security_warning(0);
  exit(0);
}
else
{
  tested = qpkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "pam_krb5");
}