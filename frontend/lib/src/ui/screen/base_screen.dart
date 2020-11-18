import 'package:flutter/material.dart';
import 'package:frontend/src/helpers/log.dart';

abstract class BaseScreenState<T extends StatefulWidget> extends State<T> {
  @protected
  Color get backgroundColor => Theme.of(context).backgroundColor;

  @override
  void initState() {
    super.initState();
    Log.debug(
        "ScreenLifecycle: ${this.widget.toStringShort()}: initState ${this.toString()}");
  }

  @override
  void dispose() {
    super.dispose();
    Log.debug(
        "ScreenLifecycle: ${this.widget.toStringShort()}: dispose ${this.toString()}");
  }

  @override
  void reassemble() {
    super.reassemble();
    Log.debug(
        "ScreenLifecycle: ${this.widget.toStringShort()}: reassemble ${this.toString()}");
  }

  @override
  void deactivate() {
    super.deactivate();
    Log.debug(
        "ScreenLifecycle: ${this.widget.toStringShort()}: deactivate ${this.toString()}");
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    Log.debug(
        "ScreenLifecycle: ${this.widget.toStringShort()}: didUpdateWidget ${this.toString()}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Log.debug(
        "ScreenLifecycle: ${this.widget.toStringShort()}: didChangeDependencies ${this.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    Log.debug(
        "ScreenLifecycle: ${this.widget.toStringShort()}: build ${this.toString()}");
    return Scaffold(
      backgroundColor: this.backgroundColor,
      appBar: this.buildAppBar(context),
      body: this.buildScreen(context),
      bottomNavigationBar: this.buildBottomNavigationBar(context),
      floatingActionButton: this.buildFloatingActionButton(context),
    );
  }

  Widget buildScreen(BuildContext context);

  ///
  /// Implement this to build an [AppBar] for all screens
  /// Override this method in each screen that needs a specific one
  ///
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return null;
  }

  ///
  /// Implement this to build a [BottomNavigationBar] for all screens
  /// Override this method in each screen that needs a specific one
  ///
  Widget buildBottomNavigationBar(BuildContext context) {
    return null;
  }

  ///
  /// Implement this to build a [FloatingActionButton] for all screens
  /// Override this method in each screen that needs a specific one
  ///
  Widget buildFloatingActionButton(BuildContext context) {
    return null;
  }

  ///
  /// Default back navigation behavior
  ///
  void goBack() {
    Navigator.pop(context);
  }

  ///
  /// Sends a log in event
  ///
  void doLogin(String login, String password) {
    //BlocProvider.of<AuthenticationBloc>(context)
    //   .add(LoginEvent(login, password));
  }

  ///
  /// Sends a logout event
  ///
  void doLogout() {
    //BlocProvider.of<AuthenticationBloc>(context).add(LogoutEvent());
  }

  ///
  /// Logout event has completed
  /// Clear all navigation history and push login page
  /// Override this method to implement how the app should behave
  /// once a user has been logged out
  ///
  void onLoggedOut() {
    //Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (r) => false);
  }

  ///
  /// Log in event has completed
  /// Override this method to implement how the app should behave
  /// once a user has been logged in
  ///
  void onLoggedIn() {}
}
