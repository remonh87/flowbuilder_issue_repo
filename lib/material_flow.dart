import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppPages(MaterialNavigationState state, List<Page> pages) {
  switch (state) {
    case MaterialNavigationState.page1:
      return [_Page1.page()];
    case MaterialNavigationState.page2:
      return [_Page2.page()];
  }
}

class MaterialTransitionFlow extends StatelessWidget {
  const MaterialTransitionFlow({Key? key}) : super(key: key);

  static Route<MaterialNavigationState> route() => MaterialPageRoute(
        builder: (_) => MaterialTransitionFlow(),
      );

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<MaterialNavigationState>(
      observers: [
        HeroController(),
      ],
      onGeneratePages: onGenerateAppPages,
      state: MaterialNavigationState.page1,
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({Key? key}) : super(key: key);

  static MaterialPage<void> page() =>
      const MaterialPage<void>(name: 'page1', child: _Page1());

  @override
  Widget build(BuildContext context) {
    return _AppScaffold(
      body: Center(
        child: Text('page1'),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({Key? key}) : super(key: key);

  static MaterialPage<void> page() =>
      const MaterialPage<void>(name: 'page2', child: _Page2());

  @override
  Widget build(BuildContext context) {
    return _AppScaffold(
      body: Center(
        child: Text('page2'),
      ),
    );
  }
}

enum MaterialNavigationState { page1, page2 }

class _AppScaffold extends StatelessWidget {
  const _AppScaffold({required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        fixedColor: Colors.white,
        onTap: (index) {
          if (index == 1) {
            context
                .flow<MaterialNavigationState>()
                .update((_) => MaterialNavigationState.page2);
          } else {
            context
                .flow<MaterialNavigationState>()
                .update((_) => MaterialNavigationState.page1);
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Page1'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Page2'),
        ],
      ),
    );
  }

  final Widget body;
}
