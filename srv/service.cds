using { mi.cap.me.db as my } from '../db/schema';

namespace mi.cap.me.srv;

service ServiceCatalog {
    entity transaction as projection on my.transaction { * };
    entity account as projection on my.account { *, null as balance };
}