#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandriva Linux Security Advisory MDVSA-2009:071. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(37409);
  script_version ("$Revision: 1.12 $");
  script_cvs_date("$Date: 2015/03/19 14:49:27 $");

  script_cve_id("CVE-2009-0675", "CVE-2009-0676");
  script_bugtraq_id(33846);
  script_xref(name:"MDVSA", value:"2009:071");

  script_name(english:"Mandriva Linux Security Advisory : kernel (MDVSA-2009:071)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Mandriva Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Some vulnerabilities were discovered and corrected in the Linux 2.6
kernel :

The skfp_ioctl function in drivers/net/skfp/skfddi.c in the Linux
kernel before 2.6.28.6 permits SKFP_CLR_STATS requests only when the
CAP_NET_ADMIN capability is absent, instead of when this capability is
present, which allows local users to reset the driver statistics,
related to an inverted logic issue. (CVE-2009-0675)

The sock_getsockopt function in net/core/sock.c in the Linux kernel
before 2.6.28.6 does not initialize a certain structure member, which
allows local users to obtain potentially sensitive information from
kernel memory via an SO_BSDCOMPAT getsockopt request. (CVE-2009-0676)

Additionaly, this update provides stable 1.0.18 ALSA updates/fixes,
STAC92HD71Bx/STAC92HD75Bx hda-intel support changes/fixes (affects
sound chip codecs used on several HP dv laptop series),
fixes/enhancements for HP Educ.ar machine HDA sound support, minor
alsa hda-intel code cleanup for ALC888 6stack-dell model, to stop
printing uneeded output to kernel log, and a few more things. Check
the package changelog for details.

To update your kernel, please follow the directions located at :

http://www.mandriva.com/en/security/kernelupdate"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:N/I:P/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_cwe_id(264);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:alsa_raoppcm-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:alsa_raoppcm-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:alsa_raoppcm-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:alsa_raoppcm-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:alsa_raoppcm-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:alsa_raoppcm-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:drm-experimental-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:drm-experimental-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:drm-experimental-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:drm-experimental-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:drm-experimental-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:drm-experimental-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:et131x-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:et131x-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:et131x-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:et131x-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:et131x-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:et131x-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fcpci-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fcpci-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fcpci-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fcpci-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fcpci-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fcpci-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fglrx-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fglrx-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fglrx-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fglrx-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fglrx-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:fglrx-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:gnbd-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:gnbd-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:gnbd-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:gnbd-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:gnbd-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:gnbd-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hcfpcimodem-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hcfpcimodem-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hcfpcimodem-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hcfpcimodem-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hcfpcimodem-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hcfpcimodem-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hsfmodem-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hsfmodem-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hsfmodem-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hsfmodem-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hsfmodem-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hsfmodem-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hso-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hso-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hso-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hso-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hso-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:hso-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:iscsitarget-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:iscsitarget-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:iscsitarget-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:iscsitarget-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:iscsitarget-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:iscsitarget-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-2.6.27.19-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-desktop-2.6.27.19-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-desktop-devel-2.6.27.19-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-desktop-devel-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-desktop586-2.6.27.19-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-desktop586-devel-2.6.27.19-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-desktop586-devel-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-server-2.6.27.19-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-server-devel-2.6.27.19-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-server-devel-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-source-2.6.27.19-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kernel-source-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kqemu-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kqemu-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kqemu-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kqemu-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kqemu-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:kqemu-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lirc-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lirc-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lirc-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lirc-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lirc-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lirc-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lzma-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lzma-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lzma-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lzma-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lzma-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lzma-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:madwifi-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:madwifi-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:madwifi-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:madwifi-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:madwifi-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:madwifi-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia-current-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia-current-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia-current-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia-current-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia-current-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia-current-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia173-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia173-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia173-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia173-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia173-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia173-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia71xx-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia71xx-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia71xx-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia71xx-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia71xx-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia71xx-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia96xx-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia96xx-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia96xx-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia96xx-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia96xx-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:nvidia96xx-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omfs-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omfs-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omfs-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omfs-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omfs-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omfs-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omnibook-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omnibook-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omnibook-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omnibook-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omnibook-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:omnibook-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:opencbm-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:opencbm-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:opencbm-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:opencbm-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:opencbm-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:opencbm-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:ov51x-jpeg-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:ov51x-jpeg-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:ov51x-jpeg-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:ov51x-jpeg-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:ov51x-jpeg-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:ov51x-jpeg-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:qc-usb-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:qc-usb-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:qc-usb-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:qc-usb-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:qc-usb-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:qc-usb-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2860-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2860-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2860-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2860-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2860-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2860-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2870-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2870-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2870-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2870-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2870-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rt2870-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rtl8187se-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rtl8187se-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rtl8187se-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rtl8187se-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rtl8187se-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:rtl8187se-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:slmodem-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:slmodem-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:slmodem-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:slmodem-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:slmodem-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:slmodem-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:squashfs-lzma-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:squashfs-lzma-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:squashfs-lzma-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:squashfs-lzma-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:squashfs-lzma-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:squashfs-lzma-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:tp_smapi-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:tp_smapi-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:tp_smapi-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:tp_smapi-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:tp_smapi-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:tp_smapi-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxadd-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxadd-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxadd-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxadd-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxadd-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxadd-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxvfs-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxvfs-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxvfs-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxvfs-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxvfs-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vboxvfs-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vhba-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vhba-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vhba-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vhba-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vhba-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vhba-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:virtualbox-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:virtualbox-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:virtualbox-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:virtualbox-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:virtualbox-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:virtualbox-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vpnclient-kernel-2.6.27.19-desktop-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vpnclient-kernel-2.6.27.19-desktop586-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vpnclient-kernel-2.6.27.19-server-1mnb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vpnclient-kernel-desktop-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vpnclient-kernel-desktop586-latest");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:vpnclient-kernel-server-latest");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:linux:2009.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/03/10");
  script_set_attribute(attribute:"plugin_publication_date", value:"2009/04/23");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2009-2015 Tenable Network Security, Inc.");
  script_family(english:"Mandriva Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/Mandrake/release", "Host/Mandrake/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/Mandrake/release")) audit(AUDIT_OS_NOT, "Mandriva / Mandake Linux");
if (!get_kb_item("Host/Mandrake/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu !~ "^(amd64|i[3-6]86|x86_64)$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Mandriva / Mandrake Linux", cpu);


flag = 0;
if (rpm_check(release:"MDK2009.0", reference:"alsa_raoppcm-kernel-2.6.27.19-desktop-1mnb-0.5.1-2mdv2008.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"alsa_raoppcm-kernel-2.6.27.19-desktop586-1mnb-0.5.1-2mdv2008.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"alsa_raoppcm-kernel-2.6.27.19-server-1mnb-0.5.1-2mdv2008.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"alsa_raoppcm-kernel-desktop-latest-0.5.1-1.20090305.2mdv2008.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"alsa_raoppcm-kernel-desktop586-latest-0.5.1-1.20090305.2mdv2008.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"alsa_raoppcm-kernel-server-latest-0.5.1-1.20090305.2mdv2008.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"drm-experimental-kernel-2.6.27.19-desktop-1mnb-2.3.0-2.20080912.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"drm-experimental-kernel-2.6.27.19-desktop586-1mnb-2.3.0-2.20080912.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"drm-experimental-kernel-2.6.27.19-server-1mnb-2.3.0-2.20080912.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"drm-experimental-kernel-desktop-latest-2.3.0-1.20090305.2.20080912.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"drm-experimental-kernel-desktop586-latest-2.3.0-1.20090305.2.20080912.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"drm-experimental-kernel-server-latest-2.3.0-1.20090305.2.20080912.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"et131x-kernel-2.6.27.19-desktop-1mnb-1.2.3-7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"et131x-kernel-2.6.27.19-desktop586-1mnb-1.2.3-7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"et131x-kernel-2.6.27.19-server-1mnb-1.2.3-7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"et131x-kernel-desktop-latest-1.2.3-1.20090305.7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"et131x-kernel-desktop586-latest-1.2.3-1.20090305.7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"et131x-kernel-server-latest-1.2.3-1.20090305.7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"fcpci-kernel-2.6.27.19-desktop-1mnb-3.11.07-7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"fcpci-kernel-2.6.27.19-desktop586-1mnb-3.11.07-7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"fcpci-kernel-2.6.27.19-server-1mnb-3.11.07-7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"fcpci-kernel-desktop-latest-3.11.07-1.20090305.7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"fcpci-kernel-desktop586-latest-3.11.07-1.20090305.7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"fcpci-kernel-server-latest-3.11.07-1.20090305.7mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"fglrx-kernel-2.6.27.19-desktop-1mnb-8.522-3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"fglrx-kernel-2.6.27.19-desktop586-1mnb-8.522-3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"fglrx-kernel-2.6.27.19-server-1mnb-8.522-3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"fglrx-kernel-desktop-latest-8.522-1.20090305.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"fglrx-kernel-desktop586-latest-8.522-1.20090305.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"fglrx-kernel-server-latest-8.522-1.20090305.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"gnbd-kernel-2.6.27.19-desktop-1mnb-2.03.07-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"gnbd-kernel-2.6.27.19-desktop586-1mnb-2.03.07-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"gnbd-kernel-2.6.27.19-server-1mnb-2.03.07-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"gnbd-kernel-desktop-latest-2.03.07-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"gnbd-kernel-desktop586-latest-2.03.07-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"gnbd-kernel-server-latest-2.03.07-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hcfpcimodem-kernel-2.6.27.19-desktop-1mnb-1.17-1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hcfpcimodem-kernel-2.6.27.19-desktop586-1mnb-1.17-1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hcfpcimodem-kernel-2.6.27.19-server-1mnb-1.17-1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hcfpcimodem-kernel-desktop-latest-1.17-1.20090305.1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hcfpcimodem-kernel-desktop586-latest-1.17-1.20090305.1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hcfpcimodem-kernel-server-latest-1.17-1.20090305.1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"hsfmodem-kernel-2.6.27.19-desktop-1mnb-7.68.00.13-1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hsfmodem-kernel-2.6.27.19-desktop586-1mnb-7.68.00.13-1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"hsfmodem-kernel-2.6.27.19-server-1mnb-7.68.00.13-1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"hsfmodem-kernel-desktop-latest-7.68.00.13-1.20090305.1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hsfmodem-kernel-desktop586-latest-7.68.00.13-1.20090305.1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"hsfmodem-kernel-server-latest-7.68.00.13-1.20090305.1.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"hso-kernel-2.6.27.19-desktop-1mnb-1.2-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hso-kernel-2.6.27.19-desktop586-1mnb-1.2-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"hso-kernel-2.6.27.19-server-1mnb-1.2-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"hso-kernel-desktop-latest-1.2-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"hso-kernel-desktop586-latest-1.2-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"hso-kernel-server-latest-1.2-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"iscsitarget-kernel-2.6.27.19-desktop-1mnb-0.4.16-4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"iscsitarget-kernel-2.6.27.19-desktop586-1mnb-0.4.16-4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"iscsitarget-kernel-2.6.27.19-server-1mnb-0.4.16-4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"iscsitarget-kernel-desktop-latest-0.4.16-1.20090305.4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"iscsitarget-kernel-desktop586-latest-0.4.16-1.20090305.4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"iscsitarget-kernel-server-latest-0.4.16-1.20090305.4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-2.6.27.19-1mnb-1-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-desktop-2.6.27.19-1mnb-1-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-desktop-devel-2.6.27.19-1mnb-1-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-desktop-devel-latest-2.6.27.19-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-desktop-latest-2.6.27.19-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"kernel-desktop586-2.6.27.19-1mnb-1-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"kernel-desktop586-devel-2.6.27.19-1mnb-1-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"kernel-desktop586-devel-latest-2.6.27.19-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"kernel-desktop586-latest-2.6.27.19-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-doc-2.6.27.19-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-server-2.6.27.19-1mnb-1-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-server-devel-2.6.27.19-1mnb-1-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-server-devel-latest-2.6.27.19-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-server-latest-2.6.27.19-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-source-2.6.27.19-1mnb-1-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kernel-source-latest-2.6.27.19-1mnb2")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kqemu-kernel-2.6.27.19-desktop-1mnb-1.4.0pre1-0")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"kqemu-kernel-2.6.27.19-desktop586-1mnb-1.4.0pre1-0")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kqemu-kernel-2.6.27.19-server-1mnb-1.4.0pre1-0")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kqemu-kernel-desktop-latest-1.4.0pre1-1.20090305.0")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"kqemu-kernel-desktop586-latest-1.4.0pre1-1.20090305.0")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"kqemu-kernel-server-latest-1.4.0pre1-1.20090305.0")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"lirc-kernel-2.6.27.19-desktop-1mnb-0.8.3-4.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"lirc-kernel-2.6.27.19-desktop586-1mnb-0.8.3-4.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"lirc-kernel-2.6.27.19-server-1mnb-0.8.3-4.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"lirc-kernel-desktop-latest-0.8.3-1.20090305.4.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"lirc-kernel-desktop586-latest-0.8.3-1.20090305.4.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"lirc-kernel-server-latest-0.8.3-1.20090305.4.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"lzma-kernel-2.6.27.19-desktop-1mnb-4.43-24mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"lzma-kernel-2.6.27.19-desktop586-1mnb-4.43-24mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"lzma-kernel-2.6.27.19-server-1mnb-4.43-24mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"lzma-kernel-desktop-latest-4.43-1.20090305.24mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"lzma-kernel-desktop586-latest-4.43-1.20090305.24mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"lzma-kernel-server-latest-4.43-1.20090305.24mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"madwifi-kernel-2.6.27.19-desktop-1mnb-0.9.4-3.r3835mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"madwifi-kernel-2.6.27.19-desktop586-1mnb-0.9.4-3.r3835mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"madwifi-kernel-2.6.27.19-server-1mnb-0.9.4-3.r3835mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"madwifi-kernel-desktop-latest-0.9.4-1.20090305.3.r3835mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"madwifi-kernel-desktop586-latest-0.9.4-1.20090305.3.r3835mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"madwifi-kernel-server-latest-0.9.4-1.20090305.3.r3835mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia-current-kernel-2.6.27.19-desktop-1mnb-177.70-2.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"nvidia-current-kernel-2.6.27.19-desktop586-1mnb-177.70-2.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia-current-kernel-2.6.27.19-server-1mnb-177.70-2.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia-current-kernel-desktop-latest-177.70-1.20090305.2.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"nvidia-current-kernel-desktop586-latest-177.70-1.20090305.2.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia-current-kernel-server-latest-177.70-1.20090305.2.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia173-kernel-2.6.27.19-desktop-1mnb-173.14.12-4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"nvidia173-kernel-2.6.27.19-desktop586-1mnb-173.14.12-4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"x86_64", reference:"nvidia173-kernel-2.6.27.19-server-1mnb-173.14.12-4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia173-kernel-desktop-latest-173.14.12-1.20090305.4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"nvidia173-kernel-desktop586-latest-173.14.12-1.20090305.4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"x86_64", reference:"nvidia173-kernel-server-latest-173.14.12-1.20090305.4mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia71xx-kernel-2.6.27.19-desktop-1mnb-71.86.06-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"nvidia71xx-kernel-2.6.27.19-desktop586-1mnb-71.86.06-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia71xx-kernel-2.6.27.19-server-1mnb-71.86.06-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia71xx-kernel-desktop-latest-71.86.06-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"nvidia71xx-kernel-desktop586-latest-71.86.06-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia71xx-kernel-server-latest-71.86.06-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia96xx-kernel-2.6.27.19-desktop-1mnb-96.43.07-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"nvidia96xx-kernel-2.6.27.19-desktop586-1mnb-96.43.07-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia96xx-kernel-2.6.27.19-server-1mnb-96.43.07-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia96xx-kernel-desktop-latest-96.43.07-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"nvidia96xx-kernel-desktop586-latest-96.43.07-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"nvidia96xx-kernel-server-latest-96.43.07-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"omfs-kernel-2.6.27.19-desktop-1mnb-0.8.0-1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"omfs-kernel-2.6.27.19-desktop586-1mnb-0.8.0-1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"omfs-kernel-2.6.27.19-server-1mnb-0.8.0-1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"omfs-kernel-desktop-latest-0.8.0-1.20090305.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"omfs-kernel-desktop586-latest-0.8.0-1.20090305.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"omfs-kernel-server-latest-0.8.0-1.20090305.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"omnibook-kernel-2.6.27.19-desktop-1mnb-20080513-0.274.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"omnibook-kernel-2.6.27.19-desktop586-1mnb-20080513-0.274.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"omnibook-kernel-2.6.27.19-server-1mnb-20080513-0.274.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"omnibook-kernel-desktop-latest-20080513-1.20090305.0.274.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"omnibook-kernel-desktop586-latest-20080513-1.20090305.0.274.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"omnibook-kernel-server-latest-20080513-1.20090305.0.274.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"opencbm-kernel-2.6.27.19-desktop-1mnb-0.4.2a-1mdv2008.1", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"opencbm-kernel-2.6.27.19-desktop586-1mnb-0.4.2a-1mdv2008.1", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"opencbm-kernel-2.6.27.19-server-1mnb-0.4.2a-1mdv2008.1", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"opencbm-kernel-desktop-latest-0.4.2a-1.20090305.1mdv2008.1", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"opencbm-kernel-desktop586-latest-0.4.2a-1.20090305.1mdv2008.1", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"opencbm-kernel-server-latest-0.4.2a-1.20090305.1mdv2008.1", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"ov51x-jpeg-kernel-2.6.27.19-desktop-1mnb-1.5.9-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"ov51x-jpeg-kernel-2.6.27.19-desktop586-1mnb-1.5.9-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"ov51x-jpeg-kernel-2.6.27.19-server-1mnb-1.5.9-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"ov51x-jpeg-kernel-desktop-latest-1.5.9-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"ov51x-jpeg-kernel-desktop586-latest-1.5.9-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"ov51x-jpeg-kernel-server-latest-1.5.9-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"qc-usb-kernel-2.6.27.19-desktop-1mnb-0.6.6-6mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"qc-usb-kernel-2.6.27.19-desktop586-1mnb-0.6.6-6mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"qc-usb-kernel-2.6.27.19-server-1mnb-0.6.6-6mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"qc-usb-kernel-desktop-latest-0.6.6-1.20090305.6mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"qc-usb-kernel-desktop586-latest-0.6.6-1.20090305.6mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"qc-usb-kernel-server-latest-0.6.6-1.20090305.6mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rt2860-kernel-2.6.27.19-desktop-1mnb-1.7.0.0-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"rt2860-kernel-2.6.27.19-desktop586-1mnb-1.7.0.0-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rt2860-kernel-2.6.27.19-server-1mnb-1.7.0.0-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rt2860-kernel-desktop-latest-1.7.0.0-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"rt2860-kernel-desktop586-latest-1.7.0.0-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rt2860-kernel-server-latest-1.7.0.0-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rt2870-kernel-2.6.27.19-desktop-1mnb-1.3.1.0-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"rt2870-kernel-2.6.27.19-desktop586-1mnb-1.3.1.0-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rt2870-kernel-2.6.27.19-server-1mnb-1.3.1.0-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rt2870-kernel-desktop-latest-1.3.1.0-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"rt2870-kernel-desktop586-latest-1.3.1.0-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rt2870-kernel-server-latest-1.3.1.0-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rtl8187se-kernel-2.6.27.19-desktop-1mnb-1016.20080716-1.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"rtl8187se-kernel-2.6.27.19-desktop586-1mnb-1016.20080716-1.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rtl8187se-kernel-2.6.27.19-server-1mnb-1016.20080716-1.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rtl8187se-kernel-desktop-latest-1016.20080716-1.20090305.1.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"rtl8187se-kernel-desktop586-latest-1016.20080716-1.20090305.1.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"rtl8187se-kernel-server-latest-1016.20080716-1.20090305.1.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"slmodem-kernel-2.6.27.19-desktop-1mnb-2.9.11-0.20080817.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"slmodem-kernel-2.6.27.19-desktop586-1mnb-2.9.11-0.20080817.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"slmodem-kernel-2.6.27.19-server-1mnb-2.9.11-0.20080817.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"slmodem-kernel-desktop-latest-2.9.11-1.20090305.0.20080817.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"slmodem-kernel-desktop586-latest-2.9.11-1.20090305.0.20080817.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"slmodem-kernel-server-latest-2.9.11-1.20090305.0.20080817.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"squashfs-lzma-kernel-2.6.27.19-desktop-1mnb-3.3-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"squashfs-lzma-kernel-2.6.27.19-desktop586-1mnb-3.3-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"squashfs-lzma-kernel-2.6.27.19-server-1mnb-3.3-5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"squashfs-lzma-kernel-desktop-latest-3.3-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"squashfs-lzma-kernel-desktop586-latest-3.3-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"squashfs-lzma-kernel-server-latest-3.3-1.20090305.5mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"tp_smapi-kernel-2.6.27.19-desktop-1mnb-0.37-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"tp_smapi-kernel-2.6.27.19-desktop586-1mnb-0.37-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"tp_smapi-kernel-2.6.27.19-server-1mnb-0.37-2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"tp_smapi-kernel-desktop-latest-0.37-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"tp_smapi-kernel-desktop586-latest-0.37-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"tp_smapi-kernel-server-latest-0.37-1.20090305.2mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vboxadd-kernel-2.6.27.19-desktop-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"vboxadd-kernel-2.6.27.19-desktop586-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vboxadd-kernel-2.6.27.19-server-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vboxadd-kernel-desktop-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"vboxadd-kernel-desktop586-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vboxadd-kernel-server-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vboxvfs-kernel-2.6.27.19-desktop-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"vboxvfs-kernel-2.6.27.19-desktop586-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vboxvfs-kernel-2.6.27.19-server-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vboxvfs-kernel-desktop-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"vboxvfs-kernel-desktop586-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vboxvfs-kernel-server-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vhba-kernel-2.6.27.19-desktop-1mnb-1.0.0-1.svn304.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"vhba-kernel-2.6.27.19-desktop586-1mnb-1.0.0-1.svn304.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vhba-kernel-2.6.27.19-server-1mnb-1.0.0-1.svn304.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vhba-kernel-desktop-latest-1.0.0-1.20090305.1.svn304.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"vhba-kernel-desktop586-latest-1.0.0-1.20090305.1.svn304.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vhba-kernel-server-latest-1.0.0-1.20090305.1.svn304.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"virtualbox-kernel-2.6.27.19-desktop-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"virtualbox-kernel-2.6.27.19-desktop586-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"virtualbox-kernel-2.6.27.19-server-1mnb-2.0.2-2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"virtualbox-kernel-desktop-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"virtualbox-kernel-desktop586-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"virtualbox-kernel-server-latest-2.0.2-1.20090305.2.1mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vpnclient-kernel-2.6.27.19-desktop-1mnb-4.8.01.0640-3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"vpnclient-kernel-2.6.27.19-desktop586-1mnb-4.8.01.0640-3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vpnclient-kernel-2.6.27.19-server-1mnb-4.8.01.0640-3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vpnclient-kernel-desktop-latest-4.8.01.0640-1.20090305.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", cpu:"i386", reference:"vpnclient-kernel-desktop586-latest-4.8.01.0640-1.20090305.3mdv2009.0", yank:"mdv")) flag++;
if (rpm_check(release:"MDK2009.0", reference:"vpnclient-kernel-server-latest-4.8.01.0640-1.20090305.3mdv2009.0", yank:"mdv")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_note(port:0, extra:rpm_report_get());
  else security_note(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");