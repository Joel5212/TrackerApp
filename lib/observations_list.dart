import 'package:flutter/material.dart';

import 'observation_item.dart';
class ObservationsList extends StatelessWidget {
  List<String> observationNames;
  String orgId;
  String initiativeId;
  String accessToken;
  String apiUrl;
  ObservationsList(this.observationNames, this.orgId, this.initiativeId, this.accessToken, this.apiUrl);

  @override
  Widget build(BuildContext context) {
    return observationNames.isEmpty ? LayoutBuilder(builder: (ctx, constraints){
      return Column(
        children: <Widget>[
          SizedBox(
              height: 100
          ),
          Container(

              child: Text('No Observations added',
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
      itemCount:  observationNames.length,
      itemBuilder: (BuildContext ctx, int index) {
        return ObservationItem(observationNames[index],  orgId, initiativeId,  accessToken, apiUrl);

      },

    );
  }
}
