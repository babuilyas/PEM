using {
    Currency,
    managed,
    sap,
    cuid,
    temporal,
    sap.common.CodeList
} from '@sap/cds/common';

namespace mi.cap.me.db;

entity account : managed {
    key id              : Integer;
        title           : localized String;
        descr           : localized String;
        status          : Boolean;
        currency        : Currency;
        image           : Association to one Attachments;
        virtual balance : Decimal;
        transactions    : Association to many transaction;
}

entity transaction : managed {
    key id                        : Integer;
        descr                     : localized String;
        status                    : Integer enum {
            unknown     = 0;
            reconcilled = 3;
            void        = 1;
        };
        type                      : transaction_type not null;
        lines                     : Composition of many {
                                        account       : Association to one account not null;
                                        payee         : Association to one payee;
                                        amount        : Decimal;
                                        currency      : Currency;
                                        exchange_rate : Decimal;
                                        category      : Association to one category;
                                        fee           : Decimal;
                                        feecat        : Association to one category;
                                    }
        items                     : Composition of many {
                                        item     : Association to one item;
                                        quantity : Integer;
                                    }
        image                     : Association to one Attachments;
        voice                     : Association to one Attachments;
        // UI conidtional actions
        virtual enableVoid        : Boolean;
        virtual enableReconcilied : Boolean;
}

entity payee @(cds.autoexpose) : managed {
    key name : String;
}

entity item @(cds.autoexpose) : managed {
    key name : String;
    image : Association to one Attachments;
}

entity category : sap.common.CodeList {
    key id       : Integer;
        parent   : Association to category;
        children : Composition of many category
                       on children.parent = $self;
        type     : transaction_type not null;
}

type transaction_type : String enum {
    income;
    expense;
    transfer;
}

entity Attachments @(cds.autoexpose) {
  key ID : UUID;
  
   @Core.ContentDisposition.Filename: 'ID'
@Core.MediaType:mediaType

  content : LargeBinary; 
    @Core.IsMediaType: true
  mediaType : String;
}