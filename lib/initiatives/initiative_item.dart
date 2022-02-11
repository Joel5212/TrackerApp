import 'package:flutter/material.dart';
import 'package:tracker_app/api/api_service.dart';
import 'package:tracker_app/api/api_service.dart';
import 'package:tracker_app/locations.dart';
import 'package:tracker_app/model/models.dart';
import 'package:tracker_app/observations.dart';

import '../methods.dart';

class InitiativeItem extends StatelessWidget {
  String initiativeName;
  int initLength;
  String orgId;
  String initiativeId;
  String accessToken;
  String apiUrl;
  InitiativeItem(this.initiativeName, this.initLength,  this.orgId, this.initiativeId, this.accessToken, this.apiUrl);
  @override
  Widget build(BuildContext context) {
    List<String> observationNames = Methods.getObservationNames(accessToken, orgId, initiativeId, apiUrl);
    List<String> locationNames = Methods.getLocationNames(accessToken, orgId, initiativeId, apiUrl);

    return Card(
        margin: EdgeInsets.all(8),
        elevation: 5,
        // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: Colors.white, //listing in rows
        child: FlatButton(
            onPressed: () {
              observationNames.length != 1 ?
              Navigator.of(context).push(_createRoute(observationNames, initiativeId, true, apiUrl)):
              Navigator.of(context).push(_createRoute(locationNames, initiativeId, false, apiUrl));
            },
            child: Container(
              width: double.infinity,
              child: Text(initiativeName,

                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                  textAlign: TextAlign.center),
            )

        )

    );



  }
  Route _createRoute(List<String> names, String id, bool isForObservations, String apiUrl) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => isForObservations ? Observations(names, orgId, id,  accessToken, apiUrl): Locations(names, orgId, id, accessToken, apiUrl),
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
