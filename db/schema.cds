using { Currency, managed, sap, cuid, temporal, sap.common.CodeList } from '@sap/cds/common';

namespace mi.cap.me.db;

entity account : managed {
    key id       : Integer;
        title    : localized String;
        descr    : localized String;
        status   : Boolean ;
        currency : Currency;
        image    : LargeBinary      @Core.MediaType : 'image/png';
}

entity transaction : managed {
    key ID     : Integer            ;
        descr  : localized String   ;
        status : transaction_status;
        type   : transaction_type not null;
        lines  : Composition of many transaction_lines ;
        items  : Composition of many {
            item : Association to one item;
            quantity : Integer ;
        }
        image  : LargeBinary                           @Core.MediaType : 'image/png';
        voice  : LargeBinary                           @Core.MediaType : 'audio/wav';
}

entity payee @(cds.autoexpose) : managed , cuid   {
    key name : String ;
}

entity item @(cds.autoexpose): managed, cuid  {
    key name     : String;
}

entity transaction_lines : managed {
    key ID            : Integer;
    key parent        : Association to one transaction not null;
        account       : Association to one account not null;
        payee         : Association to one payee;
        amount        : Decimal ;
        currency      : Currency;
        exchange_rate : Decimal;
        category      : Association to one category;
        fee           : Decimal ;
        feecat        : Association to one category;
}

entity category : sap.common.CodeList {
    key ID       : Integer ;
        parent   : Association to category;
        children : Composition of many category on children.parent = $self;
        type     : transaction_type not null;
}

entity exchangerate : managed {
    key currency_from : Currency;
    key date          : Date;
    key currency_to   : Currency;
        rate          : Decimal;
}

type transaction_status  : String enum {
    void;
    reconcilled;
    default;
}

type transaction_type : String enum {
    income;
    expense;
    transfer;
    mixed;
}
