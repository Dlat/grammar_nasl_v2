#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Gentoo Linux Security Advisory GLSA 200501-05.
#
# The advisory text is Copyright (C) 2001-2015 Gentoo Foundation, Inc.
# and licensed under the Creative Commons - Attribution / Share Alike 
# license. See http://creativecommons.org/licenses/by-sa/3.0/
#

include("compat.inc");

if (description)
{
  script_id(16396);
  script_version("$Revision: 1.13 $");
  script_cvs_date("$Date: 2015/04/13 13:41:57 $");

  script_cve_id("CVE-2004-1189");
  script_osvdb_id(12533);
  script_xref(name:"GLSA", value:"200501-05");

  script_name(english:"GLSA-200501-05 : mit-krb5: Heap overflow in libkadm5srv");
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
"The remote host is affected by the vulnerability described in GLSA-200501-05
(mit-krb5: Heap overflow in libkadm5srv)

    The MIT Kerberos 5 administration library libkadm5srv contains a
    heap overflow in the code handling password changing.
  
Impact :

    Under specific circumstances an attacker could execute arbitary
    code with the permissions of the user running mit-krb5, which could be
    the root user.
  
Workaround :

    There is no known workaround at this time."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security.gentoo.org/glsa/200501-05"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"All mit-krb5 users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose '>=app-crypt/mit-krb5-1.3.6'"
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:mit-krb5");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:gentoo:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/01/05");
  script_set_attribute(attribute:"plugin_publication_date", value:"2005/02/14");
  script_set_attribute(attribute:"vuln_publication_date", value:"2004/12/20");
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

if (qpkg_check(package:"app-crypt/mit-krb5", unaffected:make_list("ge 1.3.6"), vulnerable:make_list("lt 1.3.6"))) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "mit-krb5");
}