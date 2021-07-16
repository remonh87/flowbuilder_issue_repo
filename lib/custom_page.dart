import 'package:flutter/widgets.dart';

class CustomPage<T> extends Page<T> {
  const CustomPage({required this.child, String? name, LocalKey? key})
      : super(key: key, name: name);

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => PageRouteBuilder(
        settings: this,
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) => child,
      );
}