import 'package:tracker_app/organizations/organization.dart';

class LoginResponseModel{
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;
  String jti;
  //To parse is to break up a sentence or group of words into separate components, including the definition of each part's function or form. ...
  // Parsing is used in all high-level programming languages. Languages like C++ and Java are parsed by their respective compilers before
  // being transformed into executable machine code.

  LoginResponseModel({required this.accessToken, required this.tokenType, required this.refreshToken, required this.expiresIn, required this.scope, required this.jti});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
     accessToken: json['access_token'],
      tokenType: json['token_type'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
      scope: json['scope'],
      jti: json['jti'],




    );
  }
}

class UserProfileModel{
  String userType;
  List<OrganizationsModel> org;
  //https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
  //factory keyword when implementing a constructor that doesn’t always create a new instance of its class and that’s what we need right now.

      UserProfileModel({required this.userType, required this.org});
      factory UserProfileModel.fromJson(Map<String, dynamic> json){
    return UserProfileModel(
        //orgs requires a list not a json key/object
        userType: json["userType"],
        org: parseOrganizations(json),

    );
  }

  static List<OrganizationsModel> parseOrganizations(orgsJson) {
    //list is accessing the 2 lists in orgs
    var list = orgsJson['org'] as List;
    //list of the orgNames is saved in this list
    List<OrganizationsModel> orgsList = list.map((data) => OrganizationsModel.fromJson(data)).toList();
    return orgsList;
  }


}



class OrganizationsModel{
  String orgName;
  String id;

  OrganizationsModel({required this.orgName, required this.id});

  factory OrganizationsModel.fromJson(Map<String , dynamic> json){
    return OrganizationsModel(
      orgName: json["orgName"],
      id: json["id"]

    );
  }
}


class InitiativesModel{
  String id;
  String initiativeName;
 InitiativesModel({required this.id, required this.initiativeName});
 factory InitiativesModel.fromJson(Map<String, dynamic> json)
 {
      return InitiativesModel(
        id: json["id"],
        initiativeName: json["initiativeName"],
      );


 }
}

class ObservationModel{
  String observationName;
  String observationId;
  ObservationModel({required this.observationName, required this.observationId});

  factory ObservationModel.fromJson(Map<String, dynamic> json)
  {
     return ObservationModel(
       observationId: json['id'],
       observationName: json["observationName"]
     );
  }
}

class LocationModel {
  String locationName;
  LocationModel({required this.locationName});

  factory LocationModel.fromJson(Map<String, dynamic> json)
  {
    return LocationModel(
      locationName: json['locationName'],
      // locationId: json['locationId']
    );
  }
}


class ActorModel{
  String actorName;
  ActorModel({required this.actorName});

  factory ActorModel.fromJson(Map<String, dynamic> json)
  {
    return ActorModel(
      actorName: json['actorName'],
  // locationId: json['locationId']
    );
  }
  }

// class LoginRequestModel {
//   String email;
//   String password;

//
//   LoginRequestModel({
//     required this.email,
//     required this.password,
//   });
//
//   Map<String, dynamic> toJson()
//   {
//     Map<String, dynamic> map = {
//       'email': email.trim(),
//       'password': password.trim(),
//     };
//     //from the variables we are creating the json
//
//     return map;
//   }
//
// }