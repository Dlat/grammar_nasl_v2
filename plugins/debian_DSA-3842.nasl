#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-3842. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(99971);
  script_version("$Revision: 3.3 $");
  script_cvs_date("$Date: 2017/05/08 14:04:54 $");

  script_cve_id("CVE-2017-5647", "CVE-2017-5648");
  script_osvdb_id(155233, 155234);
  script_xref(name:"DSA", value:"3842");
  script_xref(name:"IAVB", value:"2017-B-0044");

  script_name(english:"Debian DSA-3842-1 : tomcat7 - security update");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Two vulnerabilities were discovered in tomcat7, a servlet and JSP
engine.

  - CVE-2017-5647
    Pipelined requests were processed incorrectly, which
    could result in some responses appearing to be sent for
    the wrong request.

  - CVE-2017-5648
    Some application listeners calls were issued against the
    wrong objects, allowing untrusted applications running
    under a SecurityManager to bypass that protection
    mechanism and access or modify information associated
    with other web applications."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security-tracker.debian.org/tracker/CVE-2017-5647"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security-tracker.debian.org/tracker/CVE-2017-5648"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/jessie/tomcat7"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2017/dsa-3842"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the tomcat7 packages.

For the stable distribution (jessie), these problems have been fixed
in version 7.0.56-3+deb8u10.

For the upcoming stable (stretch) and unstable (sid) distributions,
these problems have been fixed in version 7.0.72-3."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:N");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:tomcat7");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:8.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/05/03");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/05/04");
  script_set_attribute(attribute:"stig_severity", value:"I");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2017 Tenable Network Security, Inc.");
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
if (deb_check(release:"8.0", prefix:"libservlet3.0-java", reference:"7.0.56-3+deb8u10")) flag++;
if (deb_check(release:"8.0", prefix:"libservlet3.0-java-doc", reference:"7.0.56-3+deb8u10")) flag++;
if (deb_check(release:"8.0", prefix:"libtomcat7-java", reference:"7.0.56-3+deb8u10")) flag++;
if (deb_check(release:"8.0", prefix:"tomcat7", reference:"7.0.56-3+deb8u10")) flag++;
if (deb_check(release:"8.0", prefix:"tomcat7-admin", reference:"7.0.56-3+deb8u10")) flag++;
if (deb_check(release:"8.0", prefix:"tomcat7-common", reference:"7.0.56-3+deb8u10")) flag++;
if (deb_check(release:"8.0", prefix:"tomcat7-docs", reference:"7.0.56-3+deb8u10")) flag++;
if (deb_check(release:"8.0", prefix:"tomcat7-examples", reference:"7.0.56-3+deb8u10")) flag++;
if (deb_check(release:"8.0", prefix:"tomcat7-user", reference:"7.0.56-3+deb8u10")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:deb_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
