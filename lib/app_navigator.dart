import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/Authentication/auth_cubit.dart';
import 'package:meetmeal/backend/Authentication/auth_navigator.dart';
import 'package:meetmeal/pages/Registration/Iam.dart';
import 'package:meetmeal/widgets/loading_view.dart';

import 'backend/Authentication/session/session_cubit.dart';
import 'backend/Authentication/session/session_state.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Show loading screen

          if (state is UnknownSessionState)
            MaterialPage(
              child: LoadingView(),
            ),

          //show auth flow

          if (state is Unauthenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) =>
                    AuthCubit(sessionCubit: context.read<SessionCubit>()),
                child: AuthNavigator(),
              ),
            ),

          //show session flow

          if (state is Authenticated) MaterialPage(child: Iam()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
