import 'package:flutter/cupertino.dart';

import 'api/api_service.dart';

class Methods{

  static List<String> getOrgNames(String username, String password, String accessToken, String apiUrl)
  {
    APIService apiService = new APIService();
    List<String> organizationNames = [];
    apiService.getUserProfile(username, password, accessToken, apiUrl).then((value) {
      if(value != null)
      {
        if (value.org.isNotEmpty)
        {
          for (int i = 0; i < value.org.length; i++)
          {
            organizationNames.add(value.org[i].orgName);
          }
          return organizationNames;
        }
      }
    });
    return organizationNames;
  }


  static List<String> getOrgIds(String username, String password, String accessToken, String apiUrl)
  {
    APIService apiService = new APIService();
    List<String> organizationIds = [];
    apiService.getUserProfile(username, password, accessToken, apiUrl).then((value) {
      if(value != null)
      {
        if (value.org.isNotEmpty)
        {
          for (int i = 0; i < value.org.length; i++)
          {
            organizationIds.add(value.org[i].id);
          }
          return organizationIds;
        }
      }
    });
    return organizationIds;
  }

  static List<String>  getInitiativeNames(String accessToken, String orgId, String apiUrl)
  {
    APIService apiService = new APIService();
    List<String> initiativeNames = [];
    apiService.getInitiatives(accessToken, orgId, apiUrl).then((value){

      if(value != null)
      {
        for(int i = 0; i < value.length; i++)
        {
          if (value[i].initiativeName.isNotEmpty)
          {
            initiativeNames.add(value[i].initiativeName);
          }
        }
        return initiativeNames;

      }
    });
    return initiativeNames;
  }

  static List<String> getInitiativeIds(String accessToken, String orgId, String apiUrl)
  {
    APIService apiService = new APIService();
    List<String> initiativeIds = [];
    apiService.getInitiatives(accessToken, orgId, apiUrl).then((value){


      if(value != null)
      {
        for(int i = 0; i < value.length; i++)
        {
          if (value[i].id.isNotEmpty)
          {
            initiativeIds.add(value[i].id);

            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   print(value.initiativeName);
            //   return Initiatives(initiative: value.initiativeName, id: id);
            //
            // }));
          }
        }
        return initiativeIds;
      }
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   // return Initiatives(initiativeNames: initiativeNames, orgId: orgId, initiativeIds: initiativeIds, accessToken: accessToken);
      //
      // }));



    });
    return initiativeIds;
  }


  static List<String> getObservationNames(String accessToken, String orgId, String initiativeId, String apiUrl)
  {

    APIService apiService = new APIService();
    List<String> observationNames = [];


    apiService.getObservations(accessToken, orgId, initiativeId, apiUrl).then((value){


      if(value != null)
      {
        for(int i = 0; i < value.length; i++)
        {
          if (value[i].observationName.isNotEmpty)
          {
            observationNames.add(value[i].observationName);


            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   print(value.initiativeName);
            //   return Initiatives(initiative: value.initiativeName, id: id);
            //
            // }));
          }
        }
        return observationNames;

      }
      // Navigator.of(context).push(_createRoute(observationNames, observationIds));
    });
    return observationNames;
  }

static List<String> getLocationNames(String accessToken, String orgId, String initiativeId, String apiUrl) {
  APIService apiService = new APIService();
  List<String> locationNames = [];

  apiService.getLocations(accessToken, orgId, initiativeId, apiUrl).then((value) {
    if (value != null) {
      for (int i = 0; i < value.length; i++) {
        if (value[i].locationName.isNotEmpty) {
          locationNames.add(value[i].locationName);
        }
      }
      return locationNames;
    }
  });
  return locationNames;
  }


static List<String> getActorNames(String accessToken, String orgId, String initiativeId, String apiUrl) {
  APIService apiService = new APIService();
  List<String> actorNames = [];
  apiService.getActors(accessToken, orgId, initiativeId, apiUrl).then((value) {

    if (value != null) {
      for (int i = 0; i < value.length; i++) {
        if (value[i].actorName.isNotEmpty) {
          actorNames.add(value[i].actorName);
        }
      }
    }
    return actorNames;

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return Actors(actorNames: actorNames, orgId: orgId, initiativeId: initiativeId, accessToken: accessToken);
    // }));
  });
  return actorNames;
}


}