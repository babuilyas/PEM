using {mi.cap.me.srv.ServiceCatalog as my} from '../../srv/service';

annotate my.account with {
    id    @title : '{i18n>AccountID}';
    descr @title : '{i18n>AccountDescription}';
    title @title : '{i18n>AccountTitle}';
    status @title : '{i18n>AccountStatus}';
    balance @title : '{i18n>AccountBalance}' @Measures.ISOCurrency : currency_code;
};

annotate my.account with @(
    UI   : {
        HeaderInfo      : {
            $Type          : 'UI.HeaderInfoType',
            TypeName       : 'Account',
            TypeNamePlural : 'Accounts',
            Title : {
                $Type : 'UI.DataField',
                Value : descr,
            },
            Description : {
                $Type : 'UI.DataField',
                Value: id,
            },
        },
        HeaderFacets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.DataPoint#Balance',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.DataPoint#Image',
            },
        ],
        SelectionFields : [title, id, currency_code ],
        LineItem        : [
            {
                $Type : 'UI.DataField',
                Value : id,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Value : balance,
                
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
            {
                $Type       : 'UI.DataField',
                Value       : status,
                Criticality : {$value : #Information },
            },            
        ],
        DataPoint #Balance : {
            $Type : 'UI.DataPointType',
            Value : balance,
            Title : '{i18n>AccountBalance}'
        },       
        DataPoint #Image : {
            $Type : 'UI.DataPointType',
            Value : image,
            
        },
    }
);

annotate my.transaction with {
    id    @title : 'Transaction ID';
    descr @title : 'Short Description';
    items @title : 'Items';
    lines @title : 'Lines';
    status @title : 'Status';
    type @title : 'Type';
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

