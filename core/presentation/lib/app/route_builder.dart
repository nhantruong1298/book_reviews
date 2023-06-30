import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/book_detail/cubit/book_detail_cubit.dart';
import 'package:presentation/feature/book_detail/views/book_detail_screen.dart';
import 'package:presentation/feature/book_event/cubit/book_event_cubit.dart';
import 'package:presentation/feature/book_event/views/book_event_screen.dart';
import 'package:presentation/feature/book_event_detail/views/book_event_detail_screen.dart';
import 'package:presentation/feature/book_review/cubit/book_review_cubit.dart';
import 'package:presentation/feature/book_review/views/book_review_screen.dart';
import 'package:presentation/feature/book_search/cubit/book_search_cubit.dart';
import 'package:presentation/feature/book_search/views/book_search_screen.dart';
import 'package:presentation/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:presentation/feature/dashboard/views/dashboard_screen.dart';
import 'package:presentation/feature/home/cubit/home_cubit.dart';
import 'package:presentation/feature/home/views/home_screen.dart';
import 'package:presentation/feature/sign_in/cubit/sign_in_cubit.dart';
import 'package:presentation/feature/sign_in/view/sign_in_screen.dart';
import 'package:presentation/feature/sign_up/cubit/sign_up_cubit.dart';
import 'package:presentation/feature/sign_up/sign_up_repository.dart';
import 'package:presentation/feature/sign_up/views/sign_up_screen.dart';
import 'package:presentation/feature/sign_up_success/cubit/sign_up_success_cubit.dart';
import 'package:presentation/feature/sign_up_success/views/sign_up_success_screen.dart';
import 'package:presentation/feature/splash/views/splash_screen.dart';
part 'route_builder.g.dart';

class RouteBuilder {
  static GoRouter get router {
    assert(
      _router != null,
      'Router is not initialized. Please call initializeRouter() first.',
    );
    return _router!;
  }

  static GoRouter? _router;

  static void init() {
    if (_router != null) return;
    _router = GoRouter(routes: $appRoutes);
  }
}

//********************** Settings code gen here **********************

//********************** SPLASH ROUTE **********************
@TypedGoRoute<SplashRoute>(
  path: '/',
)
class SplashRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

//********************** SIGN IN ROUTE **********************

@TypedGoRoute<SignInRoute>(
  path: '/sign-in',
)
class SignInRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: const SignInScreen(),
    );
  }
}

//********************** SIGN UP ROUTE **********************
@TypedGoRoute<SignUpRoute>(
    path: '/sign-up',
    routes: <TypedGoRoute<GoRouteData>>[
      TypedGoRoute<SignUpSuccessRoute>(
        path: 'sign-up-success/:userName',
      )
    ])
class SignUpRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RepositoryProvider(
        create: (_) => SignUpRepository(),
        child: BlocProvider(
          create: (context) => SignUpCubit(
            context.read<SignUpRepository>(),
            context.read<AuthenticationCubit>(),
          ),
          child: const SignUpScreen(),
        ));
  }
}

class SignUpSuccessRoute extends GoRouteData {
  final String userName;
  SignUpSuccessRoute(this.userName);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) =>
          SignUpSuccessCubit(context.read<AuthenticationCubit>()),
      child: SignUpSuccessScreen(userName: userName),
    );
  }
}

//********************** DASHBOARD ROUTE **********************
@TypedGoRoute<DashboardRoute>(
    path: '/dashboard',
    routes: <TypedGoRoute<GoRouteData>>[
      TypedGoRoute<BookDetailRoute>(
          path: 'book-detail/:bookID',
          routes: <TypedGoRoute<GoRouteData>>[
            TypedGoRoute<BookReviewRoute>(
              path: 'book-review',
            ),
          ]),
      TypedGoRoute<BookSearchRoute>(
        path: 'book-search',
      ),
      TypedGoRoute<BookEventDetailRoute>(
        path: 'book-event-detail/:bookEventID',
      ),
    ])
class DashboardRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: const DashboardScreen(),
    );
  }
}

//********************** HOME ROUTE **********************
class HomeRoute {
  static Widget build() {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeScreen(),
    );
  }
}

//********************** BOOK DETAIL ROUTE **********************
class BookDetailRoute extends GoRouteData {
  final String bookID;
  BookDetailRoute(this.bookID);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => BookDetailCubit(bookID),
      child: BookDetailScreen(
        bookID: bookID,
      ),
    );
  }
}

//********************** BOOK SEARCH ROUTE **********************
class BookSearchRoute extends GoRouteData {
  BookSearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => BookSearchCubit(),
      child: const BookSearchScreen(),
    );
  }
}

//********************** BOOK EVENT ROUTE **********************
class BookEventRoute {
  static Widget build() {
    return BlocProvider(
      create: (context) => BookEventCubit(),
      child: const BookEventScreen(),
    );
  }
}

//********************** BOOK EVENT DETAIL ROUTE **********************
class BookEventDetailRoute extends GoRouteData {
  final String bookEventID;
  BookEventDetailRoute(this.bookEventID);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BookEventDetailScreen(
      bookEventID: bookEventID,
    );
  }
}

//********************** BOOK EVENT ROUTE **********************
class BookReviewRoute extends GoRouteData {
  final String bookID;
  BookReviewRoute(this.bookID);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => BookReviewCubit(),
      child: BookReviewScreen(
        bookID: bookID,
      ),
    );
  }
}
