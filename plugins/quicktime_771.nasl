#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");


if (description)
{
  script_id(56667);
  script_version("$Revision: 1.11 $");
  script_cvs_date("$Date: 2016/05/19 17:53:34 $");

  script_cve_id(
    "CVE-2011-3218",
    "CVE-2011-3219",
    "CVE-2011-3220",
    "CVE-2011-3221",
    "CVE-2011-3222",
    "CVE-2011-3223",
    "CVE-2011-3228",
    "CVE-2011-3247",
    "CVE-2011-3248",
    "CVE-2011-3249",
    "CVE-2011-3250",
    "CVE-2011-3251"
  );
  script_bugtraq_id(
    50068,
    50100,
    50101,
    50122,
    50127,
    50130,
    50131,
    50399,
    50400,
    50401,
    50403,
    50404
  );
  script_osvdb_id(
    76372,
    76373,
    76374,
    76377,
    76378,
    76379,
    76380,
    76540,
    76541,
    76542,
    76543,
    76544,
    78313
  );

  script_name(english:"QuickTime < 7.7.1 Multiple Vulnerabilities (Windows)");
  script_summary(english:"Checks version of QuickTime on Windows");
 
  script_set_attribute(
    attribute:"synopsis",
    value:
"The remote Windows host contains an application that may be affected
by multiple vulnerabilities."
  );
  script_set_attribute(
    attribute:"description",
    value:
"The version of QuickTime installed on the remote Windows host is
older than 7.7.1 and may be affected by the following 
vulnerabilities :

  - A cross-site scripting issue exists in HTML files
    generated by the 'Save for Web' export feature.
    (CVE-2011-3218)

  - A buffer overflow error exists in the handling of
    H.264 encoded video files. (CVE-2011-3219)

  - An error exists in the processing of URL data handlers 
    in movie files and can allow access to uninitialized 
    areas of memory. (CVE-2011-3220)

  - An error exists in the handling of the 'atoms' 
    hierarchy as well as 'TKHD atoms' in movie files.
    (CVE-2011-3221, CVE-2011-3251)

  - Buffer overflow errors exist in the processing of
    of FlashPix, FLIC, PICT and FLC-encoded files. 
    (CVE-2011-3222, CVE-2011-3223, CVE-2011-3247, 
    CVE-2011-3249)

  - An unspecified error can allow memory corruption when
    viewing certain video files. (CVE-2011-3228)

  - An error related to signedness exists in the handling 
    of font tables in QuickTime video files. (CVE-2011-3248)

  - An integer overflow error exists in the handling of 
    JPEG2000 encoded video files. (CVE-2011-3250)"
  );
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-11-295/");
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-11-303/");
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-11-311/");
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-11-312/");
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-11-313/");
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-11-314/");
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-11-315/");
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-11-316/");
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-12-136/");
  script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/523931/30/0/threaded");
  script_set_attribute(attribute:"see_also", value:"http://support.apple.com/kb/HT5016");
  script_set_attribute(attribute:"solution", value:"Upgrade to QuickTime 7.7.1 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");
  script_cwe_id(20, 74, 79, 442, 629, 711, 712, 722, 725, 750, 751, 800, 801, 809, 811, 864, 900, 928, 931, 990);

  script_set_attribute(attribute:"vuln_publication_date", value:"2011/10/27");
  script_set_attribute(attribute:"patch_publication_date", value:"2011/10/28");
  script_set_attribute(attribute:"plugin_publication_date", value:"2011/10/28");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:apple:quicktime");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2011-2016 Tenable Network Security, Inc.");

  script_dependencies("quicktime_installed.nasl");
  script_require_keys("SMB/QuickTime/Version");

  exit(0);
}


include("global_settings.inc");
include("misc_func.inc");


kb_base = "SMB/QuickTime/";

version = get_kb_item_or_exit(kb_base+"Version");
version_ui = get_kb_item(kb_base+"Version_UI");

if (isnull(version_ui)) version_report = version;
else version_report = version_ui;

fixed_version = "7.71.80.42";
fixed_version_ui = "7.7.1 (1680.42)";

if (ver_compare(ver:version, fix:fixed_version) == -1)
{
  set_kb_item(name: 'www/0/XSS', value: TRUE);
  if (report_verbosity > 0)
  {
    path = get_kb_item(kb_base+"Path");
    if (isnull(path)) path = 'n/a';

    report =
      '\n  Path              : '+path+
      '\n  Installed version : '+version_report+
      '\n  Fixed version     : '+fixed_version_ui+'\n';
    security_hole(port:get_kb_item("SMB/transport"), extra:report);
  }
  else security_hole(get_kb_item("SMB/transport"));
  exit(0);
}
else exit(0, "The QuickTime "+version_report+" install on the host is not affected.");