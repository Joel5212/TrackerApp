import 'package:flutter/material.dart';
import 'initiative_item.dart';

import 'initiatives.dart';
class InitiativesList extends StatelessWidget {
  List<String> initiativeNames;
  String orgId;
  List<String> initiativeIds;
  String accessToken;
  String apiUrl;
  InitiativesList(this.initiativeNames,  this.orgId, this.initiativeIds, this.accessToken, this.apiUrl);


  @override
  Widget build(BuildContext context) {
    int initLength = initiativeNames.length;
    return initiativeNames.isEmpty ?
    LayoutBuilder(builder: (ctx, constraints){
      return Column(
        children: <Widget>[
          SizedBox(
              height: 50
          ),
          Container(

            child: Text('No Initiatives added',
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

      itemCount:  initLength,
      itemBuilder: (BuildContext ctx, int index) {
        return InitiativeItem(initiativeNames[index], initLength, orgId,  initiativeIds[index], accessToken, apiUrl);

      },

    );

  }

}
