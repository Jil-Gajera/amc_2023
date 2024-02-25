
import 'package:amc_2023/login/createAccount.dart';
import 'package:amc_2023/login/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "start",
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: (){
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Icon(Icons.arrow_back_sharp,color: Colors.black,size: 25,)),
            elevation: 0,
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Expanded(
                  flex: 0,
                  child: Padding(

                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: SizedBox(
                      height:250,
                      width: double.infinity,
                      //color: Colors.black,
                      child: Image.asset("asset/images/welcome.png" ,fit: BoxFit.fitHeight,)
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: SizedBox(
                    //color: Colors.blueAccent,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 8,),
                          Text("Let's you in",style: Theme.of(context).textTheme.displayLarge,),
                          const SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                            child: OutlinedButton(onPressed: (){},
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    fixedSize: const Size(double.infinity, 55),
                                    elevation: 5,
                                    backgroundColor: Colors.white
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const FaIcon(
                                        FontAwesomeIcons.facebook
                                    ),
                                    const SizedBox(width: 15,),
                                    Text("Continue with Facebook",style: Theme.of(context).textTheme.bodyLarge,)
                                  ],
                                )),
                          ),//facebook
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                            child: OutlinedButton(onPressed: (){},
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    fixedSize: const Size(double.infinity, 55),
                                    elevation: 5,
                                    backgroundColor: Colors.white
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("asset/images/google.png",scale: 90,),
                                    const SizedBox(width: 5,),
                                    Text("Continue with Google",style: Theme.of(context).textTheme.bodyLarge,)
                                  ],
                                )),
                          ),//google
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                            child: OutlinedButton(onPressed: (){},
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    fixedSize: const Size(double.infinity, 55),
                                    elevation: 5,
                                    backgroundColor: Colors.white
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const FaIcon(FontAwesomeIcons.apple,color: Colors.black,size: 28,),
                                    const SizedBox(width: 15,),
                                    Text("Continue with Apple",style: Theme.of(context).textTheme.bodyLarge,)
                                  ],
                                )),
                          ),
                          const SizedBox(height: 21,),
                          //apple

                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0,right: 25),
                          child: SizedBox(
                            width: double.infinity,
                            //height: 15,
                            child: Stack(
                              children: [
                                Align(
                  
                                  alignment: Alignment.center,
                  
                                  child: Divider(
                                    color: Colors.black.withOpacity(.8),
                                    height: 5,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    width: 40,
                                    child: const Center(child: Text("or")),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),//or
                        Padding(
                          padding: const EdgeInsets.only(top:10,left: 20,right: 20),
                          child: ElevatedButton(
                  
                            style: ElevatedButton.styleFrom(
                                elevation: 15,
                                fixedSize: const Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(180),
                                ),
                                backgroundColor: Colors.blueAccent
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                            },
                            child: const Center(
                              child: Text(
                                "Sign in with password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't you have an account?"),
                  
                              TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccount(),));
                                  },
                                  child: const Text("Sign up")),
                  
                            ],
                          ),
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
    );
  }
}