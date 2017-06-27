#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from the Oracle CPU for jan2016.
#
include("compat.inc");

if (description)
{
  script_id(88002);
  script_version("$Revision: 2.13 $");
  script_cvs_date("$Date: 2016/04/29 19:33:20 $");

  script_cve_id("CVE-2016-0406", "CVE-2016-0458", "CVE-2016-0493", "CVE-2016-0535");
  script_bugtraq_id(81090, 81101, 81103, 81146);
  script_osvdb_id(133352, 133353, 133354, 133355, 133357, 133358, 133359, 133360, 133361, 133362, 133363, 133364, 133365, 133366, 133367, 133369, 133370, 133371, 133372);

  script_name(english:"Oracle Solaris Critical Patch Update : jan2016_SRU11_3_3_6_0");
  script_summary(english:"Check for the jan2016 CPU");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Solaris system is missing a security patch from CPU
jan2016."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"This Solaris system is missing necessary patches to address critical
security updates :

  - Vulnerability in the Solaris component of Oracle Sun
    Systems Products Suite (subcomponent: Libc Library). The
    supported version that is affected is 11. Difficult to
    exploit vulnerability requiring logon to Operating
    System. Successful attack of this vulnerability can
    result in unauthorized update, insert or delete access
    to some Solaris accessible data and ability to cause a
    partial denial of service (partial DOS) of Solaris.
    (CVE-2016-0406)

  - Vulnerability in the Solaris component of Oracle Sun
    Systems Products Suite (subcomponent: Kernel DAX). The
    supported version that is affected is 11. Very difficult
    to exploit vulnerability requiring logon to Operating
    System. Successful attack of this vulnerability can
    result in unauthorized Operating System hang or
    frequently repeatable crash (complete DOS).
    (CVE-2016-0458)

  - Vulnerability in the Solaris component of Oracle Sun
    Systems Products Suite (subcomponent: Kernel
    Cryptography). The supported version that is affected is
    11. Difficult to exploit vulnerability requiring logon
    to Operating System. Successful attack of this
    vulnerability can result in unauthorized update, insert
    or delete access to some Solaris accessible data and
    ability to cause a partial denial of service (partial
    DOS) of Solaris. (CVE-2016-0493)

  - Vulnerability in the Solaris component of Oracle Sun
    Systems Products Suite (subcomponent: RPC). Supported
    versions that are affected are 10 and 11. Difficult to
    exploit vulnerability allows successful unauthenticated
    network attacks via RPC. Successful attack of this
    vulnerability can result in unauthorized ability to
    cause a partial denial of service (partial DOS) of
    Solaris. (CVE-2016-0535)"
  );
  # http://www.oracle.com/ocom/groups/public/@otn/documents/webcontent/2368796.xml
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?9afc74c4"
  );
  # http://www.oracle.com/technetwork/topics/security/cpujan2016-2367955.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?da1a16c5"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://support.oracle.com/rs?type=doc&id=2091648.1"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Install the jan2016 CPU from the Oracle support website."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:solaris:11.3");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/02/12");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/01/20");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris11/release");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/Solaris11/release");
if (isnull(release)) audit(AUDIT_OS_NOT, "Solaris11");


fix_release = "0.5.11-0.175.3.3.0.6.0";

flag = 0;

if (solaris_check_release(release:"0.5.11-0.175.3.3.0.6.0", sru:"11.3.3.6.0") > 0) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:solaris_get_report2());
  else security_warning(0);
  exit(0);
}
audit(AUDIT_OS_RELEASE_NOT, "Solaris", fix_release, release);