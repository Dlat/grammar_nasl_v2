#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-313. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(15150);
  script_version("$Revision: 1.19 $");
  script_cvs_date("$Date: 2013/05/18 00:07:15 $");

  script_cve_id("CVE-2003-0356", "CVE-2003-0357");
  script_bugtraq_id(7493, 7494, 7495);
  script_osvdb_id(4341, 4342, 6907, 6908, 6909, 6910, 6911, 6912, 6913, 6914, 6915, 6916, 6917);
  script_xref(name:"DSA", value:"313");

  script_name(english:"Debian DSA-313-1 : ethereal - buffer overflows, integer overflows");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Timo Sirainen discovered several vulnerabilities in ethereal, a
network traffic analyzer. These include one-byte buffer overflows in
the AIM, GIOP Gryphon, OSPF, PPTP, Quake, Quake2, Quake3, Rsync, SMB,
SMPP, and TSP dissectors, and integer overflows in the Mount and PPP
dissectors."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2003/dsa-313"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"For the stable distribution (woody) these problems have been fixed in
version 0.9.4-1woody4.

The old stable distribution (potato) does not appear to contain these
vulnerabilities.

We recommend that you update your ethereal package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:ethereal");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:3.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2003/06/11");
  script_set_attribute(attribute:"plugin_publication_date", value:"2004/09/29");
  script_set_attribute(attribute:"vuln_publication_date", value:"2003/05/01");
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
if (deb_check(release:"3.0", prefix:"ethereal", reference:"0.9.4-1woody4")) flag++;
if (deb_check(release:"3.0", prefix:"ethereal-common", reference:"0.9.4-1woody4")) flag++;
if (deb_check(release:"3.0", prefix:"ethereal-dev", reference:"0.9.4-1woody4")) flag++;
if (deb_check(release:"3.0", prefix:"tethereal", reference:"0.9.4-1woody4")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");