import 'package:flutter/material.dart';
import 'package:tracker_app/api/api_service.dart';
import 'package:tracker_app/initiatives/initiatives.dart';
import 'package:tracker_app/model/models.dart';
import 'package:tracker_app/observations.dart';

import '../methods.dart';
class OrganizationsItem extends StatelessWidget  {
  List<String> organizationNames;
  List<String> orgIds;
  int orgLength;
  String accessToken;
  String orgId;
  String organizationName;
  String apiUrl;
  OrganizationsItem(this.organizationNames, this.orgIds, this.orgLength, this.organizationName, this.orgId,  this.accessToken, this.apiUrl);
  @override
  Widget build(BuildContext context) {
    List<String> initiativeNames = Methods.getInitiativeNames(accessToken, orgId, apiUrl);
    List<String> initiativeIds = Methods.getInitiativeIds(accessToken, orgId, apiUrl);
    List<String> observationNames = [];
    if(initiativeNames.isNotEmpty) {
      observationNames =
          Methods.getObservationNames(accessToken, orgId, initiativeNames[0], apiUrl);
    }
    return Card(
      // key: Key(ids[index]),
        margin: EdgeInsets.all(8),
        elevation: 5,
        // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: Colors.white,
        //listing in rows
        child: FlatButton(
            onPressed: () {
             initiativeNames.length != 1 ?
             Navigator.of(context).push(_createRoute(organizationNames, orgIds, accessToken, orgId, initiativeNames, initiativeIds, "", true, apiUrl)):

             Navigator.of(context).push(_createRoute([], [], "", orgId, observationNames, [], initiativeIds[0], false, apiUrl));
            },
            child: Container(
              width: double.infinity,
              child: Text(organizationName,

                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                  textAlign: TextAlign.center),
            )

        )

    );
  }

  Route _createRoute(List<String> orgNames, List<String> orgIds,  String accessToken, String orgId, List<String> names, List<String> ids, String initId, bool isForInitiatives, String apiUrl) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => isForInitiatives ? Initiatives(orgNames,  orgIds, orgId,  names, ids,  accessToken, apiUrl): Observations(names, orgId,  initId, accessToken, apiUrl),
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

  // getInitiatives(String accessToken, String orgId, BuildContext context)
  // {
  //   APIService apiService = new APIService();
  //
  //   apiService.getInitiatives(accessToken, orgId).then((value){
  //     List<String> initiativeNames = [];
  //     List<String> initiativeIds = [];
  //
  //     if(value != null)
  //     {
  //       for(int i = 0; i < value.length; i++)
  //       {
  //         if (value[i].initiativeName.isNotEmpty && value[i].id.isNotEmpty)
  //         {
  //           initiativeNames.add(value[i].initiativeName);
  //           initiativeIds.add(value[i].id);
  //
  //           // Navigator.push(context, MaterialPageRoute(builder: (context) {
  //           //   print(value.initiativeName);
  //           //   return Initiatives(initiative: value.initiativeName, id: id);
  //           //
  //           // }));
  //         }
  //       }
  //
  //     }
  //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     //   // return Initiatives(initiativeNames: initiativeNames, orgId: orgId, initiativeIds: initiativeIds, accessToken: accessToken);
  //     //
  //     // }));
  //     Navigator.of(context).push(_createRoute(initiativeNames, initiativeIds));
  //
  //
  //
  //   });
  // }


}
