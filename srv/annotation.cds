using {com.test.laptopdb as db} from '../db/schema';
service myservice{
    entity Laptop as projection on  db.Laptop;
    entity Brand as projection on db.Brand
}
annotate myservice.Laptop with @odata.draft.enabled;

annotate myservice.Laptop with @(
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value: name
        },
         {
            $Type:'UI.DataField',
            Value: ram
        },
         
     ]
);
annotate myservice.Brand with @(
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value: name
        },
         {
            $Type:'UI.DataField',
            Value: model
        },
         
        {
           Label:'laptop_ID',
            Value: lap.name
        },
     ]
);

annotate myservice.Laptop with @(
    UI.FieldGroup #laptop : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            $Type:'UI.DataField',
            Value: name
        },
         {
            $Type:'UI.DataField',
            Value: ram
        },
        
       ]
    },
    
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#laptop',
        },
         {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'General Information',
            Target : 'brand/@UI.LineItem',
        },
    ],
    
);
annotate myservice.Brand with @(
    UI.FieldGroup #brand : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            $Type:'UI.DataField',
            Value: name
        },
         {
            $Type:'UI.DataField',
            Value: model
        },
       {
           $Type:'UI.DataField',
            Value: lap.name
        },
       ]
    },
    
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#brand',
        },
    ],
    
);