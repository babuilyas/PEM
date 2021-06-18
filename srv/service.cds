using { mi.cap.me.db as my } from '../db/schema';

namespace mi.cap.me.srv;

service ServiceCatalog {
    entity transaction @cds.audoexpose as projection on my.transaction { * };
    entity account as projection on my.account { * };
    entity category as projection on my.category { * };
}