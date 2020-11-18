import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/core/authentication/authentication_manager.dart';
import 'package:frontend/src/helpers/log.dart';
import 'package:frontend/src/models/route_config.dart';
import 'package:frontend/src/resource/login_repository.dart';
import 'package:frontend/src/ui/screen/home_screen.dart';
import 'package:frontend/src/ui/screen/login_screen.dart';

import 'bloc/authentication/authentication_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(LoginRepository()),
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
            builder: (context) => LoginScreen(targetRouteName: settings.name));
      }
    } else {
      return _buildAuthorizedRoute(settings);
    }
  }

  Route<dynamic> _buildAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (context) =>
                HomeScreen(title: 'Flutter Demo Starter App'));
      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(targetRouteName: AppRoutes.home));
      default:
        return MaterialPageRoute(
            builder: (context) =>
                Center(child: Text('Unknown route named ${settings.name}')));
    }
  }
}
