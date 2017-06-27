#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(66500);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2017/05/10 13:37:30 $");

  script_cve_id("CVE-2013-1014");
  script_bugtraq_id(59941);
  script_osvdb_id(93459);

  script_name(english:"iTunes < 11.0.3 Certificate Validation Vulnerability (Mac OS X)");
  script_summary(english:"Checks version of iTunes on Mac OS X");

  script_set_attribute(
    attribute:"synopsis",
    value:
"The remote host contains a multimedia application that has an
information disclosure vulnerability."
  );
  script_set_attribute(
    attribute:"description",
    value:
"The version of iTunes installed on the remote Mac OS X host is
earlier than 11.0.3 and is, therefore, affected by an information
disclosure vulnerability related to certificate validation."
  );
  script_set_attribute(attribute:"solution", value:"Upgrade to iTunes 11.0.3 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:L/I:L/A:N");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"see_also", value:"http://support.apple.com/kb/HT5766");
  script_set_attribute(attribute:"see_also", value:"http://lists.apple.com/archives/security-announce/2013/May/msg00000.html");
  script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/526623/30/0/threaded");

  script_set_attribute(attribute:"vuln_publication_date", value:"2013/05/16");
  script_set_attribute(attribute:"patch_publication_date", value:"2013/05/16");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/05/17");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:apple:itunes");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"MacOS X Local Security Checks");

  script_copyright(english:"This script is Copyright (C) 2013-2017 Tenable Network Security, Inc.");

  script_dependencies("macosx_itunes_detect.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/MacOSX/Version", "installed_sw/iTunes");

  exit(0);
}

include("vcf.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

os = get_kb_item("Host/MacOSX/Version");
if (!os) audit(AUDIT_OS_NOT, "Mac OS X");

app_info = vcf::get_app_info(app:"iTunes");

constraints = [{"fixed_version" : "11.0.3"}];

vcf::check_version_and_report(app_info:app_info, constraints:constraints, severity:SECURITY_WARNING);