import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pdcl_marketing/Controllers/login_controller.dart';
import 'package:pdcl_marketing/pages/home_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String _title = 'Pdcl Marketing';

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // add this
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child:  const Text("PDCL Marketing",
                      style: TextStyle(
                      fontSize: 18),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child:  TextField(
                      onChanged: (text) {
                        _loginController.checkUserName(text);
                      },
                      obscureText: true,
                      //controller: ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'UserName',
                        hintText: 'Enter User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      onChanged: (text) {
                        _loginController.checkPassword(text);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        int aFlag = _loginController.login();
                       // getXHelper.getUserName();
                        if(aFlag == 1) {
                          Fluttertoast.showToast(
                              msg: "Successfully login!" +
                                  _loginController.userName.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                              Get.to(HomePage());
                        }
                        else if(aFlag == 2){
                          Fluttertoast.showToast(
                              msg: "Username and password not correct!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "Please input all fields",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
