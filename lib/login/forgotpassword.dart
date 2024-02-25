import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forgotpassword extends StatefulWidget{
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailF = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var ecolor,bcolor;

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_sharp,color: Colors.black,size: 25,)),
            elevation: 0,
            title: Text("Password recovery",style: Theme.of(context).textTheme.bodyLarge)
          ),
        body:Stack(
          children:[
        
            Align(
              alignment: Alignment.topCenter,
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 350,
                width: double.infinity,
                //color: Colors.blueAccent,
                child: Image.asset("asset/images/forgotp.png",fit: BoxFit.cover,),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Expanded(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,top: 80),
                        child: Text("enter your registerd email address:",style: Theme.of(context).textTheme.bodyLarge,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15,top: 50),
                        child: TextField(
                          style: const TextStyle(fontFamily: "Schyler"),
                          onTap: (){
                            setState(() {
                              ecolor = emailF.text.isNotEmpty?Colors.black:Colors.blueAccent;
                              bcolor = Colors.blue;
                            });
                          },
                          controller: emailF,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(.05),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(.05)
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blueAccent
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Email",
                            prefixIcon: Icon(
        
                              Icons.mail_outline , color: ecolor,
                            ),
        
        
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,top: 15),
                        child: Text("a password recovery email will be sent to entered email address",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 12,color: Colors.black.withOpacity(.7)),),
                      ),
                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
        
                          style: ElevatedButton.styleFrom(
                              elevation: 15,
                              fixedSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(180),
                              ),
                              backgroundColor: bcolor
                          ),
                          onPressed: (){
                               FirebaseAuth.instance
                              .sendPasswordResetEmail(
                                  email: emailF.text)
                              .then((value) => Fluttertoast.showToast(
                                    msg:
                                        "We have sent you email to recover password please check email",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 16.0,
                                  ))
                              .onError(
                                  (error, stackTrace) => Fluttertoast.showToast(
                                        msg: error.toString(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.black,
                                        fontSize: 16.0,
                                      ));
                          },
                          child: const Center(
                            child: Text(
                              "Send Email",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
        ),
      );
  }
}