#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2011:1338. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(56304);
  script_version ("$Revision: 1.10 $");
  script_cvs_date("$Date: 2017/01/04 16:02:23 $");

  script_cve_id("CVE-2011-3364");
  script_osvdb_id(77041);
  script_xref(name:"RHSA", value:"2011:1338");

  script_name(english:"RHEL 6 : NetworkManager (RHSA-2011:1338)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated NetworkManager packages that fix one security issue are now
available for Red Hat Enterprise Linux 6.

The Red Hat Security Response Team has rated this update as having
moderate security impact. A Common Vulnerability Scoring System (CVSS)
base score, which gives a detailed severity rating, is available from
the CVE link in the References section.

NetworkManager is a network link manager that attempts to keep a wired
or wireless network connection active at all times. The ifcfg-rh
NetworkManager plug-in is used in Red Hat Enterprise Linux
distributions to read and write configuration information from the
/etc/sysconfig/network-scripts/ifcfg-* files.

An input sanitization flaw was found in the way the ifcfg-rh
NetworkManager plug-in escaped network connection names containing
special characters. If PolicyKit was configured to allow local,
unprivileged users to create and save new network connections, they
could create a connection with a specially crafted name, leading to
the escalation of their privileges. Note: By default, PolicyKit
prevents unprivileged users from creating and saving network
connections. (CVE-2011-3364)

Red Hat would like to thank Matt McCutchen for reporting this issue.

Users of NetworkManager should upgrade to these updated packages,
which contain a backported patch to correct this issue. Running
instances of NetworkManager must be restarted ('service NetworkManager
restart') for this update to take effect."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2011-3364.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2011-1338.html"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:NetworkManager");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:NetworkManager-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:NetworkManager-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:NetworkManager-glib");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:NetworkManager-glib-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:NetworkManager-gnome");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:6");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:6.1");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/09/26");
  script_set_attribute(attribute:"plugin_publication_date", value:"2011/09/27");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2011-2017 Tenable Network Security, Inc.");
  script_family(english:"Red Hat Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/RedHat/release", "Host/RedHat/rpm-list", "Host/cpu");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("misc_func.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Red Hat" >!< release) audit(AUDIT_OS_NOT, "Red Hat");
os_ver = eregmatch(pattern: "Red Hat Enterprise Linux.*release ([0-9]+(\.[0-9]+)?)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Red Hat");
os_ver = os_ver[1];
if (! ereg(pattern:"^6([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Red Hat 6.x", "Red Hat " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$" && "s390" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Red Hat", cpu);

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2011:1338";
  yum_report = redhat_generate_yum_updateinfo_report(rhsa:rhsa);
  if (!empty_or_null(yum_report))
  {
    security_report_v4(
      port       : 0,
      severity   : SECURITY_WARNING,
      extra      : yum_report 
    );
    exit(0);
  }
  else
  {
    audit_message = "affected by Red Hat security advisory " + rhsa;
    audit(AUDIT_OS_NOT, audit_message);
  }
}
else
{
  flag = 0;
  if (rpm_check(release:"RHEL6", cpu:"i686", reference:"NetworkManager-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", cpu:"s390x", reference:"NetworkManager-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", cpu:"x86_64", reference:"NetworkManager-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", reference:"NetworkManager-debuginfo-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", reference:"NetworkManager-devel-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", reference:"NetworkManager-glib-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", reference:"NetworkManager-glib-devel-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", cpu:"i686", reference:"NetworkManager-gnome-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", cpu:"s390x", reference:"NetworkManager-gnome-0.8.1-9.el6_1.3")) flag++;

  if (rpm_check(release:"RHEL6", cpu:"x86_64", reference:"NetworkManager-gnome-0.8.1-9.el6_1.3")) flag++;


  if (flag)
  {
    security_report_v4(
      port       : 0,
      severity   : SECURITY_WARNING,
      extra      : rpm_report_get() + redhat_report_package_caveat()
    );
    exit(0);
  }
  else
  {
    tested = pkg_tests_get();
    if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "NetworkManager / NetworkManager-debuginfo / NetworkManager-devel / etc");
  }
}