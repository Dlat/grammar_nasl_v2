#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-3263. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(83546);
  script_version("$Revision: 2.6 $");
  script_cvs_date("$Date: 2016/05/05 16:01:12 $");

  script_cve_id("CVE-2015-3306");
  script_bugtraq_id(74238);
  script_osvdb_id(120834);
  script_xref(name:"DSA", value:"3263");

  script_name(english:"Debian DSA-3263-1 : proftpd-dfsg - security update");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Vadim Melihow discovered that in proftpd-dfsg, an FTP server, the
mod_copy module allowed unauthenticated users to copy files around on
the server, and possibly to execute arbitrary code."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=782781"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/wheezy/proftpd-dfsg"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/jessie/proftpd-dfsg"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2015/dsa-3263"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the proftpd-dfsg packages.

For the oldstable distribution (wheezy), this problem has been fixed
in version 1.3.4a-5+deb7u3.

For the stable distribution (jessie), this problem has been fixed in
version 1.3.5-1.1+deb8u1."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"metasploit_name", value:'ProFTPD 1.3.5 Mod_Copy Command Execution');
  script_set_attribute(attribute:"exploit_framework_metasploit", value:"true");
  script_set_attribute(attribute:"exploit_framework_canvas", value:"true");
  script_set_attribute(attribute:"canvas_package", value:'CANVAS');

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:proftpd-dfsg");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:7.0");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:8.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/05/19");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/05/20");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015-2016 Tenable Network Security, Inc.");
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
if (deb_check(release:"7.0", prefix:"proftpd-basic", reference:"1.3.4a-5+deb7u3")) flag++;
if (deb_check(release:"7.0", prefix:"proftpd-dev", reference:"1.3.4a-5+deb7u3")) flag++;
if (deb_check(release:"7.0", prefix:"proftpd-doc", reference:"1.3.4a-5+deb7u3")) flag++;
if (deb_check(release:"7.0", prefix:"proftpd-mod-ldap", reference:"1.3.4a-5+deb7u3")) flag++;
if (deb_check(release:"7.0", prefix:"proftpd-mod-mysql", reference:"1.3.4a-5+deb7u3")) flag++;
if (deb_check(release:"7.0", prefix:"proftpd-mod-odbc", reference:"1.3.4a-5+deb7u3")) flag++;
if (deb_check(release:"7.0", prefix:"proftpd-mod-pgsql", reference:"1.3.4a-5+deb7u3")) flag++;
if (deb_check(release:"7.0", prefix:"proftpd-mod-sqlite", reference:"1.3.4a-5+deb7u3")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-basic", reference:"1.3.5-1.1+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-dev", reference:"1.3.5-1.1+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-doc", reference:"1.3.5-1.1+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-mod-geoip", reference:"1.3.5-1.1+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-mod-ldap", reference:"1.3.5-1.1+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-mod-mysql", reference:"1.3.5-1.1+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-mod-odbc", reference:"1.3.5-1.1+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-mod-pgsql", reference:"1.3.5-1.1+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"proftpd-mod-sqlite", reference:"1.3.5-1.1+deb8u1")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");