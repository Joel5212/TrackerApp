import 'package:flutter/material.dart';

import 'location_item.dart';

class LocationsList extends StatelessWidget {
  List<String> locationNames;
  String orgId;
  String initiativeId;
  String accessToken;
  String apiUrl;
  LocationsList(this.locationNames, this.orgId, this.initiativeId, this.accessToken, this.apiUrl);

  @override
  Widget build(BuildContext context) {
    return locationNames.isEmpty ?
    LayoutBuilder(builder: (ctx, constraints){
      return Column(
        children: <Widget>[
          SizedBox(
              height: 30
          ),
          Container(

              child: Text('No Locations added',
                  style: Theme.of(context).textTheme.headline4)
          ),
          SizedBox(
              height: 40
          ),
          Container(
              height: constraints.maxHeight * 0.45,
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)
          )
        ],
      );
    }) :
    ListView.builder(
      itemCount:  locationNames.length,
      itemBuilder: (BuildContext ctx, int index) {
        return LocationItem( locationNames[index],  orgId, initiativeId,  accessToken, apiUrl);

      },

    );
  }
}
