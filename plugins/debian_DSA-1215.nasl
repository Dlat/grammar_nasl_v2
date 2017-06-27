#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-1215. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(23701);
  script_version("$Revision: 1.13 $");
  script_cvs_date("$Date: 2014/05/03 11:14:58 $");

  script_cve_id("CVE-2006-4799", "CVE-2006-4800");
  script_osvdb_id(29312, 29553);
  script_xref(name:"DSA", value:"1215");

  script_name(english:"Debian DSA-1215-1 : xine-lib - several vulnerabilities");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Several remote vulnerabilities have been discovered in the Xine
multimedia library, which may lead to the execution of arbitrary code.
The Common Vulnerabilities and Exposures project identifies the
following problems :

  - CVE-2006-4799
    The XFocus Security Team discovered that insufficient
    validation of AVI headers may lead to the execution of
    arbitrary code.

  - CVE-2006-4800
    Michael Niedermayer discovered that a buffer overflow in
    the 4XM codec may lead to the execution of arbitrary
    code."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=369876"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security-tracker.debian.org/tracker/CVE-2006-4799"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security-tracker.debian.org/tracker/CVE-2006-4800"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2006/dsa-1215"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the xine-lib packages.

For the stable distribution (sarge) these problems have been fixed in
version 1.0.1-1sarge4.

For the upcoming stable distribution (etch) these problems have been
fixed in version 1.1.2-1."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:xine-lib");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:3.1");

  script_set_attribute(attribute:"patch_publication_date", value:"2006/11/20");
  script_set_attribute(attribute:"plugin_publication_date", value:"2006/11/22");
  script_set_attribute(attribute:"vuln_publication_date", value:"2006/09/29");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2006-2014 Tenable Network Security, Inc.");
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
if (deb_check(release:"3.1", prefix:"libxine-dev", reference:"1.0.1-1sarge4")) flag++;
if (deb_check(release:"3.1", prefix:"libxine1", reference:"1.0.1-1sarge4")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");