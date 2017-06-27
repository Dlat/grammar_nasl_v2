#
# (C) Tenable Network Security, Inc.
#
# The descriptive text in this plugin was
# extracted from the Oracle SunOS Patch Updates.
#
include("compat.inc");

if (description)
{
  script_id(24853);
  script_version("$Revision: 1.13 $");
  script_cvs_date("$Date: 2014/08/30 00:33:50 $");

  script_cve_id("CVE-2007-1419", "CVE-2011-0849");

  script_name(english:"Solaris 8 (sparc) : 119044-04");
  script_summary(english:"Check for patch 119044-04");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote host is missing Sun Security Patch number 119044-04"
  );
  script_set_attribute(
    attribute:"description", 
    value:
"JDMK 5.1: patch for Solaris 8 9 10 8_x86 9_x86 10_x86.
Date this patch was last updated by Sun : Mar/15/11"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://getupdates.oracle.com/readme/119044-04"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"You should install this patch for your system to be up-to-date."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:S/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:sun:solaris");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/03/15");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/03/18");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2014 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris/showrev");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

if (solaris_check_patch(release:"5.8", arch:"sparc", patch:"119044-04", obsoleted_by:"", package:"SUNWjdmk-sdk", version:"5.1,REV=34") < 0) flag++;
if (solaris_check_patch(release:"5.8", arch:"sparc", patch:"119044-04", obsoleted_by:"", package:"SUNWjdmk-runtime", version:"5.1,REV=34") < 0) flag++;
if (solaris_check_patch(release:"5.8", arch:"sparc", patch:"119044-04", obsoleted_by:"", package:"SUNWjdmk-runtime-jmx", version:"5.1,REV=34") < 0) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:solaris_get_report());
  else security_warning(0);
  exit(0);
}
audit(AUDIT_HOST_NOT, "affected");