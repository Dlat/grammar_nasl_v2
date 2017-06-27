#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-2767-1. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(86379);
  script_version("$Revision: 2.4 $");
  script_cvs_date("$Date: 2016/05/24 17:44:51 $");

  script_cve_id("CVE-2015-7673", "CVE-2015-7674");
  script_osvdb_id(128371, 128372);
  script_xref(name:"USN", value:"2767-1");

  script_name(english:"Ubuntu 12.04 LTS / 14.04 LTS / 15.04 : gdk-pixbuf vulnerabilities (USN-2767-1)");
  script_summary(english:"Checks dpkg output for updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Ubuntu host is missing a security-related patch."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Gustavo Grieco discovered that the GDK-PixBuf library did not properly
handle scaling tga image files, leading to a heap overflow. If a user
or automated system were tricked into opening a tga image file, a
remote attacker could use this flaw to cause GDK-PixBuf to crash,
resulting in a denial of service, or possibly execute arbitrary code.
(CVE-2015-7673)

Gustavo Grieco discovered that the GDK-PixBuf library contained an
integer overflow when handling certain GIF images. If a user or
automated system were tricked into opening a GIF image file, a remote
attacker could use this flaw to cause GDK-PixBuf to crash, resulting
in a denial of service, or possibly execute arbitrary code.
(CVE-2015-7674).

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected libgdk-pixbuf2.0-0 package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:libgdk-pixbuf2.0-0");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:12.04:-:lts");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:14.04");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:15.04");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/10/13");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/10/14");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"Ubuntu Security Notice (C) 2015-2016 Canonical, Inc. / NASL script (C) 2015-2016 Tenable Network Security, Inc.");
  script_family(english:"Ubuntu Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/cpu", "Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

  exit(0);
}


include("audit.inc");
include("ubuntu.inc");
include("misc_func.inc");

if ( ! get_kb_item("Host/local_checks_enabled") ) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/Ubuntu/release");
if ( isnull(release) ) audit(AUDIT_OS_NOT, "Ubuntu");
release = chomp(release);
if (! ereg(pattern:"^(12\.04|14\.04|15\.04)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 12.04 / 14.04 / 15.04", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"12.04", pkgname:"libgdk-pixbuf2.0-0", pkgver:"2.26.1-1ubuntu1.3")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"libgdk-pixbuf2.0-0", pkgver:"2.30.7-0ubuntu1.2")) flag++;
if (ubuntu_check(osver:"15.04", pkgname:"libgdk-pixbuf2.0-0", pkgver:"2.31.3-1ubuntu0.2")) flag++;

if (flag)
{
  security_report_v4(
    port       : 0,
    severity   : SECURITY_WARNING,
    extra      : ubuntu_report_get()
  );
  exit(0);
}
else
{
  tested = ubuntu_pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "libgdk-pixbuf2.0-0");
}