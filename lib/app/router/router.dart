import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_application/app/app.dart';
import 'package:flutter_application/di/di.dart';
import 'package:flutter_application/domain/repository/model/article.dart'; // Импортируем модель

final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  observers: [TalkerRouteObserver(talker)],
  initialLocation: '/home',
  navigatorKey: _rootNavigationKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'article/:id', // Параметр пути для получения ID вакансии
          pageBuilder: (context, state) {
            //final String id = state.params['id'] ?? ''; // Получаем ID из маршрута

            // Получаем объект Article из данных, переданных через state.extra
            final article = state.extra as Article?;

            return NoTransitionPage<void>(
              key: state.pageKey,
              child: DetailsScreen(article: article), // Передаем Article в DetailsScreen
            );
          },
        ),
      ],
    ),
  ],
);