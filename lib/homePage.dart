// ignore: file_names
import 'package:amc_2023/Screens/accounts.dart';
import 'package:amc_2023/Screens/notification.dart';
import 'package:amc_2023/Screens/promoanddiscount.dart';
import 'package:amc_2023/providers/card_widgets_provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/Material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class HomePage extends StatefulWidget {
  final String fname;
  final File? img;

  const HomePage({super.key, required this.fname, this.img});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var ics = [
    const Icon(
      EneftyIcons.electricity_bold,
      color: Colors.yellow,
    ),
    const Icon(
      EneftyIcons.wifi_bold,
      color: Colors.lightBlue,
    ),
    const Icon(
      EneftyIcons.drop_bold,
      color: Colors.red,
    ),
    const Icon(
      EneftyIcons.hospital_bold,
      color: Colors.green,
    ),
    const Icon(
      EneftyIcons.wallet_2_bold,
      color: Colors.orange,
    ),
    const Icon(
      EneftyIcons.discount_circle_bold,
      color: Colors.pink,
    ),
    const Icon(
      EneftyIcons.shopping_bag_bold,
      color: Colors.greenAccent,
    ),
    const Icon(
      EneftyIcons.mobile_bold,
      color: Colors.purple,
    ),
    const Icon(
      EneftyIcons.health_bold,
      color: Colors.indigoAccent,
    ),
    const Icon(
      EneftyIcons.game_bold,
      color: Colors.brown,
    ),
    const Icon(
      EneftyIcons.chart_4_bold,
      color: Colors.amber,
    ),
    const Icon(
      EneftyIcons.video_bold,
      color: Colors.lime,
    ),
  ];

  var icnames = [
    "electricity",
    "internet",
    "water",
    "insurance",
    "e-wallet",
    "deals",
    "shopping",
    "recharge",
    "health",
    "games",
    "invest",
  ];
  bool _isVisible = false; // Track visibility state of balance

  // Toggle visibility of balance
  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardWidgets =
        Provider.of<CardWidgetsProvider>(context).cardWidgets;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              label: "Home", icon: Icon(EneftyIcons.home_2_bold)),
          const BottomNavigationBarItem(
              label: "Statastics", icon: Icon(EneftyIcons.chart_2_bold)),
          BottomNavigationBarItem(
              label: "Scan&Pay",
              icon: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(180)),
                child: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(
                      EneftyIcons.scan_barcode_bold,
                      color: Colors.white,
                    )),
              )),
          const BottomNavigationBarItem(
              label: "My cards", icon: Icon(EneftyIcons.card_bold)),
          const BottomNavigationBarItem(
              label: "Profile", icon: Icon(EneftyIcons.profile_2user_bold)),
        ],
        onTap: (value) {
          if (value == 3) {
            // If "My cards" is tapped
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => accounts()));
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 25),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: widget.img != null
                        ? FileImage(widget.img!)
                        : const AssetImage("asset/images/noprofile.png")
                            as ImageProvider,
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.black.withOpacity(.5)),
                      ),
                      Text(widget.fname,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 23, color: Colors.black)),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PromoAndDiscount(),
                          )),
                      child: const Icon(EneftyIcons.discount_circle_outline)),
                  const SizedBox(width: 10),
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationClass(),
                          )),
                      child: const Icon(EneftyIcons.notification_outline)),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Consumer<CardWidgetsProvider>(
              builder: (context, cardProvider, _) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width *
                      0.9, // Adjust height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cardProvider.cardWidgets.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width * .93,
                            child: cardProvider.cardWidgets[index]),
                      );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Services",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See all",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.blueAccent, fontSize: 15),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: icnames.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 1, 32, 72)
                                    .withOpacity(.1),
                            radius: 30,
                            child: ics[index]),
                        const SizedBox(height: 8),
                        Text(
                          icnames[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// int i;
// i++;
// setstate({
//   i++;
// });
// i++;
