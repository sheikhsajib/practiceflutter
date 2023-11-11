import 'package:flutter/material.dart';
import 'package:practiceflutter/screens/JCProfiles.dart';
import 'package:practiceflutter/screens/home_pages/home.dart';
import 'package:practiceflutter/splash.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case HomePage.route:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case JCProfile.route:
        return createRoute(child: const JCProfile());
      // case SortAndFilter.route:
      //   return createRoute(
      //       child: const SortAndFilter(),
      //       slidePosition: PageTransitionMode.bottomToTop);
      // case FareReview.route:
      //   return MaterialPageRoute(builder: (_) => FareReview());
      // case ReviewCheckOutScreen.route:
      //   return MaterialPageRoute(builder: (_) => const ReviewCheckOutScreen());
      // case PriceSummary.route:
      //   return createRoute(
      //       child: const PriceSummary(),
      //       slidePosition: PageTransitionMode.bottomToTop);

      // case AirportListScreen.route:
      //   if (args is Map<String, dynamic>) {
      //     return createRoute(
      //         child: AirportListScreen(
      //           title: args['title'],
      //         ),
      //         slidePosition: PageTransitionMode.fade);
      //   }
      //   return null;
      // case PickDateScreen.route:
      //   return createRoute(
      //       child: PickDateScreen(
      //         selectedDate: args as DateModel,
      //       ),
      //       slidePosition: PageTransitionMode.fade);

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found!'),
            ),
          ),
        );
    }
  }

  static Route createRoute({
    required Widget child,
    PageTransitionMode slidePosition = PageTransitionMode.rightToLeft,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (slidePosition == PageTransitionMode.fade) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        } else {
          Offset beginOffset = Offset.zero, endOffset = Offset.zero;
          if (slidePosition == PageTransitionMode.leftToRight) {
            beginOffset = const Offset(-1.0, 0.0);
          } else if (slidePosition == PageTransitionMode.rightToLeft) {
            beginOffset = const Offset(1.0, 0.0);
          } else if (slidePosition == PageTransitionMode.topToBottom) {
            beginOffset = const Offset(0.0, -1.0);
          } else if (slidePosition == PageTransitionMode.bottomToTop) {
            beginOffset = const Offset(0.0, 1.0);
          }
          final tween = Tween(begin: beginOffset, end: endOffset)
              .chain(CurveTween(curve: Curves.ease));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

enum PageTransitionMode {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
  fade,
}
