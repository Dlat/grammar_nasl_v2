#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
 script_id(10427);
 script_version("$Revision: 1.27 $");
 script_cvs_date("$Date: 2015/01/12 17:12:48 $");
 script_cve_id("CVE-1999-0589");
 script_osvdb_id(331, 332, 334);

 script_name(english:"Microsoft Windows SMB Registry : Registry HKLM_LOCAL_MACHINE Permissions");
 script_summary(english:"Determines the access rights of a remote key");

 script_set_attribute(attribute:"synopsis", value:"System settings are writable by non admin.");
 script_set_attribute(attribute:"description", value:
"The registry key HKEY_LOCAL_MACHINE is writeable by users who are not
in the admin group.

This allows these users to create a lot of keys on that machine, thus
they can probably to get admin easily.

Such a configuration probably means that the system has been
compromised.");
 script_set_attribute(attribute:"solution", value:
"use regedt32 and set the permissions of this key to :

- admin group  : Full Control
    - system	   : Full Control
    - everyone	   : Read");
 script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");

 script_set_attribute(attribute:"vuln_publication_date", value:"1995/01/01");
 script_set_attribute(attribute:"plugin_publication_date", value:"2000/05/29");

script_set_attribute(attribute:"plugin_type", value:"local");
script_end_attributes();

 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2000-2015 Tenable Network Security, Inc.");
 script_family(english:"Windows");
 script_dependencies("netbios_name_get.nasl", "smb_login.nasl", "smb_registry_access.nasl");
 script_require_keys("SMB/transport", "SMB/name", "SMB/login", "SMB/password", "SMB/registry_access");
 script_require_ports(139, 445);
 exit(0);
}

include("audit.inc");
include("smb_func.inc");

access = get_kb_item("SMB/registry_access");
if(!access)exit(0, "Registry not accessible.");

login	= kb_smb_login();
pass	= kb_smb_password();
domain  = kb_smb_domain();
port	= kb_smb_transport();

if(! smb_session_init()) audit(AUDIT_FN_FAIL, "smb_session_init");

r = NetUseAdd(login:login, password:pass, domain:domain, share:"IPC$");
if ( r != 1 )
{
 NetUseDel();
 audit(AUDIT_SHARE_FAIL, "IPC$");
}

hklm = RegConnectRegistry(hkey:HKEY_LOCAL_MACHINE);
if ( isnull(hklm) )
{
 NetUseDel();
 audit(AUDIT_REG_FAIL);
}

rep = RegGetKeySecurity (handle:hklm, type: DACL_SECURITY_INFORMATION | SACL_SECURITY_INFORMATION | GROUP_SECURITY_INFORMATION | OWNER_SECURITY_INFORMATION);
if(!isnull(rep) && registry_key_writeable_by_non_admin(security_descriptor:rep))
{
  security_hole (port);
}

RegCloseKey (handle:hklm);
NetUseDel();
