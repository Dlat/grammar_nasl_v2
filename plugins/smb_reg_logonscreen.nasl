#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
 script_id(11460);
 script_version("$Revision: 1.16 $");
 script_cvs_date("$Date: 2015/01/12 17:12:48 $");

 script_name(english:"Microsoft Windows SMB Registry : Classic Logon Screen");
 script_summary(english:"Determines the value of a remote key");

 script_set_attribute(attribute:"synopsis", value:"User lists is displayed locally.");
 script_set_attribute(attribute:"description", value:
"The registry key HKLM\Software\Microsoft\Windows
NT\CurrentVersion\WinLogon\LogonType does not exist or is set to 1.

It means that users who attempt to log in locally will see get the
'new' WindowsXP logon screen which displays the list of users of the
remote host.");
 script_set_attribute(attribute:"solution", value:"Use regedt32 and set the value of this key to 0");
 script_set_cvss_base_vector("CVSS2#AV:L/AC:H/Au:N/C:P/I:N/A:N");

 script_set_attribute(attribute:"plugin_publication_date", value:"2003/03/24");

script_set_attribute(attribute:"plugin_type", value:"local");
script_end_attributes();

 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2003-2015 Tenable Network Security, Inc.");
 script_family(english:"Windows");
 script_dependencies("netbios_name_get.nasl",
 		     "smb_login.nasl", "smb_registry_access.nasl",
		     "smb_reg_service_pack_XP.nasl");
 script_require_keys("SMB/transport", "SMB/name", "SMB/login", "SMB/password", "SMB/registry_access");
 script_require_ports(139, 445);
 exit(0);
}



include("audit.inc");
include("smb_func.inc");

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


key = "Software\Microsoft\Windows NT\CurrentVersion\WinLogon";
item = "LogonType";

key_h = RegOpenKey(handle:hklm, key:key, mode:MAXIMUM_ALLOWED);
if ( ! isnull(key_h) )
{
 value = RegQueryValue(handle:key_h, item:item);

 if (!isnull (value) && (value[1] != 0))
   security_note(port);

 RegCloseKey (handle:key_h);
}

RegCloseKey (handle:hklm);
NetUseDel ();

