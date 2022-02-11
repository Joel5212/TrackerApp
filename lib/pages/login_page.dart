import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tracker_app/initiatives/initiatives.dart';
import 'package:tracker_app/model/models.dart';
import 'package:tracker_app/ProgressHUD.dart';
import 'package:tracker_app/api/api_service.dart';
import 'package:tracker_app/organizations/organization.dart';
import 'package:tracker_app/user_profile.dart';


class LoginPage extends StatefulWidget {

  String apiUrl;

  LoginPage(this.apiUrl);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  // late LoginRequestModel requestModel;
  bool isApiCallProcess = false;
  var _username;
  var _password = "";
  final usernameCon = new TextEditingController();
  final passwordCon = new TextEditingController();
  bool isButtonEnabled = false;
  String username = "";
  String password = "";
  late List<String> organizations;





  @override
  void initState() {

    super.initState();
    // requestModel = new LoginRequestModel(email: '', password: '');
    passwordCon.addListener(() {
      setState(() {
        _password = passwordCon.text;
      });
    });

    usernameCon.addListener(() {
      setState(() {
        _username = usernameCon.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _uiSetup(context), inAsyncCall: isApiCallProcess, opacity: 0.30);
  }

  @override
  Widget _uiSetup(BuildContext context) {
    String apiUrl = widget.apiUrl;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme
          .of(context)
          .accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
        Stack(children: <Widget>[
          Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme
                .of(context)
                .primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Theme
                      .of(context)
                      .hintColor
                      .withOpacity(0.2),
                  offset: Offset(0, 5),
                  blurRadius: 10)
            ],
          ),
          //Flutter provides a Form widget to create a form. The form widget acts as a container,
          // which allows us to group and validate the multiple form fields. When you create a form,
          // it is necessary to provide the GlobalKey.
          // This key uniquely identifies the form and allows you to do any validation in the form fields.
          child: Form(
            key: globalFormKey,
            child: Column(
                children: <Widget>[
                SizedBox(height: 25),
            Text(
              "TrackerApp",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline2,
            ),
            SizedBox(
              height: 20,
            ),
            new TextFormField(
              controller: usernameCon,
              keyboardType: TextInputType.text,
              onSaved: (input) => username = input!,
              decoration: new InputDecoration(
                hintText: "Username",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:
                    Theme
                        .of(context)
                        .accentColor
                        .withOpacity(0.2),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme
                        .of(context)
                        .accentColor,
                  ),
                ),
                prefixIcon: Icon(Icons.account_box_rounded,
                    color: Theme
                        .of(context)
                        .accentColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new TextFormField(
              controller: passwordCon,
              keyboardType: TextInputType.text,
              //Whenever we enter any data in our text box it will map our data with our request model variables
              onSaved: (input) => password = input!,
              obscureText: hidePassword,
              decoration: new InputDecoration(
                hintText: "Password",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:
                    Theme
                        .of(context)
                        .accentColor
                        .withOpacity(0.2),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme
                        .of(context)
                        .accentColor,
                  ),
                ),
                prefixIcon: Icon(Icons.lock,
                    color: Theme
                        .of(context)
                        .accentColor),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color:
                    Theme
                        .of(context)
                        .accentColor
                        .withOpacity(0.4),
                    icon: Icon(hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility)),
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(

              onPressed: canBePressed() ?
                () {
                if (validateAndSave()) {
              setState(() {
              isApiCallProcess = true;
              });
              APIService apiService = new APIService();
              String accessToken;
              //calling the login method from API service which tries to find the
              apiService.makeRequest(username, password).then((value) {
                setState(() {
                    isApiCallProcess = false;
                  });




                if(value == null)
                  {
                    final snackBar =
                    SnackBar(content: Text("Login Unsuccessful"));
                    scaffoldKey.currentState!
                        .showSnackBar(snackBar);
                  }
                else if(value.accessToken.isNotEmpty) {
                  accessToken = value.accessToken;
                    final snackBar = SnackBar(
                        content: Text("Login Successful"));
                    scaffoldKey.currentState!
                        .showSnackBar(snackBar);
                    // setState(() {
                    //   isLoggedIn = true;
                    // });
                    // int start = value.indexOf(":") + 2;
                    // int end = value.indexOf(",") - 1;
                    // String access_token = value.substring(start, end);


                 // List<String> orgNames = getOrgNames(username, password, accessToken);
                 // List<String> orgIds = getOrgIds(username, password, accessToken);
                 //  List<String> initiativeNames = [];
                 //  List<String> initiativeIds = [];
                 // if(orgIds.isNotEmpty) {
                 //    initiativeNames = getInitiativeNames(accessToken, orgIds[0], context);
                 //    initiativeIds = getInitiativeIds(accessToken, orgIds[0], context);
                 // }
                  APIService apiService = new APIService();
                  List<String> organizationIds = [];
                  List<String> organizationNames = [];
                  apiService.getUserProfile(username, password, accessToken, apiUrl).then((value) {
                    if(value != null)
                    {
                      if (value.org.isNotEmpty)
                      {
                        for (int i = 0; i < value.org.length; i++)
                        {
                          organizationNames.add(value.org[i].orgName);
                          organizationIds.add(value.org[i].id);
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Organizations(organizationNames, organizationIds, accessToken, apiUrl);

                        }));

                      }

                    }
                  });



                  }


              // print(value);

              });




              }

              } : null,
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme
                  .of(context)
                  .accentColor,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 80,
              ),


            ),
          ],
        ),
      ),
    )])
    ]
    ,
    )
    )
    ,
    );
  }

  //function is checking if the form is valid
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  bool canBePressed() {
    if(_password != "" && _username != "")
    {
      if(_password.length > 3 && _username.toString().contains("@"))
      {
      return true;
      }
      return false;
    }
    else
    {
      return false;
    }
  }


}
