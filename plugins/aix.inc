# -*- Fundamental -*-
#
# (C) Tenable Network Security, Inc.
#
# This script is released under one of the Tenable Script Licenses and may not
# be used from within scripts released under another license without the
# authorization from Tenable Network Security, Inc.
#
# @NOGPL@
#
# aix.inc
# $Revision: 1.10 $
#

# Internal use globals
global_var __aix_pkg_tests, aix_report;

##
# List storage of all remote packages found and checked
##
__aix_pkg_tests = make_list();

##
# String containing all affected package reporting
##
aix_report = "";

##
# Adds package to __aix_pkg_tests list
#
# @anonparam First A full rpm name from target system
##
function aix_pkg_tests_add()
{
 local_var array, package;
 package = _FCT_ANON_ARGS[0];
 if (!package || !strlen(package)) return NULL;
 array = split(chomp(package), sep:'|', keep:FALSE);
  __aix_pkg_tests = make_list(__aix_pkg_tests, str_replace(find:":", replace:".", string:array[0]));
}

##
# Sorts and uniques entries in __aix_pkg_tests list, returns as string
#
# @return Sorted, unique list of rpms from __aix_pkg_tests in a string
#           separated by " / "
##
function aix_pkg_tests_get()
{
  local_var p, s, pkg_tests_unique, pkg_tests_array, package;

  if (max_index(__aix_pkg_tests) == 0) return NULL;
  pkg_tests_array = make_array();
  pkg_tests_unique = make_list();
  foreach package (__aix_pkg_tests)
    if (!pkg_tests_array[package]++) pkg_tests_unique = make_list(pkg_tests_unique, package);
  pkg_tests_unique = sort(pkg_tests_unique);

  s = "";
  foreach p (pkg_tests_unique)
    s += " / " + p;
	return substr(s, 3);
}



##
# Adds missing patch information to the 'aix_report' global.
# This is a helper function used by aix_check_patch()
#
# @param installed the installed, vulnerable package
# @param required the non-vulnerable package 'installed' should be replaced with
##
function aix_report_add(installed, required, ifix)
{
  if (!installed || !strlen(installed)) return NULL;
  if ((!ifix || !strlen(ifix)) && (!required || !strlen(required))) return NULL;
  if (ifix && strlen(ifix))
  {
    aix_report += "Remote package installed : " + str_replace(find:":", replace:".", string:installed) + '\n' +
  	              "Missing AIX iFix : "  + ifix + '\n';
  }
  else
  {
    aix_report += "Remote package installed : " + str_replace(find:":", replace:".", string:installed) + '\n' +
 	                "Should be : "  + required + '\n';
  }
}

##
# Returns all report information (plugin output) that has been generated
# by any previous calls to aix_check_patch()
#
# @return plugin output on outdated packages, if any was generated by calls to aix_check_patch(),
#         NULL otherwise
##
function aix_report_get()
{
 if ( strlen(aix_report ) )
	{
	return '\n' + aix_report;
	}
 else
	return NULL;
}

##
# Compares two AIX package version numbers
#
# @anonparam a version to compare
# @anonparam b version to compare
#
# @return a negative number if a < b,
#         0 if a == b,
#         a positive number if a > b
##
function vers_cmp()
{
 local_var a, b, i;
 local_var m;

 a = _FCT_ANON_ARGS[0];
 b = _FCT_ANON_ARGS[1];
 a = split(a, sep:".", keep:FALSE);
 b = split(b, sep:".", keep:FALSE);
 m = max_index(a);
 if ( max_index(b) < m ) m = max_index(b);

 for ( i = 0 ; i < m; i ++ )
 {
  if ( a[i] != b[i] )
        return int(a[i]) - int(b[i]);
 }

 
 return max_index(a) - max_index(b);
}

##
# Checks if the given patch/package is installed.
#
# @param release AIX release number
# @param ml AIX maintenance level
# @param patch APAR number
# @param package the package name/version associated with 'patch'
#
# @remark If the patch is found to be required and missing, that information is added
#         to the 'aix_report' global. This is cumulative - if this function is called
#         three times, and all three times the given package is missing, information
#         about all three missing # vulnerable packages will be added to the
#         'aix_report' global
# @remark If the package is found at all, then it is added to __aix_pkg_tests.
#
# @return -1 if a patch is missing,
#	   0 if a patch is not installed but not required (ie: other architecture)
#	   1 if the patch is installed
##
function aix_check_patch(release, ml, patch, package) 
{
 local_var showrev, v, flag, packages, p, pattern;
 local_var rl;

 rl = chomp(get_kb_item("Host/AIX/oslevel"));
 rl -= "-";
 packages = get_kb_item("Host/AIX/lslpp");
 showrev = get_kb_item("Host/AIX/version");

 if ( ! packages || ! showrev || ( !release && ! ml ) || !patch || !package) return 0;

 if ( ! isnull(release) && release >!< showrev) return 0;
 if ( ! isnull(ml) &&  ml != rl ) return 0;

 package = split(package, sep:" ", keep:FALSE);
 flag=0;
 foreach p (package)
 {
   p = eregmatch(pattern: "^(.*)\.([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)", string: p, icase: 0);
   pattern = p[1] + ":([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)";
   v = eregmatch(pattern: pattern , string: packages, icase: 0);
   if (!isnull(v))
   {
     aix_pkg_tests_add(v[0]);
     flag = 1;
     if (vers_cmp(v[1], p[2]) < 0)
     {
       aix_report_add(installed:v[0], required:p[0]);
       return -1;
     }
   }
 }

 if (flag)
   set_kb_item(name: "Host/AIX/"+patch, value:1);

 return flag;
}

##
# Checks if the given ifix is installed.
#
# @param release AIX release number
# @param ml AIX maintenance level
# @param sp AIX service pack level
# @param patch APAR number
# @param package the package name associated with 'patch'
# @param minfilesetver the min package version associated with 'patch'
# @param maxfilesetver the max package version associated with 'patch'
#
# @remark If the patch is found to be required and missing, that information is added
# to the 'aix_report' global. This is cumulative - if this function is called
# three times, and all three times the given package is missing, information
# about all three missing # vulnerable packages will be added to the
# 'aix_report' global
#
# @remark If the package is found at all, then it is added to __aix_pkg_tests.
#
# @return -1 if a patch is missing,
#	   0 if a patch is not installed but not required (ie: other architecture)
#	   1 if the patch is installed
##
function aix_check_ifix(release, ml, sp, patch, package, minfilesetver, maxfilesetver) 
{
 local_var showrev, v, flag, packages, p, pattern, ifixes;
 local_var oslevel, oslevelparts, apar;

 oslevel = chomp(get_kb_item("Host/AIX/oslevelsp"));
 packages = get_kb_item("Host/AIX/lslpp");
 showrev = get_kb_item("Host/AIX/version");
 ifixes = get_kb_item("Host/AIX/ifixes");
 if ( ! packages || ! showrev || ( ! release && ! ml ) || ! patch || ! package || ! minfilesetver || ! maxfilesetver || ! oslevel ) return 0;

 if ( ! isnull(release) && release >!< showrev ) return 0;
 oslevelparts = split(oslevel, sep:'-', keep:0);
 if ( max_index(oslevelparts) != 4 ) return 0;
 if ( ! isnull(ml) &&  ml != oslevelparts[1] ) return 0;
 if ( ! isnull(sp) &&  sp != oslevelparts[2] ) return 0;

 flag=0;

 pattern = package + ":([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)";
 v = eregmatch(pattern: pattern , string: packages, icase: 0);
 if (!isnull(v))
 {
   aix_pkg_tests_add(v[0]);
   if ((vers_cmp(v[1], minfilesetver) >= 0) && (vers_cmp(v[1], maxfilesetver) <= 0))
   {
     flag = 1;
     pattern = "S\s+"+patch+"\s+";
     p = eregmatch(pattern: pattern, string: ifixes, icase: 0);
     if (isnull(p))
     {
       aix_report_add(installed:v[0], ifix:patch);
       return -1;
     }
   }
 }

 if (flag)
 {
   apar = ereg_replace(pattern:"(.*)s.*", replace:"\1", string:patch);
   set_kb_item(name: "Host/AIX/"+patch, value:1);
 }
 return flag;
}

##
# Checks if the given package is installed. If fixpackagever is supplied and
# package is installed and within ranges, it will be considered vulnerable.
#
# @param release AIX release number
# @param ml AIX maintenance level
# @param sp AIX service pack level
# @param package the package name 
# @param minpackagever the min package version associated with 'package'
# @param maxpackagever the max package version associated with 'package'
# @param fixpackagever the package version associated with 'package' for non-vulnerable
#
# @remark If the patch is found to be required and missing, that information is added
# to the 'aix_report' global. This is cumulative - if this function is called
# three times, and all three times the given package is missing, information
# about all three missing # vulnerable packages will be added to the
# 'aix_report' global
#
# @remark If the package is found at all, then it is added to __aix_pkg_tests.
#
# @return -1 if package is not installed
#    0 if package is installed but not affected (ie: other architecture/safe version)
#	   1 if the package is installed and affected
##
function aix_check_package(release, ml, sp, package, minpackagever, maxpackagever, fixpackagever) 
{
  local_var showrev, v, flag, packages, pattern;
  local_var oslevel, oslevelparts, apar;

  oslevel = chomp(get_kb_item("Host/AIX/oslevelsp"));
  packages = get_kb_item("Host/AIX/lslpp");
  showrev = get_kb_item("Host/AIX/version");
  if ( ! packages || ! showrev || ( ! release && ! ml ) || ! package || ! minpackagever || ! maxpackagever || ! oslevel ) return 0; 

  if ( ! isnull(release) && release >!< showrev ) return 0;
  oslevelparts = split(oslevel, sep:'-', keep:0);
  if ( max_index(oslevelparts) != 4 ) return 0;
  if ( ! isnull(ml) &&  ml != oslevelparts[1] ) return 0;
  if ( ! isnull(sp) &&  sp != oslevelparts[2] ) return 0; 

  flag=0;

  pattern = package + ":([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)";
  v = eregmatch(pattern: pattern , string: packages, icase: 0);
  if (!isnull(v)) {
    aix_pkg_tests_add(v[0]);
    if ((vers_cmp(v[1], minpackagever) >= 0) && (vers_cmp(v[1], maxpackagever) <= 0)) {
      flag = 1;
      # if fixpackagever then this is a vulnerable package, add to aix_report
      if (fixpackagever) {
        aix_report_add(installed:v[0], required:package + '.' + fixpackagever);
      }
    }
    else {
      flag = 0;
    }
  }
  else {
    flag = -1;
  }
  return flag;
}