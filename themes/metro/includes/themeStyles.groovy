/**
 * Master HTML templating variables include, Foundation Metro theme/framework.
 *
 * Overrides the default CATO styles located in 
 * htmlVariables.groovy - ofbiz_foundation/framework/common/webcommon/includes/cato/lib/standard/
 * 
 */

import java.lang.*;
import java.util.*;
import org.ofbiz.base.util.*;
 
/*
*************************************
* MAIN STYLES *
*************************************
*/

/* EXTENDS/MODIFIES the default foundation styles */
GroovyUtil.runScriptAtLocation("component://common/webcommon/includes/cato/lib/standard/htmlVariables.groovy", null, context);

context.styles.putAll([
    
  /* Specific display elements */
    /* Address picker */
    "address_list" : "address-list",
    "address_entry" : "address-entry",
    "address_entry_ownline" : "address-entry-ownline",
    
  /* Always declare last */
    "dummy" : ""
]);
