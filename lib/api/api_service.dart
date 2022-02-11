import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import 'package:tracker_app/model/models.dart';
import '../model/models.dart';

class APIService {
  //Async means that this function is asynchronous and you might need to wait a bit to get its result.
  //Await literally means - wait here until this function is finished and you will get its return value.
  //Future is a type that ‘comes from the future’ and returns value from your asynchronous function. It can complete with success(.then) or within error(.catchError).

  Future<LoginResponseModel?> makeRequest(String username, String password) async {
    //   String url = "https://reqres.in/api/login";
    var headers = {
      'Authorization': 'Basic Y2xpZW50OjEyMzQ1Ng==',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('http://45.62.229.153:8091/oauth/token'));
    request.bodyFields = {
      'grant_type': 'password',
      'username': username,
      'password': password,
      'scope': '',
      //Application grant types (or flows) are methods through which applications
      // can gain Access Tokens and by which you grant limited access to your resources to another entity
      // without exposing credentials.
      // The OAuth 2.0 protocol supports several types of grants, which allow different types of access.
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future<UserProfileModel?> getUserProfile(String username, String password, String accessToken, String apiUrl) async {
    var headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/x-www-form-urlencoded',

    };
    var request = http.Request(
        'GET', Uri.parse('$apiUrl/profile'));
    request.bodyFields = {
      'grant_type': 'password',
      'username': username,
      'password': password,
      'scope': ''
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future<List<InitiativesModel>?> getInitiatives(String accessToken, String orgId, String apiUrl) async {
    var headers = {
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('GET', Uri.parse('$apiUrl/org/$orgId/initiative'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      List<InitiativesModel> list = parseInitiatives(
          await response.stream.bytesToString());
      return list;
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static List<InitiativesModel> parseInitiatives(String responseBody) {
    final parsedInitiatives = jsonDecode(responseBody).cast<
        Map<String, dynamic>>(); //gets the list of JSON objects
    return parsedInitiatives.map<InitiativesModel>((json) =>
        InitiativesModel.fromJson(json))
        .toList(); //return each Initiative Object
  }


  Future<List<ObservationModel>?> getObservations(String accessToken, String orgId, String initiativeId, String apiUrl) async {
    var headers = {
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('GET', Uri.parse('$apiUrl/org/$orgId/initiative/$initiativeId/observation'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<ObservationModel> list = parseObservations(
          await response.stream.bytesToString());
      return list;
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static List<ObservationModel> parseObservations(String responseBody) {
    final parsedObservations = jsonDecode(responseBody).cast<
        Map<String, dynamic>>();
    return parsedObservations.map<ObservationModel>((json) =>
        ObservationModel.fromJson(json)).toList();
  }

  Future<List<LocationModel>?> getLocations(String accessToken, String orgId, String initiativeId, String apiUrl) async
  {
    var headers = {
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('GET', Uri.parse('$apiUrl/org/$orgId/initiative/$initiativeId/location'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<LocationModel> list = parseLocations(
          await response.stream.bytesToString());
      return list;
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static List<LocationModel> parseLocations(String responseBody) {
    final parsedLocations = jsonDecode(responseBody).cast<
        Map<String, dynamic>>();
    return parsedLocations.map<LocationModel>((json) =>
        LocationModel.fromJson(json)).toList();
  }



  Future<List<ActorModel>?> getActors(String accessToken, String orgId, String initiativeId, String apiUrl) async
  {
    var headers = {
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('GET', Uri.parse('$apiUrl/org/$orgId/initiative/$initiativeId/actor'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<ActorModel> list = parseActors(await response.stream.bytesToString());
      return list;
    }
    else {
      print(response.reasonPhrase);
    }

  }

  static List<ActorModel> parseActors(String responseBody)
  {
    final parsedActors = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsedActors.map<ActorModel>((json) => ActorModel.fromJson(json)).toList();
  }


}



