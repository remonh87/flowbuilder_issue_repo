import 'package:custom_transition_repo/custom_flow_push.dart';
import 'package:custom_transition_repo/material_flow.dart';
import 'package:flutter/material.dart';

import 'custom_flow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: SafeArea(
        child: Center(
          child: Builder(
            builder: (context)=> Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      Navigator.push(context, CustomTransitionFlow.route()),
                  child: Text('Customflow (not working)'),
                ),
                 ElevatedButton(
                  onPressed: () =>
                      Navigator.push(context, MaterialTransitionFlow.route()),
                  child: Text('Material flow (working)'),
                ),
                 ElevatedButton(
                  onPressed: () =>
                      Navigator.push(context, CustomTransitionFlowPush.route()),
                  child: Text('Custom flow push page2 (working)'),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
