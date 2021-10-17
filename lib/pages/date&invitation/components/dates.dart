import 'package:flutter/material.dart';
import 'package:meetmeal/data/date_json.dart';
import 'package:meetmeal/pages/payment/payment.dart';

class Dates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          dates_json.length,
          (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a, b) => PaymentPage(),
                  ),
                );
              },
              child: Container(
                width: (size.width - 15 / 2),
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      width: (size.width - 15 / 2),
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              (dates_json[index]['img']),
                            ),
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
