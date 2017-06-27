#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Gentoo Linux Security Advisory GLSA 200512-07.
#
# The advisory text is Copyright (C) 2001-2015 Gentoo Foundation, Inc.
# and licensed under the Creative Commons - Attribution / Share Alike 
# license. See http://creativecommons.org/licenses/by-sa/3.0/
#

include("compat.inc");

if (description)
{
  script_id(20327);
  script_version("$Revision: 1.13 $");
  script_cvs_date("$Date: 2015/04/13 13:49:34 $");

  script_cve_id("CVE-2005-4442", "CVE-2005-4443");
  script_osvdb_id(21976, 21977);
  script_xref(name:"GLSA", value:"200512-07");

  script_name(english:"GLSA-200512-07 : OpenLDAP, Gauche: RUNPATH issues");
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
"The remote host is affected by the vulnerability described in GLSA-200512-07
(OpenLDAP, Gauche: RUNPATH issues)

    Gentoo packaging for OpenLDAP and Gauche may introduce insecure paths
    into the list of directories that are searched for libraries at
    runtime.
  
Impact :

    A local attacker, who is a member of the 'portage' group, could create
    a malicious shared object in the Portage temporary build directory that
    would be loaded at runtime by a dependent binary, potentially resulting
    in privilege escalation.
  
Workaround :

    Only grant 'portage' group rights to trusted users."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security.gentoo.org/glsa/200512-07"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"All OpenLDAP users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose net-nds/openldap
    All Gauche users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose '>=dev-scheme/gauche-0.8.6-r1'"
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:gauche");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:openldap");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:gentoo:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/12/15");
  script_set_attribute(attribute:"plugin_publication_date", value:"2005/12/20");
  script_set_attribute(attribute:"vuln_publication_date", value:"2005/12/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2015 Tenable Network Security, Inc.");
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

if (qpkg_check(package:"net-nds/openldap", unaffected:make_list("ge 2.2.28-r3", "rge 2.1.30-r6"), vulnerable:make_list("lt 2.2.28-r3"))) flag++;
if (qpkg_check(package:"dev-scheme/gauche", unaffected:make_list("ge 0.8.6-r1"), vulnerable:make_list("lt 0.8.6-r1"))) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:qpkg_report_get());
  else security_hole(0);
  exit(0);
}
else
{
  tested = qpkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "OpenLDAP / Gauche");
}