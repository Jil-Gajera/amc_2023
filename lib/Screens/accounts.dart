import 'package:amc_2023/Screens/addaccount.dart';
import 'package:amc_2023/providers/card_widgets_provider.dart';
import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:provider/provider.dart';

class accounts extends StatefulWidget {
  const accounts({Key? key}) : super(key: key);

  @override
  State<accounts> createState() => _accountsState();
}

class _accountsState extends State<accounts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardWidgets = Provider.of<CardWidgetsProvider>(context).cardWidgets;
    return Scaffold(
      appBar: AppBar(
        title: Text("My accounts"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 580,
            width: MediaQuery.of(context).size.width,
            //color: Colors.black,
            child: ListWheelScrollView(
              itemExtent: 250,
              diameterRatio: 2,
              children: List.generate(cardWidgets.length, (index) {
                return cardWidgets[index];
              }),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => addaccount(),
                    ));
              },
              child: const Center(
                child: Text(
                  "Add New Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
