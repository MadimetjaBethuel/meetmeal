import 'package:flutter/material.dart';
import 'package:meetmeal/data/card_json.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:meetmeal/pages/productpage/product_page.dart';

class CardSwiper extends StatefulWidget {
  _CardSwiperState createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> with TickerProviderStateMixin {
  CardController controller;
  List itemsTemp = [];
  int itemLength = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = FoodinfoList;
      itemLength = FoodinfoList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      child: TinderSwapCard(
        totalNum: itemLength,
        swipeDown: true,
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height * 0.75,
        minWidth: MediaQuery.of(context).size.width * 0.75,
        minHeight: MediaQuery.of(context).size.height * 0.6,
        cardBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, a, b) => ProductPage(
                    foodinfo: FoodinfoList[index],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(itemsTemp[index].img),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.25),
                              Colors.black.withOpacity(0),
                            ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Container(
                                  width: size.width * 0.60,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            itemsTemp[index].name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
        },
        cardController: controller = CardController(),
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
          if (align.x < 0) {
          } else if (align.x > 0) {}
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          if (index == (itemsTemp.length - 1)) {
            setState(() {
              itemLength = itemsTemp.length - 1;
            });
          }
        },
      ),
    );
  }
}
