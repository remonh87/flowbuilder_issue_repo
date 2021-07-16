import 'package:custom_transition_repo/custom_page.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppPages(CustomPushNavigationState state, List<Page> pages) {
  switch (state) {
    case CustomPushNavigationState.page1:
      return [_Page1.page()];
    case CustomPushNavigationState.page2:
      return [_Page1.page(), _Page2.page()];
  }
}

class CustomTransitionFlowPush extends StatelessWidget {
  const CustomTransitionFlowPush({Key? key}) : super(key: key);

  static Route<CustomPushNavigationState> route() => MaterialPageRoute(
        builder: (_) => CustomTransitionFlowPush(),
      );

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<CustomPushNavigationState>(
      observers: [
        HeroController(),
      ],
      onGeneratePages: onGenerateAppPages,
      state: CustomPushNavigationState.page1,
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({Key? key}) : super(key: key);

  static CustomPage<void> page() =>
      const CustomPage<void>(name: 'page1', child: _Page1());

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

  static CustomPage<void> page() =>
      const CustomPage<void>(name: 'page2', child: _Page2());

  @override
  Widget build(BuildContext context) {
    return _AppScaffold(
      body: Center(
        child: Text('page2'),
      ),
    );
  }
}

enum CustomPushNavigationState { page1, page2 }

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
                .flow<CustomPushNavigationState>()
                .update((_) => CustomPushNavigationState.page2);
          } else {
            context
                .flow<CustomPushNavigationState>()
                .update((_) => CustomPushNavigationState.page1);
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
