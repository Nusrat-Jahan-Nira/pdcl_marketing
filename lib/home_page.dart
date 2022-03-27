import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String _title = 'Pdcl Marketing';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
          Center(
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
                         padding: const EdgeInsets.all(5),
                         child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'UserName',
                            hintText: 'Enter User Name',
                          ),
                         ),
                       ),
                       Container(
                          padding: const EdgeInsets.all(5),
                          child: const TextField(
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
                              Fluttertoast.showToast(
                                  msg: "This is Center Short Toast",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
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
          )

    );
  }
}
