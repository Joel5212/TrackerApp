import 'package:flutter/material.dart';
import 'package:tracker_app/logout_and_back_widget.dart';
import 'package:tracker_app/pages/login_page.dart';
import 'organizations_list.dart';


class Organizations extends StatelessWidget {
  List<String> organizationNames;
  List<String> orgIds;
  String accessToken;
  String apiUrl;
  Organizations(this.organizationNames,  this.orgIds, this.accessToken, this.apiUrl);


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
      child: Scaffold(
          floatingActionButton: LogoutAndBack(false, apiUrl),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Theme.of(context).accentColor,
        body: Column(
        children: <Widget> [
          Container(
            width: double.infinity, //.infinity property of the double object tells the container to use as much space as possible
            margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
            child: Text("Organizations", style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center),


          ),
          Container(
            child: Expanded(
            child: OrganizationsList( organizationNames,  orgIds,  accessToken, apiUrl),
          )
          )
        ],
      )
    )
    );
  }
}
