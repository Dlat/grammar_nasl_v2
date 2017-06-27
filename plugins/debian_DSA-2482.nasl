#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-2482. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(59760);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2015/02/16 15:37:38 $");

  script_cve_id("CVE-2012-1177");
  script_bugtraq_id(52504);
  script_osvdb_id(80136);
  script_xref(name:"DSA", value:"2482");

  script_name(english:"Debian DSA-2482-1 : libgdata - insufficient certificate validation");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Vreixo Formoso discovered that libgdata, a library used to access
various Google services, wasn't validating certificates against
trusted system root CAs when using an HTTPS connection."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=664032"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/squeeze/libgdata"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2012/dsa-2482"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the libgdata packages.

For the stable distribution (squeeze), this problem has been fixed in
version 0.6.4-2+squeeze1."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:libgdata");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:6.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2012/06/02");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/06/29");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2015 Tenable Network Security, Inc.");
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
if (deb_check(release:"6.0", prefix:"gir1.0-gdata-0.0", reference:"0.6.4-2+squeeze1")) flag++;
if (deb_check(release:"6.0", prefix:"libgdata-common", reference:"0.6.4-2+squeeze1")) flag++;
if (deb_check(release:"6.0", prefix:"libgdata-dev", reference:"0.6.4-2+squeeze1")) flag++;
if (deb_check(release:"6.0", prefix:"libgdata-doc", reference:"0.6.4-2+squeeze1")) flag++;
if (deb_check(release:"6.0", prefix:"libgdata7", reference:"0.6.4-2+squeeze1")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:deb_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");