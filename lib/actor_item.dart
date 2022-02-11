import 'package:flutter/material.dart';
import './locations.dart';
import 'api/api_service.dart';
class ActorItem extends StatelessWidget {
  String actorName;
  String accessToken;
  String apiUrl;
  ActorItem(this.actorName, this.accessToken, this.apiUrl);
  @override
  Widget build(BuildContext context) {
    return Card(
      // key: Key(ids[index]),
        margin: EdgeInsets.all(8),
        elevation: 5,
        // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: Colors.white,
        //listing in rows
        child: FlatButton(
            onPressed: () {

              // APIService apiService = new APIService();
              //
              // apiService.getLocations(accessToken, orgId, initiativeId).then((value){
              //   List<String> locationNames = [];
              //   // List<String> initiativeIds = [];
              //
              //   if(value != null)
              //   {
              //     for(int i = 0; i < value.length; i++)
              //     {
              //       if (value[i].locationName.isNotEmpty)
              //       {
              //         locationNames.add(value[i].locationName);
              //         // initiativeIds.add(value[i].locationId);
              //
              //         // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //         //   print(value.initiativeName);
              //         //   return Initiatives(initiative: value.initiativeName, id: id);
              //         //
              //         // }));
              //       }
              //     }
              //
              //   }
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return Locations(locationNames: locationNames, orgId: orgId, initiativeId: initiativeId, accessToken: accessToken);
              //   }));
              //
              //
              //
              // });
            },
            child: Container(
              width: double.infinity,
              child: Text(actorName,

                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                  textAlign: TextAlign.center),
            )

        )

    );
  }
}
