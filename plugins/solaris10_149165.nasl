#
# (C) Tenable Network Security, Inc.
#
# The descriptive text in this plugin was
# extracted from the Oracle SunOS Patch Updates.
#
include("compat.inc");

if (description)
{
  script_id(64612);
  script_version("$Revision: 1.6 $");
  script_cvs_date("$Date: 2014/08/30 00:11:54 $");

  script_cve_id("CVE-2013-1496");

  script_name(english:"Solaris 10 (sparc) : 149165-01");
  script_summary(english:"Check for patch 149165-01");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote host is missing Sun Security Patch number 149165-01"
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Vulnerability in the Solaris component of Oracle and Sun Systems
Products Suite (subcomponent: Kernel/IO). Supported versions that are
affected are 10 and 11. Easily exploitable vulnerability requiring
logon to Operating System. Successful attack of this vulnerability can
result in unauthorized Operating System hang or frequently repeatable
crash (complete DOS)."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://getupdates.oracle.com/readme/149165-01"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"You should install this patch for your system to be up-to-date."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:N/I:N/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:sun:solaris");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/02/06");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/02/13");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2014 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris/showrev");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"149165-01", obsoleted_by:"", package:"SUNWckr", version:"11.10.0,REV=2005.01.21.15.53") < 0) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:solaris_get_report());
  else security_warning(0);
  exit(0);
}
audit(AUDIT_HOST_NOT, "affected");
