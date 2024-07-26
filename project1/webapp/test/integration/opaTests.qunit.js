sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/LaptopList',
		'project1/test/integration/pages/LaptopObjectPage',
		'project1/test/integration/pages/BrandObjectPage'
    ],
    function(JourneyRunner, opaJourney, LaptopList, LaptopObjectPage, BrandObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLaptopList: LaptopList,
					onTheLaptopObjectPage: LaptopObjectPage,
					onTheBrandObjectPage: BrandObjectPage
                }
            },
            opaJourney.run
        );
    }
);