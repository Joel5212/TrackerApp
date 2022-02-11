import 'package:flutter/material.dart';
import 'package:tracker_app/logout_and_back_widget.dart';
import 'package:tracker_app/organizations/organization.dart';
import 'package:tracker_app/pages/login_page.dart';
import '../api/api_service.dart';
import 'initiatives_list.dart';
import '../observations.dart';

class Initiatives extends StatelessWidget {
  List<String> orgNames;
  List<String> orgIds;
  String accessToken;
  String orgId;
  List<String> initiativeNames;
  List<String> initiativeIds;
  String apiUrl;

  Initiatives(this.orgNames, this.orgIds, this.orgId, this.initiativeNames,  this.initiativeIds, this.accessToken, this.apiUrl);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(


        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(top: 30.0),
        //   child: FloatingActionButton(
        //
        //     child: Icon(Icons.arrow_left, color: Colors.blueGrey),
        //       backgroundColor: Colors.white,
        //       onPressed: () {
        //         Navigator.push(context, new MaterialPageRoute(
        //             builder: (context) => Organizations(orgNames, orgIds, accessToken)
        //         ));
        //       }
        //   ),
        // ),
        floatingActionButton: LogoutAndBack(true, apiUrl),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Theme.of(context).accentColor,
        body:  Column(
          children: <Widget> [

            Container(
              width: double.infinity, //.infinity property of the double object tells the container to use as much space as possible
              margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
              child: Text("Initiatives", style: Theme
                  .of(context)
                  .textTheme
                  .headline3,
                  textAlign: TextAlign.center

              ),


            ),
            Container(
              child: Expanded(
              child: InitiativesList( initiativeNames,  orgId,  initiativeIds,  accessToken, apiUrl),
            )
            )
          ],
        )
    );
  }


}
