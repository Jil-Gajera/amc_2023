import 'package:amc_2023/Screens/accounts.dart';
import 'package:amc_2023/providers/card_widgets_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

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
  bool _isVisible = false; // Track visibility state of balance

  // Toggle visibility of balance
  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  final List<Widget> cardWidgets = [];
  final List<BankInfo> bankInfoList = [
    BankInfo('Allahabad Bank', 'asset/images/allahabad.png'),
    BankInfo('Axis Bank', 'asset/images/axis.png'),
    BankInfo('Bandhan Bank', 'asset/images/bandhanbank.png'),
    BankInfo('Bank of Baroda', 'asset/images/bob.png'),
    BankInfo('Canara Bank', 'asset/images/canara.png'),
    BankInfo('Centrall Bank', 'asset/images/centralbank.png'),
    BankInfo('citi Bank', 'asset/images/citibank.png'),
    BankInfo('dbs Bank', 'asset/images/dbs.png'),
    BankInfo('Hdfc Bank', 'asset/images/hdfc.png'),
    BankInfo('ICICI Bank', 'asset/images/icici.png'),
    BankInfo('IDBI Bank', 'asset/images/idbi.png'),
    BankInfo('IDFC First Bank', 'asset/images/idfc.png'),
    BankInfo('Indian Bank', 'asset/images/indian.png'),
    BankInfo('Indusind Bank', 'asset/images/indusind.png'),
    BankInfo('Kotak Bank', 'asset/images/kotak.png'),
    BankInfo('Punjab National Bank', 'asset/images/pnb.png'),
    BankInfo('Rbl Bank', 'asset/images/rbl.png'),
    BankInfo('Sbi Bank', 'asset/images/sbi.png'),
    BankInfo('Syndicate Bank', 'asset/images/syndicate.png'),
    BankInfo('Union Bank', 'asset/images/unionbank.png'),
    BankInfo('United Bank', 'asset/images/unitedbank.png'),
    BankInfo('Yes Bank', 'asset/images/yes bank.png'),

    // Add more bank names and logos as needed
  ];

  BankInfo? _selectedBank;
  var acnumber = TextEditingController();
  var namec = TextEditingController();
  var ifsc = TextEditingController();

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
                child: SingleChildScrollView(
                  child: Column(children: [
                    TextFormField(
                      maxLength: 14,
                      controller: namec,
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
                        hintText: "Name as per bank",
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.black.withOpacity(.05)),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.black,
                      child: Center(
                        child: DropdownButton<BankInfo>(
                          isExpanded: true,
                          hint: Text('Select your bank'),
                          value: _selectedBank,
                          onChanged: (BankInfo? newValue) {
                            setState(() {
                              _selectedBank = newValue;
                            });
                          },
                          items: bankInfoList.map((BankInfo bank) {
                            return DropdownMenuItem<BankInfo>(
                              value: bank,
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    bank.logoAsset,
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(bank.name),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextFormField(
                      maxLength: 14,
                      controller: acnumber,
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
                        hintText: "Account number",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .001,
                    ),
                    TextFormField(
                      controller: ifsc,
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
                        hintText: "IFSC code",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 30),
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
                          if (_selectedBank != null) {
                            Provider.of<CardWidgetsProvider>(context,
                                    listen: false)
                                .addToCardWidgets(
                                  Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15,
                              ),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Container(
                                  height: 300,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      //  color: Colors.blue,
                                      borderRadius: BorderRadius.circular(25),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "asset/images/bg2.jpg"),
                                          opacity: .9,
                                          fit: BoxFit.fill)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 15, right: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  namec.text,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 22),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "A/C number",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                ),
                                                Text(
                                                  acnumber.text,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 0,
                                              //color: Colors.white,
                                            ),
                                            Container(
                                                //  color: Colors.black,
                                                height: 100,
                                                width: 140,
                                                child: Image.asset(
                                                  _selectedBank != null
                                                      ? _selectedBank!.logoAsset
                                                      : '',
                                                  fit: BoxFit.fill,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "your balance",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                        ),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: toggleVisibility,
                                              child: Icon(
                                                _isVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Visibility(
                                              visible: _isVisible,
                                              child: const Text(
                                                "\23000₹",
                                                style: TextStyle(
                                                  fontSize: 35,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: !_isVisible,
                                              child: const Text(
                                                "\XXXXX₹",
                                                style: TextStyle(
                                                  fontSize: 35,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Ifsc code:",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 13),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  ifsc.text,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          _selectedBank != null
                                              ? _selectedBank!.name
                                              : '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                            

                            Navigator.pop(context);
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Add",
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
              ),
            )),
          ),
        ],
      ),
    );
  }
}
