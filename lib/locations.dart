import 'package:flutter/material.dart';
import 'package:tracker_app/logout_and_back_widget.dart';

import 'locations_list.dart';
class Locations extends StatelessWidget {
  List<String> locationNames;
  String orgId;
  String initiativeId;
  String accessToken;
  String apiUrl;
  Locations(this.locationNames, this.orgId, this.initiativeId, this.accessToken, this.apiUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: LogoutAndBack(true, apiUrl),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Theme.of(context).accentColor,
        body: Column(
          children: <Widget> [
            Container(
              width: double.infinity, //.infinity property of the double object tells the container to use as much space as possible
              margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
              child: Text("Locations", style: Theme
                  .of(context)
                  .textTheme
                  .headline3,
                  textAlign: TextAlign.center

              ),


            ),
            Container(
              child: Expanded(
              child: LocationsList( locationNames,  orgId,  initiativeId,  accessToken, apiUrl),
              )
              )
          ],
        )
    );
  }
}
