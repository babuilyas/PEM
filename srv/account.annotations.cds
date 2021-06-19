using {mi.cap.me.srv as my} from '../srv/service';

annotate my.ServiceCatalog.account with {
    id @title : '{i18n>AccountID}';
    descr @title : '{i18n>AccountDescription}';
    title @title : '{i18n>AccountTitle}';
};


annotate my.ServiceCatalog.account with @(UI : {
    HeaderInfo      : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Account',
        TypeNamePlural : 'Accounts',
    },
    SelectionFields : [title, ], 
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
            Value : currency_code,
        },
        {
            $Type       : 'UI.DataField',
            Value       : status,
            Criticality : {$value : #Information, },
        },
    ]
},
Core : { 
    AcceptableMediaTypes  : [
        '',
    ],
 },);
 

/*
annotate my.transaction with @UI : {
    SelectionFields  : [
        descr,
        status
    ],
    LineItem  : [

        {
            $Type : 'UI.DataField',
            Value : descr,
            Label : 'Status'
        },
    ],
 };

*/
