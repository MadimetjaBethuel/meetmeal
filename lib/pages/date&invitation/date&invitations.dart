import 'package:flutter/material.dart';
import 'package:meetmeal/pages/date&invitation/components/invitation.dart';

import 'components/dates.dart';

class DateInvitation extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 18,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 50,
              // constraints: BoxConstraints(maxHeight: 500),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  indicatorColor: Colors.blue,
                  isScrollable: false,
                  tabs: [
                    Text(
                      "Likes",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Bucket List",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Dates(),
                  Invitations(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
