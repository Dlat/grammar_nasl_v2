#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-1432. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(29705);
  script_version("$Revision: 1.11 $");
  script_cvs_date("$Date: 2013/05/17 23:45:45 $");

  script_cve_id("CVE-2007-5395");
  script_osvdb_id(42074);
  script_xref(name:"DSA", value:"1432");

  script_name(english:"Debian DSA-1432-1 : link-grammar - buffer overflow");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Alin Rad Pop discovered that link-grammar, Carnegie Mellon
University's link grammar parser for English, performed insufficient
validation within its tokenizer, which could allow a malicious input
file to execute arbitrary code."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=450695"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2007/dsa-1432"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the link-grammar package.

For the old stable distribution (sarge), this package is not present.

For the stable distribution (etch), this problem has been fixed in
version 4.2.2-4etch1."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cwe_id(119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:link-grammar");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:4.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/12/16");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/12/17");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2013 Tenable Network Security, Inc.");
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
if (deb_check(release:"4.0", prefix:"liblink-grammar4", reference:"4.2.2-4etch1")) flag++;
if (deb_check(release:"4.0", prefix:"liblink-grammar4-dev", reference:"4.2.2-4etch1")) flag++;
if (deb_check(release:"4.0", prefix:"link-grammar", reference:"4.2.2-4etch1")) flag++;
if (deb_check(release:"4.0", prefix:"link-grammar-dictionaries-en", reference:"4.2.2-4etch1")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
