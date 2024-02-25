import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class BankInfo {
  final String name;
  final String logoAsset;

  BankInfo(this.name, this.logoAsset);
}

class addaccount extends StatefulWidget {
  const addaccount({super.key});

  @override
  State<addaccount> createState() => _addaccountState();
}

class _addaccountState extends State<addaccount> {
  final List<BankInfo> bankInfoList = [
    BankInfo('Allahabad Bank', 'asset/images/banks/allahabad.png'),
    BankInfo('Axis Bank', 'asset/images/banks/axis.png'),
    BankInfo('Bandhan Bank', 'asset/images/banks/bandhanbank.png'),
    BankInfo('Bank of Baroda', 'asset/images/banks/bob.png'),
    BankInfo('Canara Bank', 'asset/images/banks/canara.png'),
    BankInfo('Centrall Bank', 'asset/images/banks/centralbank.png'),
    BankInfo('citi Bank', 'asset/images/banks/citibank.png'),
    BankInfo('dbs Bank', 'asset/images/banks/dbs.png'),
    BankInfo('Hdfc Bank', 'asset/images/banks/hdfc.png'),
    BankInfo('ICICI Bank', 'asset/images/banks/icici.png'),
    BankInfo('IDBI Bank', 'asset/images/banks/idbi.png'),
    BankInfo('IDFC First Bank', 'asset/images/banks/idfc.png'),
    BankInfo('Indian Bank', 'asset/images/banks/indian.png'),
    BankInfo('Indusind Bank', 'asset/images/banks/indusind.png'),
    BankInfo('Kotak Bank', 'asset/images/banks/kotak.png'),
    BankInfo('Punjab National Bank', 'asset/images/banks/pnb.png'),
    BankInfo('Rbl Bank', 'asset/images/banks/rbl.png'),
    BankInfo('Sbi Bank', 'asset/images/banks/sbi.png'),
    BankInfo('Syndicate Bank', 'asset/images/banks/syndicate.png'),
    BankInfo('Union Bank', 'asset/images/banks/unionbank.png'),
    BankInfo('United Bank', 'asset/images/banks/unitedbank.png'),
    BankInfo('Yes Bank', 'asset/images/banks/yes bank.png'),

    // Add more bank names and logos as needed
  ];

  BankInfo? selectedBank;
  var nickname = TextEditingController();
  var emailP = TextEditingController();
  var mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your account"),
      ),
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
                    "Add your Account details",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Form(
                child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
              child: Container(
                width: double.infinity,
                height: 420,
                color: Colors.white,
                child: Column(children: [
                  Center(
                    child: DropdownButton<BankInfo>(
                      hint: Text('Select Bank'),
                      value: selectedBank,
                      onChanged: (BankInfo? newValue) {
                        setState(() {
                          selectedBank = newValue;
                        });
                      },
                      items: bankInfoList
                          .map<DropdownMenuItem<BankInfo>>((BankInfo value) {
                        return DropdownMenuItem<BankInfo>(
                          value: value,
                          child: ListTile(
                            leading: Image.asset(
                              value.logoAsset,
                              width: 40,
                              height: 40,
                            ),
                            title: Text(value.name),
                          ),
                        );
                      }).toList(),
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
                      onPressed: () {},
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
}
