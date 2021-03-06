#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(91818);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2017/03/22 14:08:09 $");

  script_cve_id("CVE-2016-5687", "CVE-2016-5688");
  script_bugtraq_id(91283);
  script_osvdb_id(140067, 140068, 140069);

  script_name(english:"ImageMagick 6.x < 6.9.4-3 / 7.x < 7.0.1-4 Multiple Vulnerabilities");
  script_summary(english:"Checks the version of ImageMagick.");

  script_set_attribute(attribute:"synopsis", value:
"An application installed on the remote Windows host is affected by
multiple vulnerabilities.");
  script_set_attribute(attribute:"description", value:
"The version of ImageMagick installed on the remote Windows host is 6.x
prior to 6.9.4-3 or 7.x prior to 7.0.1-4. It is, therefore, affected
by the following vulnerabilities :

  - An out-of-bounds read error exists in the
    VerticalFilter() function in coders/dds.c due to
    improper handling of malformed DDS files. An
    unauthenticated, remote attacker can exploit this, by
    convincing a user to open a specially crafted DDS file,
    to crash processes linked against the library, resulting
    in a denial of service condition. (CVE-2016-5687)

  - An overflow condition exists in the ReadWPGImage()
    function in coders/wpg.c due to improper validation of
    user-supplied input when handling WPG files. An
    unauthenticated, remote attacker can exploit this, by
    convincing a user to open a specially crafted WPG file,
    to cause a denial of service condition or the execution
    of arbitrary code. (CVE-2016-5688, VulnDB 140068)

  - An invalid write error exists in the OpenPixelCache()
    function in MagickCore/cache.c due to improper handling
    of resources. An unauthenticated, remote attacker can
    exploit this to cause a denial of service condition or
    the execution of arbitrary code. (CVE-2016-5688,
    VulnDB 140069)");
  script_set_attribute(attribute:"see_also", value:"http://www.imagemagick.org/script/changelog.php");
  # https://blog.fuzzing-project.org/46-Various-invalid-memory-accesses-in-ImageMagick-WPG,-DDS,-DCM.html
  script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?0b5f3426");
  script_set_attribute(attribute:"solution", value:
"Upgrade to ImageMagick version 6.9.4-3 / 7.0.1-4 or later.

Note that you may need to manually uninstall the vulnerable version
from the system.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"vuln_publication_date", value:"2016/06/14");
  script_set_attribute(attribute:"patch_publication_date", value:"2016/06/14");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/06/24");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:imagemagick:imagemagick");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2016-2017 Tenable Network Security, Inc.");

  script_dependencies("imagemagick_installed.nasl");
  script_require_keys("installed_sw/ImageMagick");

  exit(0);
}

include("audit.inc");
include("global_settings.inc");
include("misc_func.inc");
include("install_func.inc");

app = "ImageMagick";

# Get installs
install = get_single_install(app_name:app, exit_if_unknown_ver:TRUE);
display_version = install['display_version'];
version         = install['version'];
build           = install['build'];
path            = install['path'];

vuln = FALSE;

# determine fix version
if (version =~ "^6\.")
{
  fix = "6.9.4";
  fix_build = 3;
}
else if (version =~ "^7\.")
{
  fix = "7.0.1";
  fix_build = 4;
}
else
  audit(AUDIT_INST_PATH_NOT_VULN, app, display_version, path);

display_fix = fix + "-" + fix_build;

if (ver_compare(ver:version, fix:fix, strict:FALSE) < 0)
  vuln = TRUE;

if ((ver_compare(ver:version, fix:fix, strict:FALSE) == 0)  &&
    build < fix_build
   )
  vuln = TRUE;

if (vuln)
{
  port = get_kb_item("SMB/transport");
  if (!port) port = 445;

  items = make_array("Installed version", display_version,
                     "Fixed version", display_fix,
                     "Path", path
                    );

  order = make_list("Path", "Installed version", "Fixed version");
  report = report_items_str(report_items:items, ordered_fields:order);

  security_report_v4(port:port, extra:report, severity:SECURITY_HOLE);
  exit(0);
}
else
  audit(AUDIT_INST_PATH_NOT_VULN, app, display_version, path);
