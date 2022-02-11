import 'package:flutter/material.dart';

import 'actors.dart';
import 'api/api_service.dart';
class LocationItem extends StatelessWidget {
  String locationName;
  String orgId;
  String initiativeId;
  String accessToken;
  String apiUrl;
  LocationItem(this.locationName, this.orgId, this.initiativeId,  this.accessToken, this.apiUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8),
        elevation: 5,
        // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: Colors.white, //listing in rows
        child: FlatButton(
            onPressed: () {
              APIService apiService = new APIService();



              apiService.getActors(accessToken, orgId, initiativeId, apiUrl).then((value){
                List<String> actorNames = [];

                if(value != null)
                {
                  for(int i = 0; i < value.length; i++)
                  {
                    if (value[i].actorName.isNotEmpty)
                    {
                      actorNames.add(value[i].actorName);


                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   print(value.initiativeName);
                      //   return Initiatives(initiative: value.initiativeName, id: id);
                      //
                      // }));
                    }
                  }

                }

                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return Actors(actorNames: actorNames, orgId: orgId, initiativeId: initiativeId, accessToken: accessToken);
                // }));

                Navigator.of(context).push(_createRoute(actorNames));


              });
            },
            child: Container(
              width: double.infinity,
              child: Text(locationName,

                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                  textAlign: TextAlign.center),
            )

        )

    );
  }

  Route _createRoute(actorNames) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Actors(actorNames, orgId, initiativeId,  accessToken, apiUrl),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve:curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

