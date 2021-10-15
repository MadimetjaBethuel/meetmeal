import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:meetmeal/data/card_json.dart';
import 'package:meetmeal/widgets/buttonwidget.dart';

class AcceptDeny extends StatefulWidget {
  final FoodInfo foodinfo;

  AcceptDeny({this.foodinfo});
  @override
  _AcceptDenyState createState() => _AcceptDenyState();
}

class _AcceptDenyState extends State<AcceptDeny> {
  ScrollController controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 18,
          ),
          child: BackButton(
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "",
              height: 400,
              width: 500,
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\R',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "600",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Ionicons.ios_star_outline,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "2.6",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Ionicons.ios_time,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "20 - 30 min",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Ionicons.md_locate,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "15 min",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Food Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "A hamburger (or burger for short) is a food, typically considered a sandwich, consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled.",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedButton(
                        text: "Accept",
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RoundedButton(
                        text: "Decline",
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
