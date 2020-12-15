import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/authentication/authentication_bloc.dart';
import 'package:frontend/src/bloc/authentication/authentication_event.dart';
import 'package:frontend/src/bloc/authentication/authentication_state.dart';
import 'package:frontend/src/ui/components/loading_overlay.dart';
import 'package:frontend/src/ui/screen/base_screen.dart';

class SplashScreen extends StatefulWidget {
  final String targetRouteName;

  SplashScreen({Key key, @required this.targetRouteName}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseScreenState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context)
        .add(LoadLocalAuthenticationManager());
  }

  @override
  Widget buildScreen(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLocalLoaded) {
          Navigator.pushReplacementNamed(context, widget.targetRouteName);
        }
      },
      child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: LoadingOverlay(),
      ),
    );
  }
}
