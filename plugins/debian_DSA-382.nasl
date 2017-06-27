#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-382. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(15219);
  script_version("$Revision: 1.20 $");
  script_cvs_date("$Date: 2013/05/18 00:11:34 $");

  script_cve_id("CVE-2003-0682", "CVE-2003-0693", "CVE-2003-0695");
  script_osvdb_id(2557, 3456);
  script_xref(name:"CERT", value:"333628");
  script_xref(name:"DSA", value:"382");

  script_name(english:"Debian DSA-382-3 : ssh - possible remote vulnerability");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A bug has been found in OpenSSH's buffer handling where a buffer could
be marked as grown when the actual reallocation failed.

DSA-382-2: This advisory is an addition to the earlier DSA-382-1
advisory: two more buffer handling problems have been found in
addition to the one described in DSA-382-1. It is not known if these
bugs are exploitable, but as a precaution an upgrade is advised.

DSA-382-3: This advisory is an addition to the earlier DSA-382-1 and
DSA-382-2 advisories: Solar Designer found four more bugs in OpenSSH
that may be exploitable."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2003/dsa-382"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"For the Debian stable distribution (woody) these bugs have been fixed
in version 1:3.4p1-1.woody.3."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:ssh");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:3.0");

  script_set_attribute(attribute:"plugin_publication_date", value:"2004/09/29");
  script_set_attribute(attribute:"vuln_publication_date", value:"2003/09/16");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2004-2013 Tenable Network Security, Inc.");
  script_family(english:"Debian Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Debian/release", "Host/Debian/dpkg-l");

  exit(0);
}


include("audit.inc");
include("debian_package.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/Debian/release")) audit(AUDIT_OS_NOT, "Debian");
if (!get_kb_item("Host/Debian/dpkg-l")) audit(AUDIT_PACKAGE_LIST_MISSING);


flag = 0;
if (deb_check(release:"3.0", prefix:"ssh", reference:"3.4p1-1.woody.3")) flag++;
if (deb_check(release:"3.0", prefix:"ssh-askpass-gnome", reference:"3.4p1-1.woody.3")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");