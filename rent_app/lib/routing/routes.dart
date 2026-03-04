import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/"
    ),
    GoRoute(
      path: "/listing/register"
    ),
    GoRoute(
      path: "/exchange-rate/register"
    ),
  ]
);