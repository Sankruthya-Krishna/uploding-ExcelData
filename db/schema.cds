namespace com.test.laptopdb;
using {managed,cuid} from '@sap/cds/common';

entity Laptop: managed,cuid{
    @title:'LAPTOP_BRAND'
    name:String(10);
    @title:'RAM'
    ram:String(10);
    brand: Composition of many Brand on brand.lap=$self;

    }

    entity Brand: managed,cuid{
        @title:'Storage'
        name:String(10);
        @title:'model'
        model:String(10);
        lap:Association to one Laptop;
            }