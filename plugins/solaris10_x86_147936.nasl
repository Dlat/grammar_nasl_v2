#
# (C) Tenable Network Security, Inc.
#
# The descriptive text in this plugin was
# extracted from the Oracle SunOS Patch Updates.
#
include("compat.inc");

if (description)
{
  script_id(71726);
  script_version("$Revision: 1.4 $");
  script_cvs_date("$Date: 2015/01/20 14:24:50 $");

  script_name(english:"Solaris 10 (x86) : 147936-01");
  script_summary(english:"Check for patch 147936-01");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote host is missing Sun Security Patch number 147936-01"
  );
  script_set_attribute(
    attribute:"description", 
    value:
"SunVTS 7.0_x86: Patch Set 13.
Date this patch was last updated by Sun : Nov/17/11"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://getupdates.oracle.com/readme/147936-01"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"You should install this patch for your system to be up-to-date."
  );
  script_set_attribute(attribute:"risk_factor", value:"Medium");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:sun:solaris");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/11/17");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/12/28");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2015 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris/showrev");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

if (solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"147936-01", obsoleted_by:"151266-01 151673-01 148136-01 149396-01 150585-01 149896-01 ", package:"SUNWvts", version:"7.0,REV=2008.02.15.15.25") < 0) flag++;
if (solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"147936-01", obsoleted_by:"151266-01 151673-01 148136-01 149396-01 150585-01 149896-01 ", package:"SUNWvtss", version:"7.0,REV=2008.02.07.18.55") < 0) flag++;
if (solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"147936-01", obsoleted_by:"151266-01 151673-01 148136-01 149396-01 150585-01 149896-01 ", package:"SUNWvtsts", version:"7.0,REV=2008.02.15.15.25") < 0) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:solaris_get_report());
  else security_warning(0);
  exit(0);
}
audit(AUDIT_HOST_NOT, "affected");
