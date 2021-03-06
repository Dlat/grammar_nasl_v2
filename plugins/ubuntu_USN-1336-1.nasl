#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-1336-1. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(57660);
  script_version("$Revision: 1.15 $");
  script_cvs_date("$Date: 2016/10/26 14:05:57 $");

  script_cve_id("CVE-2011-2203", "CVE-2011-4077", "CVE-2011-4110", "CVE-2011-4132", "CVE-2011-4330", "CVE-2012-0044", "CVE-2012-0056");
  script_bugtraq_id(51625);
  script_osvdb_id(78509);
  script_xref(name:"USN", value:"1336-1");

  script_name(english:"Ubuntu 11.10 : linux vulnerability (USN-1336-1)");
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
"Clement Lecigne discovered a bug in the HFS filesystem. A local
attacker could exploit this to cause a kernel oops. (CVE-2011-2203)

A bug was discovered in the XFS filesystem's handling of pathnames. A
local attacker could exploit this to crash the system, leading to a
denial of service, or gain root privileges. (CVE-2011-4077)

A flaw was found in how the Linux kernel handles user-defined key
types. An unprivileged local user could exploit this to crash the
system. (CVE-2011-4110)

A flaw was found in the Journaling Block Device (JBD). A local
attacker able to mount ext3 or ext4 file systems could exploit this to
crash the system, leading to a denial of service. (CVE-2011-4132)

Clement Lecigne discovered a bug in the HFS file system bounds
checking. When a malformed HFS file system is mounted a local user
could crash the system or gain root privileges. (CVE-2011-4330)

Chen Haogang discovered an integer overflow that could result in
memory corruption. A local unprivileged user could use this to crash
the system. (CVE-2012-0044)

Juri Aedla discovered that the kernel incorrectly handled
/proc/<pid>/mem permissions. A local attacker could exploit this and
gain root privileges. (CVE-2012-0056).

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");
  script_set_attribute(attribute:"exploit_framework_canvas", value:"true");
  script_set_attribute(attribute:"canvas_package", value:'CANVAS');

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-3.0-generic");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-3.0-generic-pae");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-3.0-server");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-3.0-virtual");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:11.10");

  script_set_attribute(attribute:"patch_publication_date", value:"2012/01/23");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/01/24");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"Ubuntu Security Notice (C) 2012-2016 Canonical, Inc. / NASL script (C) 2012-2016 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(11\.10)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 11.10", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"11.10", pkgname:"linux-image-3.0.0-15-generic", pkgver:"3.0.0-15.26")) flag++;
if (ubuntu_check(osver:"11.10", pkgname:"linux-image-3.0.0-15-generic-pae", pkgver:"3.0.0-15.26")) flag++;
if (ubuntu_check(osver:"11.10", pkgname:"linux-image-3.0.0-15-server", pkgver:"3.0.0-15.26")) flag++;
if (ubuntu_check(osver:"11.10", pkgname:"linux-image-3.0.0-15-virtual", pkgver:"3.0.0-15.26")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "linux-image-3.0-generic / linux-image-3.0-generic-pae / etc");
}
