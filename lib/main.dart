import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:meetmeal/amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'pages/Profile/profile.dart';
import 'pages/Registration/Iam.dart';
import 'pages/Registration/Register.dart';
import 'pages/Registration/foodpreferencepage.dart';
import 'pages/login/login.dart';
import 'pages/payment/payment.dart';
import 'pages/rootpage/rootpage.dart';
import 'pages/singlepages/accept&deny.dart';
import 'pages/singlepages/sendinvitation.dart';
import 'widgets/loading_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _amplifyConfigured ? Register() : LoadingView(),
    );
  }

  void _configureAmplify() async {
    // Add the following lines to your app initialization to add the DataStore plugin

    try {
      await Future.wait([
        Amplify.addPlugin(
            AmplifyDataStore(modelProvider: ModelProvider.instance)),
        Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(AmplifyAuthCognito())
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }
}
