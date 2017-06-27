#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-3403. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(87058);
  script_version("$Revision: 2.2 $");
  script_cvs_date("$Date: 2016/04/28 18:33:24 $");

  script_osvdb_id(129952);
  script_xref(name:"DSA", value:"3403");

  script_name(english:"Debian DSA-3403-1 : libcommons-collections3-java - security update");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"This update backports changes from the commons-collections 3.2.2
release which disable the deserialisation of the functors classes
unless the system property
org.apache.commons.collections.enableUnsafeSerialization is set to
'true'. This fixes a vulnerability in unsafe applications
deserialising objects from untrusted sources without sanitising the
input data. Classes considered unsafe are: CloneTransformer,
ForClosure, InstantiateFactory, InstantiateTransformer,
InvokerTransformer, PrototypeCloneFactory,
PrototypeSerializationFactory and WhileClosure."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/wheezy/libcommons-collections3-java"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/jessie/libcommons-collections3-java"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2015/dsa-3403"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the libcommons-collections3-java packages.

For the oldstable distribution (wheezy), this problem has been fixed
in version 3.2.1-5+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 3.2.1-7+deb8u1."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:libcommons-collections3-java");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:7.0");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:8.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/11/24");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/11/25");
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
if (deb_check(release:"7.0", prefix:"libcommons-collections3-java", reference:"3.2.1-5+deb7u1")) flag++;
if (deb_check(release:"7.0", prefix:"libcommons-collections3-java-doc", reference:"3.2.1-5+deb7u1")) flag++;
if (deb_check(release:"8.0", prefix:"libcommons-collections3-java", reference:"3.2.1-7+deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"libcommons-collections3-java-doc", reference:"3.2.1-7+deb8u1")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");