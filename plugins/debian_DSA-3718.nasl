#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-3718. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(94943);
  script_version("$Revision: 2.9 $");
  script_cvs_date("$Date: 2017/03/24 14:10:48 $");

  script_cve_id("CVE-2016-9449", "CVE-2016-9451");
  script_osvdb_id(147439, 147441);
  script_xref(name:"DSA", value:"3718");

  script_name(english:"Debian DSA-3718-1 : drupal7 - security update");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Multiple vulnerabilities has been found in the Drupal content
management framework. For additional information, please refer to the
upstream advisory at https://www.drupal.org/SA-CORE-2016-005"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.drupal.org/SA-CORE-2016-005"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/jessie/drupal7"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2016/dsa-3718"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the drupal7 packages.

For the stable distribution (jessie), this problem has been fixed in
version 7.32-1+deb8u8."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:S/C:P/I:P/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:N/I:H/A:N");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:drupal7");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:8.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/11/17");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/11/18");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016-2017 Tenable Network Security, Inc.");
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
if (deb_check(release:"8.0", prefix:"drupal7", reference:"7.32-1+deb8u8")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:deb_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");
