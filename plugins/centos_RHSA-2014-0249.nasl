#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2014:0249 and 
# CentOS Errata and Security Advisory 2014:0249 respectively.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(72805);
  script_version("$Revision: 1.12 $");
  script_cvs_date("$Date: 2016/04/28 18:05:38 $");

  script_cve_id("CVE-2014-0060", "CVE-2014-0061", "CVE-2014-0062", "CVE-2014-0063", "CVE-2014-0064", "CVE-2014-0065", "CVE-2014-0066");
  script_bugtraq_id(65719, 65723, 65724, 65725, 65727, 65728, 65731);
  script_osvdb_id(103544, 103545, 103546, 103547, 103548, 103549, 103551);
  script_xref(name:"RHSA", value:"2014:0249");

  script_name(english:"CentOS 5 : postgresql (CESA-2014:0249)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated postgresql packages that fix multiple security issues are now
available for Red Hat Enterprise Linux 5.

The Red Hat Security Response Team has rated this update as having
Important security impact. Common Vulnerability Scoring System (CVSS)
base scores, which give detailed severity ratings, are available for
each vulnerability from the CVE links in the References section.

PostgreSQL is an advanced object-relational database management system
(DBMS).

Multiple stack-based buffer overflow flaws were found in the date/time
implementation of PostgreSQL. An authenticated database user could
provide a specially crafted date/time value that, when processed,
could cause PostgreSQL to crash or, potentially, execute arbitrary
code with the permissions of the user running PostgreSQL.
(CVE-2014-0063)

Multiple integer overflow flaws, leading to heap-based buffer
overflows, were found in various type input functions in PostgreSQL.
An authenticated database user could possibly use these flaws to crash
PostgreSQL or, potentially, execute arbitrary code with the
permissions of the user running PostgreSQL. (CVE-2014-0064)

Multiple potential buffer overflow flaws were found in PostgreSQL. An
authenticated database user could possibly use these flaws to crash
PostgreSQL or, potentially, execute arbitrary code with the
permissions of the user running PostgreSQL. (CVE-2014-0065)

It was found that granting a SQL role to a database user in a
PostgreSQL database without specifying the 'ADMIN' option allowed the
grantee to remove other users from their granted role. An
authenticated database user could use this flaw to remove a user from
a SQL role which they were granted access to. (CVE-2014-0060)

A flaw was found in the validator functions provided by PostgreSQL's
procedural languages (PLs). An authenticated database user could
possibly use this flaw to escalate their privileges. (CVE-2014-0061)

A race condition was found in the way the CREATE INDEX command
performed multiple independent lookups of a table that had to be
indexed. An authenticated database user could possibly use this flaw
to escalate their privileges. (CVE-2014-0062)

It was found that the chkpass extension of PostgreSQL did not check
the return value of the crypt() function. An authenticated database
user could possibly use this flaw to crash PostgreSQL via a NULL
pointer dereference. (CVE-2014-0066)

Red Hat would like to thank the PostgreSQL project for reporting these
issues. Upstream acknowledges Noah Misch as the original reporter of
CVE-2014-0060 and CVE-2014-0063, Heikki Linnakangas and Noah Misch as
the original reporters of CVE-2014-0064, Peter Eisentraut and Jozef
Mlich as the original reporters of CVE-2014-0065, Andres Freund as the
original reporter of CVE-2014-0061, Robert Haas and Andres Freund as
the original reporters of CVE-2014-0062, and Honza Horak and Bruce
Momjian as the original reporters of CVE-2014-0066.

All PostgreSQL users are advised to upgrade to these updated packages,
which contain backported patches to correct these issues. If the
postgresql service is running, it will be automatically restarted
after installing this update."
  );
  # http://lists.centos.org/pipermail/centos-announce/2014-March/020184.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?9b1aa942"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected postgresql packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-contrib");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-docs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-pl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-python");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-server");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-tcl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:postgresql-test");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/03/04");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/03/05");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2016 Tenable Network Security, Inc.");
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
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "CentOS", cpu);


flag = 0;
if (rpm_check(release:"CentOS-5", reference:"postgresql-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-contrib-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-devel-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-docs-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-libs-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-pl-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-python-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-server-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-tcl-8.1.23-10.el5_10")) flag++;
if (rpm_check(release:"CentOS-5", reference:"postgresql-test-8.1.23-10.el5_10")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");