sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ordersmanagement/test/integration/FirstJourney',
		'ordersmanagement/test/integration/pages/OrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ordersmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrdersObjectPage: OrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);