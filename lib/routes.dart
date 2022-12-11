import 'package:flutter/material.dart';
import 'package:sokyo/views/home/buddy_view.dart';
import 'package:sokyo/views/home/groups_view.dart';
import 'package:sokyo/views/home/home.dart';

class RouteGenerator {
  static const String homePage = '/home';
  static const String groupsPage = '/groups';
  static const String coursesPage = '/courses';
  static const String profilePage = '/profile';
  static const String buddyPage = '/buddy';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case groupsPage:
        return MaterialPageRoute(builder: (_) => const GroupsView());
      case coursesPage:
        return MaterialPageRoute(builder: (_) => const CoursesView());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfileView());

      case buddyPage:
        return MaterialPageRoute(builder: (_) => const BuddyView());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('404 Route Not Found'),
                  ),
                ));
    }
  }
}
