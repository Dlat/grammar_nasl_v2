#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(73203);
  script_version("$Revision: 1.9 $");
  script_cvs_date("$Date: 2017/01/30 19:28:01 $");

  script_cve_id("CVE-2014-0094");
  script_bugtraq_id(65999);
  script_osvdb_id(103918);
  script_xref(name:"CERT", value:"719225");

  script_name(english:"Apache Struts 2 'class' Parameter ClassLoader Manipulation");
  script_summary(english:"Attempts to generate a ClassLoader error.");

  script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a web application that uses a Java
framework that is affected by a security bypass vulnerability.");
  script_set_attribute(attribute:"description", value:
"The remote web application appears to use Struts 2, a web framework
that utilizes OGNL (Object-Graph Navigation Language) as an expression
language. The version of Struts 2 in use is affected by a security
bypass vulnerability due to the application allowing manipulation of
the ClassLoader via the 'class' parameter, which is directly mapped to
the getClass() method. A remote, unauthenticated attacker can take
advantage of this issue to manipulate the ClassLoader used by the
application server, allowing for the bypass of certain security
restrictions.

Note that this plugin will only report the first vulnerable instance
of a Struts 2 application.

Note also that the application may also be affected by a denial of
service vulnerability; however, Nessus has not tested for this
additional issue.");
  script_set_attribute(attribute:"see_also", value:"http://struts.apache.org/docs/version-notes-23161.html");
  script_set_attribute(attribute:"see_also", value:"http://struts.apache.org/docs/s2-020.html");
  script_set_attribute(attribute:"solution", value:"Upgrade to version 2.3.16.1 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"metasploit_name", value:'Apache Struts ClassLoader Manipulation Remote Code Execution');
  script_set_attribute(attribute:"exploit_framework_metasploit", value:"true");

  script_set_attribute(attribute:"vuln_publication_date", value:"2014/03/06");
  script_set_attribute(attribute:"patch_publication_date", value:"2014/03/05");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/03/26");

  script_set_attribute(attribute:"plugin_type", value:"remote");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:apache:struts");
  script_end_attributes();

  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses");

  script_copyright(english:"This script is Copyright (C) 2014-2017 Tenable Network Security, Inc.");

  script_dependencies("http_version.nasl", "webmirror.nasl");
  script_require_ports("Services/www", 80, 8080);

  exit(0);
}

include("audit.inc");
include("global_settings.inc");
include("http.inc");
include("misc_func.inc");

port = get_http_port(default:8080);
cgis = get_kb_list('www/' + port + '/cgi');

urls = make_list();
# To identify actions that we can test the exploit on we will look
# for files with the .action / .jsp / .do suffix from the KB.
if (!isnull(cgis))
{
  foreach cgi (cgis)
  {
    match = eregmatch(pattern:"((^.*)(/.+\.act(ion)?)($|\?|;))", string:cgi);
    if (match)
    {
      urls = make_list(urls, match[0]);
      if (!thorough_tests) break;
    }
    match2 = eregmatch(pattern:"(^.*)(/.+\.jsp)$", string:cgi);
    if (!isnull(match2))
    {
      urls = make_list(urls, match2[0]);
      if (!thorough_tests) break;
    }
    match3 = eregmatch(pattern:"(^.*)(/.+\.do)$", string:cgi);
    if (!isnull(match3))
    {
      urls = make_list(urls, match3[0]);
      if (!thorough_tests) break;
    }
  }
}
if (thorough_tests)
{
  cgi2 = get_kb_list('www/' + port + '/content/extensions/act*');
  if (!isnull(cgi2)) urls = make_list(urls, cgi2);

  cgi3 = get_kb_list('www/' + port + '/content/extensions/jsp');
  if (!isnull(cgi3)) urls = make_list(urls, cgi3);

  cgi4 = get_kb_list('www/' + port + '/content/extensions/do');
  if (!isnull(cgi4)) urls = make_list(urls, cgi4);
}

if (max_index(urls) == 0)
  audit(AUDIT_WEB_FILES_NOT, "Struts 2 .action / .do / .jsp", port);

urls = list_uniq(urls);

script = SCRIPT_NAME - ".nasl" + "-" + unixtime();

pat = "(Invalid field value for field|No result defined for action)";

foreach url (urls)
{
  res = http_send_recv3(
    method : "GET",
    port   : port,
    item   : url,
    exit_on_fail : TRUE
  );
  chk1 = egrep(pattern:pat, string:res[2], icase:TRUE);

  vuln_url = url + "?class.classLoader.URLs[0]=" + script;

  res = http_send_recv3(
    method : "GET",
    port   : port,
    item   : vuln_url,
    fetch404 : TRUE,
    exit_on_fail : TRUE
  );

  pat_match = eregmatch(pattern:pat, string:res[2], icase:TRUE);
  if (
    (res[0] =~ "200 OK|404 Not Found") &&
    (!chk1) &&
    (!empty_or_null(pat_match[1]))
  )
  {
    vuln = TRUE;
    output = strstr(res[2], pat_match[1]);
    if (empty_or_null(output)) output = res[2];
    # Stop after first vulnerable Struts app is found
    break;
  }
}

if (!vuln) exit(0, 'No vulnerable applications were detected on the web server listening on port '+port+'.');

security_report_v4(
  port       : port,
  severity   : SECURITY_WARNING,
  generic    : TRUE,
  request    : make_list(build_url(qs:vuln_url, port:port)),
  output     : chomp(output)
);
