import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:byahe_app/pages/login_auth.dart';
import 'package:byahe_app/pages/register/registerpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // const LoginPage({ Key? key }) : super(key: key);
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Text(
            'BYAHE',
            style: TextStyle(
              fontFamily: 'Thasadith',
              fontWeight: FontWeight.bold,
              color: Colors.yellow[700],
              fontSize: 60,
            ),
          )),
          Image.asset('assets/undraw_Vehicle_sale_a645-removebg-preview.png'),
          Form(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellow[700])),
                          hintText: ("Username"),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.yellow[700],
                          ),
                          border: OutlineInputBorder()),
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellow[700])),
                          hintText: ("Password"),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.yellow[700],
                          ),
                          border: OutlineInputBorder()),
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: ElevatedButton(
                      onPressed: () {
                        final String email = userController.text.trim();
                        final String password = passwordController.text.trim();

                        if (email.isEmpty) {
                          print("User Email is Empty");
                        } else {
                          if (password.isEmpty) {
                            print("Password is Empty");
                          } else {
                            context.read<Authenticate>().login(
                                  email,
                                  password,
                                );
                          }
                        }
                        //try for signup
                        /*if (email.isEmpty) {
                          print("Email is Empty");
                        } else {
                          if (password.isEmpty) {
                            print("Password is Empty");
                          } else {
                            context
                                .read<Authenticate>()
                                .register(email, password)
                                .then((value) async {
                              User user = FirebaseAuth.instance.currentUser;

                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(user.uid)
                                  .set({
                                'uid': user.uid,
                                'email': email,
                                'password': password,
                              });
                            });
                          }
                        }*/
                        //Navigator.pushNamed(context, '/locationselection');
                      },
                      child: Text("LOGIN"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.yellow[700],
                          fixedSize: Size(200, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                    )),
                InkWell(
                  onTap: () {
                    //Navigator.pushNamed(context, '/register');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Don't have account yet? Register now!",
                      style: TextStyle(fontSize: 15, color: Colors.blue[200])),
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}
