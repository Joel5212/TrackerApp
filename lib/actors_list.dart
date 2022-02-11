import 'package:flutter/material.dart';

import 'actor_item.dart';
import 'observation_item.dart';
class ActorsList extends StatelessWidget {
  List<String> actorNames;
  String orgId;
  String initiativeId;
  String accessToken;
  String apiUrl;

  ActorsList(this.actorNames, this.orgId, this.initiativeId, this.accessToken, this.apiUrl);

  @override
  Widget build(BuildContext context) {
    return actorNames.isEmpty ? LayoutBuilder(builder: (ctx, constraints){
      return Column(
        children: <Widget>[
          SizedBox(
              height: 100
          ),
          Container(

              child: Text('No Actors added',
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
      itemCount:  actorNames.length,
      itemBuilder: (BuildContext ctx, int index) {
        return ActorItem(actorNames[index], accessToken, apiUrl);

      },

    );
  }
}