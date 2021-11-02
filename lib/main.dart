import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/amplifyconfiguration.dart';
import 'package:meetmeal/app_navigator.dart';
import 'package:meetmeal/backend/Authentication/auth_repsository.dart';
import 'package:meetmeal/backend/Authentication/data_repository.dart';
import 'package:meetmeal/backend/Authentication/session/session_cubit.dart';

import 'models/ModelProvider.dart';

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
      home: _amplifyConfigured
          ? MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => AuthRepository(),
                ),
                RepositoryProvider(
                  create: (context) => DataRepository(),
                ),
              ],
              child: BlocProvider(
                create: (context) => SessionCubit(
                  authRespository: context.read<AuthRepository>(),
                  dataRepository: context.read<DataRepository>(),
                ),
                child: AppNavigator(),
              ),
            )
          : LoadingView(),
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
