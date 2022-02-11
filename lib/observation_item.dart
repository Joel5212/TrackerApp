import 'package:flutter/material.dart';
import 'package:tracker_app/actors.dart';
import './locations.dart';
import 'api/api_service.dart';
import 'methods.dart';
class ObservationItem extends StatelessWidget {
  String observationName;
  String orgId;
  String initiativeId;
  String accessToken;
  String apiUrl;
  ObservationItem(this.observationName,  this.orgId,  this.initiativeId,  this.accessToken, this.apiUrl);
  @override
  Widget build(BuildContext context) {
    List<String> locationNames = Methods.getLocationNames(accessToken, orgId, initiativeId, apiUrl);
    List<String> actorNames = Methods.getActorNames(accessToken, orgId, initiativeId, apiUrl);

    return Card(
      // key: Key(ids[index]),
        margin: EdgeInsets.all(8),
        elevation: 5,
        // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: Colors.white,
        //listing in rows
        child: FlatButton(
            onPressed: () {

              locationNames.length != 1 ?
              Navigator.of(context).push(_createRoute(locationNames, initiativeId, true, apiUrl)):
              Navigator.of(context).push(_createRoute(actorNames, initiativeId, false, apiUrl));
            },
            child: Container(
              width: double.infinity,
              child: Text(observationName,

                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                  textAlign: TextAlign.center),
            )

        )

    );
  }

  Route _createRoute(List<String> names, String id, bool isForLocations, String apiUrl) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => isForLocations ? Locations(names, orgId, id,  accessToken, apiUrl): Actors(names, orgId, id, accessToken, apiUrl),
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
