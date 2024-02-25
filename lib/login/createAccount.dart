import 'package:amc_2023/homePage.dart';
import 'package:amc_2023/login/accountSetup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<void> handleGoogleSignIn() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await auth.signInWithCredential(credential);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(
              fname: '',
            ),
          ),
        );
      }
    } catch (error) {
      debugPrint("Google Sign-In Error: $error");
    }
  }

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var eColor, bColor;
  var ic = const Icon(Icons.visibility_off);
  bool flag = true;
  bool _isChecked = false;

  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "start",
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff00c6fb), Color(0xff005bea)],
                  begin: FractionalOffset(1, 1),
                  end: FractionalOffset(0, 1)),
            ),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .24,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.elliptical(100, 30)),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff00c6fb),
                                    Color(0xff005bea)
                                  ],
                                  begin: FractionalOffset(1, 1),
                                  end: FractionalOffset(0, 1)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 15),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.arrow_back_sharp,
                                        color: Colors.white,
                                        size: 25,
                                      )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                  ),
                                  child: Text(
                                    "Create your\nAccount",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ))),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .73,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(300, 80),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15, right: 15, bottom: 5),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .07,
                            ),
                            Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    style:
                                        const TextStyle(fontFamily: "Schyler"),
                                    onTap: () {
                                      setState(() {
                                        eColor = emailC.text.isNotEmpty
                                            ? Colors.black
                                            : Colors.blueAccent;
                                        bColor = Colors.blue;
                                      });
                                    },
                                    controller: nameC,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black.withOpacity(.05),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(.05)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: "Full name",
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: eColor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please enter full name";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .020,
                                  ),
                                  TextFormField(
                                    style:
                                        const TextStyle(fontFamily: "Schyler"),
                                    onTap: () {
                                      setState(() {
                                        eColor = emailC.text.isNotEmpty
                                            ? Colors.black
                                            : Colors.blueAccent;
                                        bColor = Colors.blue;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please enter email";
                                      } else if (!isValidEmail(value)) {
                                        return "please enter valid email";
                                      }
                                      return null;
                                    },
                                    controller: emailC,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black.withOpacity(.05),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(.05)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: "Email",
                                      prefixIcon: Icon(
                                        Icons.mail_outline,
                                        color: eColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .020,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please enter password";
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      setState(() {
                                        eColor = emailC.text.isNotEmpty
                                            ? Colors.black
                                            : Colors.blueAccent;
                                        bColor = Colors.blue;
                                      });
                                    },
                                    controller: passC,
                                    obscureText: flag,
                                    style:
                                        const TextStyle(fontFamily: "Schyler"),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Colors.black.withOpacity(.05),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(.05)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blueAccent),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText: "Create Password",
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: eColor,
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              if (flag == true) {
                                                ic = const Icon(
                                                    Icons.visibility);
                                                flag = false;
                                                setState(() {});
                                              } else {
                                                ic = const Icon(
                                                    Icons.visibility_off);
                                                flag = true;
                                                setState(() {});
                                              }
                                            },
                                            icon: ic)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  side: const BorderSide(
                                      width: 2, color: Colors.blueAccent),
                                  value: _isChecked,
                                  hoverColor: Colors.blueAccent,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  "Remember me!",
                                  style: TextStyle(fontFamily: "Schyler"),
                                )
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 15,
                                  fixedSize: const Size(double.infinity, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(180),
                                  ),
                                  backgroundColor: bColor),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Login(),
                                      ));
                                }
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: emailC.text,
                                  password: passC.text,
                                )
                                    .then((value) {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AccountSetup()))
                                      .catchError((error) {
                                    Fluttertoast.showToast(
                                      msg: error.message,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.white,
                                      textColor: Colors.black,
                                      fontSize: 16.0,
                                    );
                                  });
                                });
                              },
                              child: const Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .035,
                            ),
                            Expanded(
                              child: SizedBox(
                                //color: Colors.redAccent,
                                width: double.infinity,
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: SizedBox(
                                        //color: Colors.blueAccent,
                                        width: double.infinity,
                                        height: 15,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Divider(
                                                color: Colors.black
                                                    .withOpacity(.8),
                                                height: 5,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                color: Colors.white,
                                                height: 20,
                                                width: 130,
                                                child: const Center(
                                                    child: Text(
                                                  "or continue with",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .030,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(80, 50),
                                                elevation: 5,
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            child: SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                    "asset/images/facebook.png"))),
                                        ElevatedButton(
                                            onPressed: () {
                                              handleGoogleSignIn();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(80, 50),
                                                elevation: 5,
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            child: SizedBox(
                                                height: 45,
                                                width: 45,
                                                child: Image.asset(
                                                    "asset/images/google.png"))),
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(80, 50),
                                                elevation: 5,
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            child: SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: Image.asset(
                                                    "asset/images/apple.png"))),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .025,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Already have an account?"),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Login(),
                                                  ));
                                            },
                                            child: const Text("login")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }
}
