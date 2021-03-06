#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(62592);
  script_version("$Revision: 1.9 $");
  script_cvs_date("$Date: 2015/02/13 21:07:13 $");

  script_cve_id("CVE-2012-4191", "CVE-2012-4192", "CVE-2012-4193");
  script_bugtraq_id(56153, 56154, 56155);
  script_osvdb_id(86125, 86126, 86128);

  script_name(english:"SeaMonkey < 2.13.1 Multiple Vulnerabilities");
  script_summary(english:"Checks version of SeaMonkey");

  script_set_attribute(
    attribute:"synopsis",
    value:
"The remote Windows host contains a web browser that is affected by
multiple vulnerabilities."
  );
  script_set_attribute(
    attribute:"description",
    value:
"The installed version of SeaMonkey is earlier than 2.13.1.  As such,
it is potentially affected by the following security issues :

  - An unspecified error related to the WebSockets
    implementation and the function
    'mozilla::net::FailDelayManager::Lookup' could allow
    application crashes and potentially, arbitrary code
    execution. (CVE-2012-4191)

  - An unspecified error exists that could allow attackers 
    to bypass the 'Same Origin Policy' and access the
    'Location' object. (CVE-2012-4192)

  - An error exists related to 'security wrappers' and the
    function 'defaultValue()' that could allow cross-site
    scripting attacks. (CVE-2012-4193)"
  );
  # http://www.thespanner.co.uk/2012/10/10/firefox-knows-what-your-friends-did-last-summer/
  script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?8993e6b4");
  # https://blog.mozilla.org/security/2012/10/10/security-vulnerability-in-firefox-16/
  script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?dc43f3c3");
  script_set_attribute(attribute:"see_also", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-88.html");
  script_set_attribute(attribute:"see_also", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-89.html");

  script_set_attribute(attribute:"solution", value:"Upgrade to SeaMonkey 2.13.1 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");
  script_cwe_id(20, 74, 79, 442, 629, 711, 712, 722, 725, 750, 751, 800, 801, 809, 811, 864, 900, 928, 931, 990);

  script_set_attribute(attribute:"vuln_publication_date", value:"2012/10/10");
  script_set_attribute(attribute:"patch_publication_date", value:"2012/10/11");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/10/17");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:mozilla:seamonkey");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2012-2015 Tenable Network Security, Inc.");
 
  script_dependencies("mozilla_org_installed.nasl");
  script_require_keys("SeaMonkey/Version");
  exit(0);
}

include("mozilla_version.inc");
port = get_kb_item("SMB/transport");
if (!port) port = 445;

installs = get_kb_list("SMB/SeaMonkey/*");
if (isnull(installs)) audit(AUDIT_NOT_INST, "SeaMonkey");

mozilla_check_version(installs:installs, product:'seamonkey', fix:'2.13.1', severity:SECURITY_HOLE, xss:TRUE);