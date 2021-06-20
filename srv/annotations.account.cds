using {mi.cap.me.srv.ServiceCatalog as my} from './service';

annotate my.account with {
    id    @title : '{i18n>AccountID}';
    descr @title : '{i18n>AccountDescription}';
    title @title : '{i18n>AccountTitle}';
    status @title : '{i18n>AccountStatus}';
};

annotate my.account with @(
    Common : { Label  : 'Account', },
    UI   : {
        HeaderInfo      : {
            $Type          : 'UI.HeaderInfoType',
            TypeName       : 'Account',
            TypeNamePlural : 'Accounts',
        },
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
                Value : currency_code,
            },
            {
                $Type       : 'UI.DataField',
                Value       : status,
                Criticality : {$value : #Information },
            },
        ]
    }
);
