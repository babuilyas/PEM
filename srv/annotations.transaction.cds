using {mi.cap.me.srv.ServiceCatalog as my} from './service';

annotate my.transaction with {
    id    @title : 'Transaction ID';
    descr @title : 'Short Description';
    items @title : 'Items';
    lines @title : 'Lines';
    status @title : 'Status';
    type @title : 'Type';
};
annotate my.transaction.items with {
    
};
annotate my.transaction.lines with {
    account @title : '{i18n>AccountID}';
};



annotate my.transaction with @(
    UI : {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Transaction',
            TypeNamePlural : 'Transactions',
            Title : {
                $Type : 'UI.DataField',
                Value : descr,
            },
            Description : {
                $Type : 'UI.DataField',
                Value : id,
            },
        },
        SelectionFields  : [
            id, descr, lines.account_id
        ],
        LineItem : [
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'mi.cap.me.srv.ServiceCatalog.void_transaction',
                Label : '{i18n>VoidTransaction}',
                ![@Validation.ApplicableTerms] : [
                    'enableVoid',
                ],
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'my.transaction/CREATE',
                Label : 'Create',
            },
            {
                $Type : 'UI.DataField',
                Value : id,
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Value : type,
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Criticality: status ,
                CriticalityRepresentation : #OnlyIcon,
            },
        ]
    }
);

