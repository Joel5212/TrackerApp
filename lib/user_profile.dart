// import 'package:flutter/material.dart';
//
// import 'api/api_service.dart';
// import 'initiatives/initiatives.dart';
// import 'methods.dart';
// import 'organizations/organization.dart';
// class UserProfile extends StatelessWidget {
//   String username;
//   String password;
//   String accessToken;
//   UserProfile(this.username, this.password, this.accessToken);
//   @override
//   Widget build(BuildContext context) {
//     List<String> orgNames = Methods.getOrgNames(username, password, accessToken);
//     List<String> orgIds = Methods.getOrgIds(username, password, accessToken);
//      List<String> initiativeNames = [];
//      List<String> initiativeIds = [];
//     if(orgIds.isNotEmpty) {
//        initiativeNames = Methods.getInitiativeNames(accessToken, orgIds[0]);
//        initiativeIds = Methods.getInitiativeIds(accessToken, orgIds[0]);
//     }
//     return orgIds.length != 1 ? Organizations(orgNames, orgIds, accessToken): Initiatives(orgNames, orgIds, orgIds[0], initiativeNames, initiativeIds, accessToken);
//   }
//
//   // Route _createRoute(List<String> names,  List<String> ids, String id, String accessToken, bool isForOrganizations) {
//   //     return PageRouteBuilder(
//   //       pageBuilder: (context, animation, secondaryAnimation) => isForOrganizations ? Organizations(names, ids, accessToken): Initiatives(names, id, ids, accessToken),
//   //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//   //         const begin = Offset(1, 0.0);
//   //         const end = Offset.zero;
//   //         const curve = Curves.easeIn;
//   //         final tween = Tween(begin: begin, end: end).chain(CurveTween(curve:curve));
//   //         final offsetAnimation = animation.drive(tween);
//   //         return SlideTransition(
//   //           position: offsetAnimation,
//   //           child: child,
//   //         );
//   //       },
//   //     );
//   //   }
//
//
//     List<String> getOrgNames(String username, String password, String accessToken)
//     {
//       APIService apiService = new APIService();
//       List<String> organizationNames = [];
//       apiService.getUserProfile(username, password, accessToken).then((value) {
//         if(value != null)
//         {
//           if (value.org.isNotEmpty)
//           {
//             for (int i = 0; i < value.org.length; i++)
//             {
//               organizationNames.add(value.org[i].orgName);
//             }
//             return organizationNames;
//           }
//         }
//       });
//       return organizationNames;
//     }
//
//
//     List<String> getOrgIds(String username, String password, String accessToken)
//     {
//       APIService apiService = new APIService();
//       List<String> organizationIds = [];
//       apiService.getUserProfile(username, password, accessToken).then((value) {
//         if(value != null)
//         {
//           if (value.org.isNotEmpty)
//           {
//             for (int i = 0; i < value.org.length; i++)
//             {
//               organizationIds.add(value.org[i].id);
//             }
//             return organizationIds;
//           }
//         }
//       });
//       return organizationIds;
//     }
//
//     List<String> getInitiativeNames(String accessToken, String orgId, BuildContext context)
//     {
//       APIService apiService = new APIService();
//       List<String> initiativeNames = [];
//       apiService.getInitiatives(accessToken, orgId).then((value){
//
//
//         if(value != null)
//         {
//           for(int i = 0; i < value.length; i++)
//           {
//             if (value[i].initiativeName.isNotEmpty)
//             {
//               initiativeNames.add(value[i].initiativeName);
//
//               // Navigator.push(context, MaterialPageRoute(builder: (context) {
//               //   print(value.initiativeName);
//               //   return Initiatives(initiative: value.initiativeName, id: id);
//               //
//               // }));
//             }
//           }
//           return initiativeNames;
//
//         }
//
//         // Navigator.push(context, MaterialPageRoute(builder: (context) {
//         //   // return Initiatives(initiativeNames: initiativeNames, orgId: orgId, initiativeIds: initiativeIds, accessToken: accessToken);
//         //
//         // }));
//
//
//
//       });
//       return initiativeNames;
//     }
//
//     List<String> getInitiativeIds(String accessToken, String orgId, BuildContext context)
//     {
//       APIService apiService = new APIService();
//       List<String> initiativeIds = [];
//       apiService.getInitiatives(accessToken, orgId).then((value){
//
//
//         if(value != null)
//         {
//           for(int i = 0; i < value.length; i++)
//           {
//             if (value[i].id.isNotEmpty)
//             {
//               initiativeIds.add(value[i].id);
//
//               // Navigator.push(context, MaterialPageRoute(builder: (context) {
//               //   print(value.initiativeName);
//               //   return Initiatives(initiative: value.initiativeName, id: id);
//               //
//               // }));
//             }
//           }
//           return initiativeIds;
//         }
//         // Navigator.push(context, MaterialPageRoute(builder: (context) {
//         //   // return Initiatives(initiativeNames: initiativeNames, orgId: orgId, initiativeIds: initiativeIds, accessToken: accessToken);
//         //
//         // }));
//
//
//
//       });
//       return initiativeIds;
//     }
// }
