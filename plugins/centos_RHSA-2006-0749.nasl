#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2006:0749 and 
# CentOS Errata and Security Advisory 2006:0749 respectively.
#

include("compat.inc");

if (description)
{
  script_id(23941);
  script_version("$Revision: 1.10 $");
  script_cvs_date("$Date: 2015/05/19 23:25:26 $");

  script_cve_id("CVE-2006-6097");
  script_osvdb_id(30721);
  script_xref(name:"RHSA", value:"2006:0749");

  script_name(english:"CentOS 3 / 4 : tar (CESA-2006:0749)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated tar packages that fix a path traversal flaw are now available.

This update has been rated as having moderate security impact by the
Red Hat Security Response Team.

The GNU tar program saves many files together in one archive and can
restore individual files (or all of the files) from that archive.

Teemu Salmela discovered a path traversal flaw in the way GNU tar
extracted archives. A malicious user could create a tar archive that
could write to arbitrary files to which the user running GNU tar has
write access. (CVE-2006-6097)

Users of tar should upgrade to this updated package, which contains a
replacement backported patch to correct this issue."
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-December/013433.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?2fb536b2"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-December/013434.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?050ced02"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-December/013437.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?3f45313a"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-December/013439.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?5ed13da3"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-December/013443.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?797e22a9"
  );
  # http://lists.centos.org/pipermail/centos-announce/2006-December/013444.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?680bed9d"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected tar package.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:H/Au:N/C:N/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:tar");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:3");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");

  script_set_attribute(attribute:"patch_publication_date", value:"2006/12/20");
  script_set_attribute(attribute:"plugin_publication_date", value:"2006/12/30");
  script_set_attribute(attribute:"vuln_publication_date", value:"2006/11/21");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2006-2015 Tenable Network Security, Inc.");
  script_family(english:"CentOS Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/CentOS/release", "Host/CentOS/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/CentOS/release")) audit(AUDIT_OS_NOT, "CentOS");
if (!get_kb_item("Host/CentOS/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);


cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && "ia64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "CentOS", cpu);


flag = 0;
if (rpm_check(release:"CentOS-3", reference:"tar-1.13.25-15.RHEL3")) flag++;

if (rpm_check(release:"CentOS-4", reference:"tar-1.14-12.RHEL4")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");