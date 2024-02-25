import 'dart:io';

import 'package:amc_2023/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  List<Choices> choices = [
    Choices("Spend or save daily"),
    Choices("Spend while travelling"),
    Choices("Spend and manage money"),
    Choices("Gain exposure to financial assets"),
    Choices("Others"),
  ];

  late List<Choices> selectedChoices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
              size: 25,
            )),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          //color: Colors.blueAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Text(
                "Reason for using ALLPay",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Text(
                "We want to provide best experience according to your needs",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black.withOpacity(.7)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Expanded(
                child: SizedBox(
                    // color: Colors.blueAccent,
                    width: double.infinity,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: choices.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: Colors.blueAccent,
                              ),
                              child: CheckboxListTile(
                                  side: const BorderSide(
                                      color: Colors.blueAccent, width: 2),
                                  title: Text(
                                    choices[index].choice,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  //title: Text(choices[index].isSelected.toString()),
                                  value: choices[index].isSelected,
                                  onChanged: (newValue) {
                                    choices[index].isSelected = newValue!;
                                    if (newValue) {
                                      selectedChoices.add(choices[index]);
                                    } else {
                                      selectedChoices.remove(choices[index]);
                                    }
                                    setState(() {});
                                  }),
                            ),
                          ),
                        );
                      },
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 20,
                          fixedSize: const Size(150, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180),
                          ),
                          backgroundColor: Colors.white70),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(
                                fname: '',
                              ),
                            ));
                      },
                      child: const Center(
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 20,
                          fixedSize: const Size(150, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180),
                          ),
                          backgroundColor: Colors.blueAccent),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileSetup(),
                            ));
                      },
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Choices {
  final String choice;
  bool isSelected = false;
  Choices(this.choice);
}

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  var fullname = TextEditingController();
  var nickname = TextEditingController();
  var emailP = TextEditingController();
  var mobile = TextEditingController();

  File? image;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
              size: 25,
            )),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              // color: Colors.yellow,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Text(
                    "Fill your profile",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Center(
                    child: Text(
                      "don't worry you can always change it later",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black.withOpacity(.7)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  SizedBox(
                      // color: Colors.lightBlueAccent,
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: image != null
                                ? FileImage(image!)
                                : const AssetImage("asset/images/noprofile.png")
                                    as ImageProvider,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: const Text("profile options"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Divider(
                                              color: Colors.black,
                                              height: 2,
                                            ),
                                            ListTile(
                                              leading: const FaIcon(
                                                Icons.image,
                                                color: Colors.black,
                                              ),
                                              title: Text(
                                                "upload from gallery",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              onTap: () {
                                                takephoto(ImageSource.gallery);
                                              },
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                              height: 2,
                                            ),
                                            ListTile(
                                              leading: const FaIcon(
                                                Icons.camera,
                                                color: Colors.black,
                                              ),
                                              title: Text(
                                                "upload from camera",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              onTap: () {
                                                takephoto(ImageSource.camera);
                                              },
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                              height: 2,
                                            ),
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blueAccent,
                                  child: FaIcon(
                                    Icons.camera_alt,
                                    size: 20,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Form(
                child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: double.infinity,
                height: 420,
                color: Colors.white,
                child: Column(children: [
                  TextField(
                    controller: fullname,
                    style: const TextStyle(fontFamily: "Schyler"),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(.05),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(.05)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "full name",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  TextFormField(
                    controller: nickname,
                    style: const TextStyle(fontFamily: "Schyler"),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(.05),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(.05)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Nickname",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  TextFormField(
                    controller: emailP,
                    style: const TextStyle(fontFamily: "Schyler"),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black.withOpacity(.05),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(.05)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Email",
                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: FaIcon(Icons.email),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  IntlPhoneField(
                    controller: mobile,
                    style: const TextStyle(fontFamily: "Schyler"),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(.05),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(.05)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Phone number",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
                    // color: Colors.greenAccent,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 15,
                          fixedSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180),
                          ),
                          backgroundColor: Colors.blueAccent),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(fname: fullname.text, img: image),
                            ));
                      },
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )),
          ),
        ],
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final pickedimage = await picker.pickImage(source: source);

    setState(() {
      image = File(pickedimage!.path);
    });
  }
}
