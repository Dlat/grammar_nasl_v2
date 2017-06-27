#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Debian Security Advisory DLA-387-1. The text
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(87933);
  script_version("$Revision: 2.7 $");
  script_cvs_date("$Date: 2016/12/06 20:03:51 $");

  script_cve_id("CVE-2016-0777", "CVE-2016-0778");
  script_osvdb_id(132883, 132884);

  script_name(english:"Debian DLA-387-1 : openssh security update");
  script_summary(english:"Checks dpkg output for the updated packages.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The Qualys Security team discovered two vulnerabilities in the roaming
code of the OpenSSH client (an implementation of the SSH protocol
suite).

SSH roaming enables a client, in case an SSH connection breaks
unexpectedly, to resume it at a later time, provided the server also
supports it.

The OpenSSH server doesn't support roaming, but the OpenSSH client
supports it (even though it's not documented) and it's enabled by
default.

CVE-2016-0777

An information leak (memory disclosure) can be exploited by a rogue
SSH server to trick a client into leaking sensitive data from the
client memory, including for example private keys.

CVE-2016-0778

A buffer overflow (leading to file descriptor leak), can also be
exploited by a rogue SSH server, but due to another bug in the code is
possibly not exploitable, and only under certain conditions (not the
default configuration), when using ProxyCommand, ForwardAgent or
ForwardX11.

This security update completely disables the roaming code in the
OpenSSH client.

It is also possible to disable roaming by adding the (undocumented)
option 'UseRoaming no' to the global /etc/ssh/ssh_config file, or to
the user configuration in ~/.ssh/config, or by passing -oUseRoaming=no
on the command line.

Users with passphrase-less privates keys, especially in non
interactive setups (automated jobs using ssh, scp, rsync+ssh etc.) are
advised to update their keys if they have connected to an SSH server
they don't trust.

More details about identifying an attack and mitigations can be found
in the Qualys Security Advisory.

  - -- Yves-Alexis Perez

NOTE: Tenable Network Security has extracted the preceding description
block directly from the DLA security advisory. Tenable has attempted
to automatically clean and format it as much as possible without
introducing additional issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://lists.debian.org/debian-lts-announce/2016/01/msg00010.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/squeeze-lts/openssh"
  );
  script_set_attribute(attribute:"solution", value:"Upgrade the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:H/Au:S/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:openssh-client");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:openssh-client-udeb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:openssh-server");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:openssh-server-udeb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:ssh");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:ssh-askpass-gnome");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:ssh-krb5");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:6.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/01/14");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/01/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
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
if (deb_check(release:"6.0", prefix:"openssh-client", reference:"5.5p1-6+squeeze8")) flag++;
if (deb_check(release:"6.0", prefix:"openssh-client-udeb", reference:"5.5p1-6+squeeze8")) flag++;
if (deb_check(release:"6.0", prefix:"openssh-server", reference:"5.5p1-6+squeeze8")) flag++;
if (deb_check(release:"6.0", prefix:"openssh-server-udeb", reference:"5.5p1-6+squeeze8")) flag++;
if (deb_check(release:"6.0", prefix:"ssh", reference:"5.5p1-6+squeeze8")) flag++;
if (deb_check(release:"6.0", prefix:"ssh-askpass-gnome", reference:"5.5p1-6+squeeze8")) flag++;
if (deb_check(release:"6.0", prefix:"ssh-krb5", reference:"5.5p1-6+squeeze8")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:deb_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");