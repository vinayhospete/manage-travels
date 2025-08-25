sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'managetravelfioriapp/test/integration/FirstJourney',
		'managetravelfioriapp/test/integration/pages/TravelsList',
		'managetravelfioriapp/test/integration/pages/TravelsObjectPage'
    ],
    function(JourneyRunner, opaJourney, TravelsList, TravelsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('managetravelfioriapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTravelsList: TravelsList,
					onTheTravelsObjectPage: TravelsObjectPage
                }
            },
            opaJourney.run
        );
    }
);