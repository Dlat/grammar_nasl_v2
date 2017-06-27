#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-1090-1. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(52740);
  script_version("$Revision: 1.10 $");
  script_cvs_date("$Date: 2016/10/26 14:05:56 $");

  script_cve_id("CVE-2010-4075", "CVE-2010-4076", "CVE-2010-4077", "CVE-2010-4158", "CVE-2010-4163", "CVE-2010-4175", "CVE-2010-4668");
  script_bugtraq_id(44758, 44793, 44921, 45059);
  script_xref(name:"USN", value:"1090-1");

  script_name(english:"Ubuntu 10.04 LTS / 10.10 : linux vulnerabilities (USN-1090-1)");
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
"Dan Rosenberg discovered that multiple terminal ioctls did not
correctly initialize structure memory. A local attacker could exploit
this to read portions of kernel stack memory, leading to a loss of
privacy. (CVE-2010-4075)

Dan Rosenberg discovered that the SCSI subsystem did not correctly
validate iov segments. A local attacker with access to a SCSI device
could send specially crafted requests to crash the system, leading to
a denial of service. (CVE-2010-4163, CVE-2010-4668).

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-headers-2.6");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-headers-2.6-386");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-headers-2.6-generic");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-headers-2.6-generic-pae");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-headers-2.6-preempt");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-headers-2.6-server");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-headers-2.6-virtual");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-386");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-generic");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-generic-pae");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-lpia");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-preempt");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-server");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-versatile");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-virtual");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-libc-dev");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-source-2.6.32");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-source-2.6.35");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-tools-2.6");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-tools-common");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:10.04:-:lts");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:10.10");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/03/18");
  script_set_attribute(attribute:"plugin_publication_date", value:"2011/03/21");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"Ubuntu Security Notice (C) 2011-2016 Canonical, Inc. / NASL script (C) 2011-2016 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(10\.04|10\.10)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 10.04 / 10.10", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"10.04", pkgname:"linux-doc", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-headers-2.6.32-30", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-headers-2.6.32-30-386", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-headers-2.6.32-30-generic", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-headers-2.6.32-30-generic-pae", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-headers-2.6.32-30-preempt", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-headers-2.6.32-30-server", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-image-2.6.32-30-386", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-image-2.6.32-30-generic", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-image-2.6.32-30-generic-pae", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-image-2.6.32-30-lpia", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-image-2.6.32-30-preempt", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-image-2.6.32-30-server", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-image-2.6.32-30-versatile", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-image-2.6.32-30-virtual", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-libc-dev", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-source-2.6.32", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-tools-2.6.32-30", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.04", pkgname:"linux-tools-common", pkgver:"2.6.32-30.59")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-doc", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-headers-2.6.35-28", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-headers-2.6.35-28-generic", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-headers-2.6.35-28-generic-pae", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-headers-2.6.35-28-server", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-headers-2.6.35-28-virtual", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-28-generic", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-28-generic-pae", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-28-server", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-28-versatile", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-28-virtual", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-libc-dev", pkgver:"2.6.35-1028.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-source-2.6.35", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-tools-2.6.35-28", pkgver:"2.6.35-28.49")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-tools-common", pkgver:"2.6.35-28.49")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "linux-doc / linux-headers-2.6 / linux-headers-2.6-386 / etc");
}