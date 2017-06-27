#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-986-1. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(49303);
  script_version("$Revision: 1.16 $");
  script_cvs_date("$Date: 2016/08/16 14:42:21 $");

  script_cve_id("CVE-2010-0405");
  script_osvdb_id(68167);
  script_xref(name:"USN", value:"986-1");
  script_xref(name:"IAVB", value:"2010-B-0083");

  script_name(english:"Ubuntu 6.06 LTS / 8.04 LTS / 9.04 / 9.10 / 10.04 LTS : bzip2 vulnerability (USN-986-1)");
  script_summary(english:"Checks dpkg output for updated packages.");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Ubuntu host is missing one or more security-related
patches."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"An integer overflow was discovered in bzip2. If a user or automated
system were tricked into decompressing a crafted bz2 file, an attacker
could cause bzip2 or any application linked against libbz2 to crash or
possibly execute code as the user running the program.

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:bzip2");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:bzip2-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:lib32bz2-1.0");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:lib32bz2-dev");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:lib64bz2-1.0");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:lib64bz2-dev");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:libbz2-1.0");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:libbz2-dev");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:10.04:-:lts");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:6.06:-:lts");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:8.04:-:lts");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:9.04");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:9.10");

  script_set_attribute(attribute:"patch_publication_date", value:"2010/09/20");
  script_set_attribute(attribute:"plugin_publication_date", value:"2010/09/21");
  script_set_attribute(attribute:"stig_severity", value:"II");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"Ubuntu Security Notice (C) 2010-2016 Canonical, Inc. / NASL script (C) 2010-2016 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(6\.06|8\.04|9\.04|9\.10|10\.04)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 6.06 / 8.04 / 9.04 / 9.10 / 10.04", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"6.06", pkgname:"bzip2", pkgver:"1.0.3-0ubuntu2.2")) flag++;
if (ubuntu_check(osver:"6.06", pkgname:"lib32bz2-1.0", pkgver:"1.0.3-0ubuntu2.2")) flag++;
if (ubuntu_check(osver:"6.06", pkgname:"lib32bz2-dev", pkgver:"1.0.3-0ubuntu2.2")) flag++;
if (ubuntu_check(osver:"6.06", pkgname:"lib64bz2-1.0", pkgver:"1.0.3-0ubuntu2.2")) flag++;
if (ubuntu_check(osver:"6.06", pkgname:"lib64bz2-dev", pkgver:"1.0.3-0ubuntu2.2")) flag++;
if (ubuntu_check(osver:"6.06", pkgname:"libbz2-1.0", pkgver:"1.0.3-0ubuntu2.2")) flag++;
if (ubuntu_check(osver:"6.06", pkgname:"libbz2-dev", pkgver:"1.0.3-0ubuntu2.2")) flag++;
if (ubuntu_check(osver:"8.04", pkgname:"bzip2", pkgver:"1.0.4-2ubuntu4.1")) flag++;
if (ubuntu_check(osver:"8.04", pkgname:"bzip2-doc", pkgver:"1.0.4-2ubuntu4.1")) flag++;
if (ubuntu_check(osver:"8.04", pkgname:"lib32bz2-1.0", pkgver:"1.0.4-2ubuntu4.1")) flag++;
if (ubuntu_check(osver:"8.04", pkgname:"lib32bz2-dev", pkgver:"1.0.4-2ubuntu4.1")) flag++;
if (ubuntu_check(osver:"8.04", pkgname:"lib64bz2-1.0", pkgver:"1.0.4-2ubuntu4.1")) flag++;
if (ubuntu_check(osver:"8.04", pkgname:"lib64bz2-dev", pkgver:"1.0.4-2ubuntu4.1")) flag++;
if (ubuntu_check(osver:"8.04", pkgname:"libbz2-1.0", pkgver:"1.0.4-2ubuntu4.1")) flag++;
if (ubuntu_check(osver:"8.04", pkgname:"libbz2-dev", pkgver:"1.0.4-2ubuntu4.1")) flag++;
if (ubuntu_check(osver:"9.04", pkgname:"bzip2", pkgver:"1.0.5-1ubuntu1.1")) flag++;
if (ubuntu_check(osver:"9.04", pkgname:"bzip2-doc", pkgver:"1.0.5-1ubuntu1.1")) flag++;
if (ubuntu_check(osver:"9.04", pkgname:"lib32bz2-1.0", pkgver:"1.0.5-1ubuntu1.1")) flag++;
if (ubuntu_check(osver:"9.04", pkgname:"lib32bz2-dev", pkgver:"1.0.5-1ubuntu1.1")) flag++;
if (ubuntu_check(osver:"9.04", pkgname:"lib64bz2-1.0", pkgver:"1.0.5-1ubuntu1.1")) flag++;
if (ubuntu_check(osver:"9.04", pkgname:"lib64bz2-dev", pkgver:"1.0.5-1ubuntu1.1")) flag++;
if (ubuntu_check(osver:"9.04", pkgname:"libbz2-1.0", pkgver:"1.0.5-1ubuntu1.1")) flag++;
if (ubuntu_check(osver:"9.04", pkgname:"libbz2-dev", pkgver:"1.0.5-1ubuntu1.1")) flag++;
if (ubuntu_check(osver:"9.10", pkgname:"bzip2", pkgver:"1.0.5-3ubuntu0.1")) flag++;
if (ubuntu_check(osver:"9.10", pkgname:"bzip2-doc", pkgver:"1.0.5-3ubuntu0.1")) flag++;
if (ubuntu_check(osver:"9.10", pkgname:"lib32bz2-1.0", pkgver:"1.0.5-3ubuntu0.1")) flag++;
if (ubuntu_check(osver:"9.10", pkgname:"lib32bz2-dev", pkgver:"1.0.5-3ubuntu0.1")) flag++;
if (ubuntu_check(osver:"9.10", pkgname:"lib64bz2-1.0", pkgver:"1.0.5-3ubuntu0.1")) flag++;
if (ubuntu_check(osver:"9.10", pkgname:"lib64bz2-dev", pkgver:"1.0.5-3ubuntu0.1")) flag++;
if (ubuntu_check(osver:"9.10", pkgname:"libbz2-1.0", pkgver:"1.0.5-3ubuntu0.1")) flag++;
if (ubuntu_check(osver:"9.10", pkgname:"libbz2-dev", pkgver:"1.0.5-3ubuntu0.1")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"bzip2", pkgver:"1.0.5-4ubuntu0.1")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"bzip2-doc", pkgver:"1.0.5-4ubuntu0.1")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"lib32bz2-1.0", pkgver:"1.0.5-4ubuntu0.1")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"lib32bz2-dev", pkgver:"1.0.5-4ubuntu0.1")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"lib64bz2-1.0", pkgver:"1.0.5-4ubuntu0.1")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"lib64bz2-dev", pkgver:"1.0.5-4ubuntu0.1")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"libbz2-1.0", pkgver:"1.0.5-4ubuntu0.1")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"libbz2-dev", pkgver:"1.0.5-4ubuntu0.1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "bzip2 / bzip2-doc / lib32bz2-1.0 / lib32bz2-dev / lib64bz2-1.0 / etc");
}