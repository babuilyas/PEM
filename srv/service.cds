using { mi.cap.me.db as my } from '../db/schema';

namespace mi.cap.me.srv;

service ServiceCatalog {
    
    entity account as projection on my.account { * };
 
    entity transaction as projection on my.transaction { * } 
    actions{ 
        @sap.applicable.path : 'enableVoid'
        action void_transaction();
        @sap.applicable.path : 'enableReconcilied'
        action reconcile_transaction();
        action post_transaction();
    };
   }
