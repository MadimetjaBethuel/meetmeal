import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:meetmeal/widgets/buttonwidget.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String cardHolderName = '';
  String cvvNumber = '';
  String expiryDate = '';
  bool showBackView = false;

  void onCreditCardModel(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      cardHolderName = creditCardModel.cardHolderName;
      expiryDate = creditCardModel.expiryDate;
      cvvNumber = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              height: 250,
              cardHolderName: cardHolderName,
              cvvCode: cvvNumber,
              showBackView: showBackView,
              cardBgColor: Colors.blue,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              animationDuration: Duration(milliseconds: 1200),
            ),
            SingleChildScrollView(
              child: CreditCardForm(
                onCreditCardModelChange: onCreditCardModel,
                cursorColor: Colors.blue,
                themeColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            RoundedButton(
              text: "Make Payment",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
