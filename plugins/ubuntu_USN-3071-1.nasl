#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-3071-1. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(93218);
  script_version("$Revision: 2.3 $");
  script_cvs_date("$Date: 2016/10/26 14:26:01 $");

  script_cve_id("CVE-2016-5244", "CVE-2016-5696", "CVE-2016-5728", "CVE-2016-5828", "CVE-2016-5829");
  script_xref(name:"USN", value:"3071-1");

  script_name(english:"Ubuntu 14.04 LTS : linux vulnerabilities (USN-3071-1)");
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
"Kangjie Lu discovered an information leak in the Reliable Datagram
Sockets (RDS) implementation in the Linux kernel. A local attacker
could use this to obtain potentially sensitive information from kernel
memory. (CVE-2016-5244)

Yue Cao et al discovered a flaw in the TCP implementation's handling
of challenge acks in the Linux kernel. A remote attacker could use
this to cause a denial of service (reset connection) or inject content
into an TCP stream. (CVE-2016-5696)

Pengfei Wang discovered a race condition in the MIC VOP driver in the
Linux kernel. A local attacker could use this to cause a denial of
service (system crash) or obtain potentially sensitive information
from kernel memory. (CVE-2016-5728)

Cyril Bur discovered that on PowerPC platforms, the Linux kernel
mishandled transactional memory state on exec(). A local attacker
could use this to cause a denial of service (system crash) or possibly
execute arbitrary code. (CVE-2016-5828)

It was discovered that a heap based buffer overflow existed in the USB
HID driver in the Linux kernel. A local attacker could use this cause
a denial of service (system crash) or possibly execute arbitrary code.
(CVE-2016-5829).

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Update the affected linux-image-3.13-generic,
linux-image-3.13-generic-lpae and / or linux-image-3.13-lowlatency
packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-3.13-generic");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-3.13-generic-lpae");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-3.13-lowlatency");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:14.04");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/08/29");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/08/30");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"Ubuntu Security Notice (C) 2016 Canonical, Inc. / NASL script (C) 2016 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(14\.04)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 14.04", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"14.04", pkgname:"linux-image-3.13.0-95-generic", pkgver:"3.13.0-95.142")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"linux-image-3.13.0-95-generic-lpae", pkgver:"3.13.0-95.142")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"linux-image-3.13.0-95-lowlatency", pkgver:"3.13.0-95.142")) flag++;

if (flag)
{
  security_report_v4(
    port       : 0,
    severity   : SECURITY_HOLE,
    extra      : ubuntu_report_get()
  );
  exit(0);
}
else
{
  tested = ubuntu_pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "linux-image-3.13-generic / linux-image-3.13-generic-lpae / etc");
}
