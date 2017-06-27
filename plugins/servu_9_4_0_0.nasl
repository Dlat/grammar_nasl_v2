#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(45140);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2013/01/24 23:01:00 $");

  script_bugtraq_id(38923);
  script_xref(name:"Secunia", value:"39060");

  script_name(english:"Serv-U < 9.4.0.0");
  script_summary(english:"Checks Serv-U version");

  script_set_attribute(attribute:"synopsis", value:
"The remote FTP server is affected by multiple vulnerabilities.");

  script_set_attribute(attribute:"description", value:
"According to its banner, the installed version of Serv-U is earlier
than 9.4.0.0, and is, therefore, potentially affected by the following
issues :

  - When importing users, restricted administrators could
    create user accounts outside their home directory.

  - When exporting users, restricted administrators could
    see a user's full path for home directory, virtual paths,
    and directory access rules.

  - A restricted domain administrator could create a user 
    or group that was not locked in the user's home 
    directory.

  - A denial of service issue when handling a large number
    of concurrent HTTP requests.");
  script_set_attribute(attribute:"see_also", value:"http://www.serv-u.com/releasenotes/");
  script_set_attribute(attribute:"solution", value:"Upgrade to Serv-U version 9.4.0.0 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"vuln_publication_date", value:"2010/03/24");
  script_set_attribute(attribute:"patch_publication_date", value:"2010/03/24");
  script_set_attribute(attribute:"plugin_publication_date", value:"2010/03/24");

  script_set_attribute(attribute:"plugin_type", value:"remote");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:serv-u:serv-u");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"FTP");

  script_copyright(english:"This script is Copyright (C) 2010-2013 Tenable Network Security, Inc.");

  script_dependencies("servu_version.nasl");
  script_require_keys("ftp/servu");
  script_require_ports("Services/ftp", 21);

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("ftp_func.inc");


port    = get_ftp_port(default:21);
version = get_kb_item_or_exit('ftp/'+port+'/servu/version');
source  = get_kb_item_or_exit('ftp/'+port+'/servu/source');

if (
  version =~ "^([0-2]|[7-9])\." &&
  ver_compare(ver: version , fix: '9.4', strict: FALSE) == -1
)
{
  if (report_verbosity > 0)
  {
    report = 
      '\n  Version source    : ' + source +
      '\n  Installed version : ' + version + 
      '\n  Fixed version     : 9.4.0.0' +
      '\n';
    security_warning(port: port, extra: report);
  }
  else security_warning(port);
}
else exit(0, "The Serv-U version "+version+" install listening on port "+port+" is not affected.");