#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-857. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(19965);
  script_version("$Revision: 1.19 $");
  script_cvs_date("$Date: 2016/05/26 16:04:30 $");

  script_cve_id("CVE-2005-4803");
  script_bugtraq_id(15050);
  script_osvdb_id(19891);
  script_xref(name:"DSA", value:"857");

  script_name(english:"Debian DSA-857-1 : graphviz - insecure temporary file");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Javier Fernandez-Sanguino Pena discovered insecure temporary file
creation in graphviz, a rich set of graph drawing tools, that can be
exploited to overwrite arbitrary files by a local attacker."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2005/dsa-857"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the graphviz package.

For the old stable distribution (woody) this problem probably persists
but the package is non-free.

For the stable distribution (sarge) this problem has been fixed in
version 2.2.1-1sarge1."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:N/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:H/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"No exploit is required");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:graphviz");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:3.1");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/10/10");
  script_set_attribute(attribute:"plugin_publication_date", value:"2005/10/11");
  script_set_attribute(attribute:"vuln_publication_date", value:"2005/10/10");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2016 Tenable Network Security, Inc.");
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
if (deb_check(release:"3.1", prefix:"graphviz", reference:"2.2.1-1sarge1")) flag++;
if (deb_check(release:"3.1", prefix:"graphviz-dev", reference:"2.2.1-1sarge1")) flag++;
if (deb_check(release:"3.1", prefix:"graphviz-doc", reference:"2.2.1-1sarge1")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_note(port:0, extra:deb_report_get());
  else security_note(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");