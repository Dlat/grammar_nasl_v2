#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(99350);
  script_version("$Revision: 3.1 $");
  script_cvs_date("$Date: 2017/04/13 13:33:09 $");

  script_cve_id("CVE-2016-0736", "CVE-2016-2161", "CVE-2016-8743");

  script_name(english:"Scientific Linux Security Update : httpd on SL7.x x86_64");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Scientific Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Security Fix(es) :

  - It was discovered that the mod_session_crypto module of
    httpd did not use any mechanisms to verify integrity of
    the encrypted session data stored in the user's browser.
    A remote attacker could use this flaw to decrypt and
    modify session data using a padding oracle attack.
    (CVE-2016-0736)

  - It was discovered that the mod_auth_digest module of
    httpd did not properly check for memory allocation
    failures. A remote attacker could use this flaw to cause
    httpd child processes to repeatedly crash if the server
    used HTTP digest authentication. (CVE-2016-2161)

  - It was discovered that the HTTP parser in httpd
    incorrectly allowed certain characters not permitted by
    the HTTP protocol specification to appear unencoded in
    HTTP request headers. If httpd was used in conjunction
    with a proxy or backend server that interpreted those
    characters differently, a remote attacker could possibly
    use this flaw to inject data into HTTP responses,
    resulting in proxy cache poisoning. (CVE-2016-8743)

Note: The fix for the CVE-2016-8743 issue causes httpd to return '400
Bad Request' error to HTTP clients which do not strictly follow HTTP
protocol specification. A newly introduced configuration directive
'HttpProtocolOptions Unsafe' can be used to re-enable the old less
strict parsing. However, such setting also re-introduces the
CVE-2016-8743 issue.

Bug Fix(es) :

  - When waking up child processes during a graceful
    restart, the httpd parent process could attempt to open
    more connections than necessary if a large number of
    child processes had been active prior to the restart.
    Consequently, a graceful restart could take a long time
    to complete. With this update, httpd has been fixed to
    limit the number of connections opened during a graceful
    restart to the number of active children, and the
    described problem no longer occurs.

  - Previously, httpd running in a container returned the
    500 HTTP status code (Internal Server Error) when a
    connection to a WebSocket server was closed. As a
    consequence, the httpd server failed to deliver the
    correct HTTP status and data to a client. With this
    update, httpd correctly handles all proxied requests to
    the WebSocket server, and the described problem no
    longer occurs.

  - In a configuration using LDAP authentication with the
    mod_authnz_ldap module, the name set using the
    AuthLDAPBindDN directive was not correctly used to bind
    to the LDAP server for all queries. Consequently,
    authorization attempts failed. The LDAP modules have
    been fixed to ensure the configured name is correctly
    bound for LDAP queries, and authorization using LDAP no
    longer fails."
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1704&L=scientific-linux-errata&F=&S=&P=7439
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?92c09d60"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/04/12");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/04/13");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2017 Tenable Network Security, Inc.");
  script_family(english:"Scientific Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Scientific Linux " >!< release) audit(AUDIT_HOST_NOT, "running Scientific Linux");
if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu >!< "x86_64" && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Scientific Linux", cpu);


flag = 0;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"httpd-2.4.6-45.el7_3.4")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"httpd-debuginfo-2.4.6-45.el7_3.4")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"httpd-devel-2.4.6-45.el7_3.4")) flag++;
if (rpm_check(release:"SL7", reference:"httpd-manual-2.4.6-45.el7_3.4")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"httpd-tools-2.4.6-45.el7_3.4")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"mod_ldap-2.4.6-45.el7_3.4")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"mod_proxy_html-2.4.6-45.el7_3.4")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"mod_session-2.4.6-45.el7_3.4")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"mod_ssl-2.4.6-45.el7_3.4")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
