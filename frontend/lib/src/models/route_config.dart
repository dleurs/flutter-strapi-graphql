class RouteConfig {
  final bool needsAuthentication;

  const RouteConfig(this.needsAuthentication);
}

class AppRoutes {
  static const String initial = '/';
  static const String home = '/home';
  static const String todo = '/home/todo';
  static const String login = '/login';
  static const String logout = '/logout';

  static final Map<String, RouteConfig> configs = {
    initial: RouteConfig(false),
    home: RouteConfig(true),
    todo: RouteConfig(true),
    login: RouteConfig(false),
    logout: RouteConfig(false)
  };

  static RouteConfig getConfig(String routeName) {
    if (configs.containsKey(routeName)) {
      return configs[routeName];
    }
    return RouteConfig(false);
  }
}
