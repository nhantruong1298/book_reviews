// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_builder.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $signUpRoute,
      $dashboardRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $signUpRoute => GoRouteData.$route(
      path: '/sign-up',
      factory: $SignUpRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'sign-up-success/:userName',
          factory: $SignUpSuccessRouteExtension._fromState,
        ),
      ],
    );

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => SignUpRoute();

  String get location => GoRouteData.$location(
        '/sign-up',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SignUpSuccessRouteExtension on SignUpSuccessRoute {
  static SignUpSuccessRoute _fromState(GoRouterState state) =>
      SignUpSuccessRoute(
        state.params['userName']!,
      );

  String get location => GoRouteData.$location(
        '/sign-up/sign-up-success/${Uri.encodeComponent(userName)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $dashboardRoute => GoRouteData.$route(
      path: '/dashboard',
      factory: $DashboardRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'book-detail/:bookID',
          factory: $BookDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'book-search',
          factory: $BookSearchRouteExtension._fromState,
        ),
      ],
    );

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) => DashboardRoute();

  String get location => GoRouteData.$location(
        '/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BookDetailRouteExtension on BookDetailRoute {
  static BookDetailRoute _fromState(GoRouterState state) => BookDetailRoute(
        state.params['bookID']!,
      );

  String get location => GoRouteData.$location(
        '/dashboard/book-detail/${Uri.encodeComponent(bookID)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BookSearchRouteExtension on BookSearchRoute {
  static BookSearchRoute _fromState(GoRouterState state) => BookSearchRoute();

  String get location => GoRouteData.$location(
        '/dashboard/book-search',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
