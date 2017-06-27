#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(79858);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2015/05/16 21:12:00 $");

  script_cve_id(
    "CVE-2014-8445",
    "CVE-2014-8446",
    "CVE-2014-8447",
    "CVE-2014-8448",
    "CVE-2014-8449",
    "CVE-2014-8451",
    "CVE-2014-8452",
    "CVE-2014-8453",
    "CVE-2014-8454",
    "CVE-2014-8455",
    "CVE-2014-8456",
    "CVE-2014-8457",
    "CVE-2014-8458",
    "CVE-2014-8459",
    "CVE-2014-8460",
    "CVE-2014-8461",
    "CVE-2014-9150",
    "CVE-2014-9158",
    "CVE-2014-9159",
    "CVE-2014-9165"
  );
  script_bugtraq_id(
    71366,
    71557,
    71561,
    71562,
    71564,
    71565,
    71566,
    71567,
    71568,
    71570,
    71571,
    71572,
    71573,
    71574,
    71575,
    71576,
    71577,
    71578,
    71579,
    71580
  );
  script_osvdb_id(
    115356,
    115538,
    115539,
    115540,
    115541,
    115542,
    115543,
    115544,
    115545,
    115546,
    115547,
    115548,
    115549,
    115550,
    115551,
    115552,
    115553,
    115554,
    115555,
    115556
  );

  script_name(english:"Adobe Reader < 10.1.13 / 11.0.10 Multiple Vulnerabilities (APSB14-28) (Mac OS X)");
  script_summary(english:"Checks the version of Adobe Reader.");

  script_set_attribute(attribute:"synopsis", value:
"The version of Adobe Reader on the remote Mac OS X host is affected by
multiple vulnerabilities.");
  script_set_attribute(attribute:"description", value:
"The version of Adobe Reader installed on the remote host is a version
prior to 10.1.13 / 11.0.10. It is, therefore, affected by the
following vulnerabilities :

  - Memory corruption errors exist that allow arbitrary code
    execution. (CVE-2014-8445, CVE-2014-8446, CVE-2014-8447,
    CVE-2014-8456, CVE-2014-8458, CVE-2014-8459,
    CVE-2014-8461, CVE-2014-9158)

  - An improperly implemented JavaScript API allows
    information disclosure. (CVE-2014-8448, CVE-2014-8451)

  - An integer overflow vulnerability exists that allows
    arbitrary code execution. (CVE-2014-8449)

  - An error in handling XML external entities allows
    information disclosure. (CVE-2014-8452)

  - A same-origin policy error allows security bypass.
    (CVE-2014-8453)

  - Use-after-free errors exist that allow arbitrary code
    execution. (CVE-2014-8454, CVE-2014-8455, CVE-2014-9165)

  - Heap-based buffer overflow flaws exist that allow
    arbitrary code execution. (CVE-2014-8457, CVE-2014-8460,
    CVE-2014-9159).

  - A time-of-check time-of-use (TOCTOU) race condition
    allows arbitrary file system writes. (CVE-2014-9150)

Note that Nessus has not tested for these issues but has instead
relied only on the application's self-reported version number.");
  script_set_attribute(attribute:"see_also", value:"https://helpx.adobe.com/security/products/acrobat/apsb14-28.html");
  script_set_attribute(attribute:"solution", value:"Upgrade to Adobe Reader 10.1.13 / 11.0.10 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");

  script_set_attribute(attribute:"vuln_publication_date", value:"2014/08/27");
  script_set_attribute(attribute:"patch_publication_date", value:"2014/12/09");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/12/10");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:adobe:acrobat_reader");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"MacOS X Local Security Checks");

  script_copyright(english:"This script is Copyright (C) 2014-2015 Tenable Network Security, Inc.");

  script_dependencies("macosx_adobe_reader_installed.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/MacOSX/Version", "installed_sw/Adobe Reader");

  exit(0);
}

include("audit.inc");
include("global_settings.inc");
include("misc_func.inc");
include("install_func.inc");

get_kb_item_or_exit("Host/local_checks_enabled");
os = get_kb_item("Host/MacOSX/Version");
if (empty_or_null(os)) audit(AUDIT_OS_NOT, "Mac OS X");

app_name = "Adobe Reader";
install = get_single_install(app_name:app_name);

version = install['version'];
path    = install['path'];

ver = split(version, sep:'.', keep:FALSE);
for (i=0; i<max_index(ver); i++)
  ver[i] = int(ver[i]);

# Affected for Mac is :
# 10.x < 10.1.13
# 11.x < 11.0.10
if (
  (ver[0] == 10 && ver[1] < 1) ||
  (ver[0] == 10 && ver[1] == 1 && ver[2] < 13) ||
  (ver[0] == 11 && ver[1] == 0 && ver[2] < 10)
)
{
  if (report_verbosity > 0)
  {
    report = '\n  Path              : '+path+
             '\n  Installed version : '+version+
             '\n  Fixed version     : 10.1.13 / 11.0.10' +
             '\n';
    security_hole(port:0, extra:report);
  }
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_INST_PATH_NOT_VULN, app_name, version, path);