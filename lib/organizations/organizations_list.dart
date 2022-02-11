import 'package:flutter/material.dart';
import 'organization_item.dart';
import 'package:tracker_app/api/api_service.dart';
import 'package:tracker_app/initiatives/initiatives.dart';
import 'package:tracker_app/model/models.dart';



class OrganizationsList extends StatelessWidget {
List<String> organizationNames;
List<String> orgIds;
String accessToken;
String apiUrl;
OrganizationsList(this.organizationNames,  this.orgIds, this.accessToken, this.apiUrl);





  @override
  Widget build(BuildContext context) {
    int orgLength = organizationNames.length;
    return organizationNames.isEmpty ?
    LayoutBuilder(builder: (ctx, constraints){
      return Column(
        children: <Widget>[
          SizedBox(
              height: 30
          ),
          Container(

              child: Text('No Organizations added',
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
      itemCount:  orgLength,
      itemBuilder: (BuildContext ctx, int index) {
        return OrganizationsItem(organizationNames, orgIds, orgLength, organizationNames[index],  orgIds[index], accessToken, apiUrl);

      },

    );

  }
}
