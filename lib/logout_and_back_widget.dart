import 'package:flutter/material.dart';
import 'package:tracker_app/pages/login_page.dart';
class LogoutAndBack extends StatelessWidget {
  bool logoutAndBack;
  String apiUrl;
  LogoutAndBack(this.logoutAndBack, this.apiUrl);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
          Positioned(
          right: 20,
          bottom: 620,
          child: Container(
            child: RawMaterialButton(
                child: Icon(
                  Icons.logout,
                  size: 40,
                  color: Colors.white,
                ),
              onPressed: ()
              {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => LoginPage(apiUrl)
                ));
              },
            ),
            // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          // Positioned(
          //   bottom: 620,
          //   right: 20,
          //   child: FloatingActionButton(
          //     heroTag: 'next',
          //     onPressed: () {
          //       Navigator.push(context, new MaterialPageRoute(
          //           builder: (context) => LoginPage()
          //       ));
          //     },
          //     child: Icon(
          //       Icons.logout,
          //       size: 40,
          //     ),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          // ),
          // Add more floating buttons if you want
          // There is no limit
        ),
        if(logoutAndBack)
        Positioned(
          left: 20,
          bottom: 620,
          child: Container(
            child: RawMaterialButton(
                child: Icon(
                  Icons.arrow_left,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: ()
                {
                  Navigator.pop(context);
                }
            ),
            // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(0, 9), // changes position of shadow
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
