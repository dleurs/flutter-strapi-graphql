import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/api/authentication_api_provider.dart';
import 'package:frontend/src/core/authentication/authentication_manager.dart';
import 'package:frontend/src/helpers/log.dart';
import 'package:frontend/src/models/route_config.dart';
import 'package:frontend/src/ui/screen/home_screen.dart';
import 'package:frontend/src/ui/screen/login_signup_screen.dart';
import 'package:frontend/src/ui/screen/splash_screen.dart';
import 'package:frontend/src/ui/screen/todo_screen.dart';

import 'bloc/authentication/authentication_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(AuthenticationApiProvider()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: _generateRoute,
        ));
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    RouteConfig config = AppRoutes.getConfig(settings.name);
    if (config.needsAuthentication) {
      if (AuthenticationManager.instance.isLoggedIn ?? false) {
        return _buildAuthorizedRoute(settings);
      } else {
        Log.debug('Login for route named: ${settings.name}');
        return MaterialPageRoute(
            builder: (context) =>
                LoginSignupScreen(targetRouteName: settings.name));
      }
    } else {
      return _buildAuthorizedRoute(settings);
    }
  }

  Route<dynamic> _buildAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(
            builder: (context) =>
                SplashScreen(targetRouteName: AppRoutes.home));
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoutes.todo:
        return MaterialPageRoute(builder: (context) => TodoScreen());
      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (context) =>
                LoginSignupScreen(targetRouteName: AppRoutes.home));
      default:
        return MaterialPageRoute(
            builder: (context) =>
                Center(child: Text('Unknown route named ${settings.name}')));
    }
  }
}
