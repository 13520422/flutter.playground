import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';
import 'package:playground/playground/widget/properties.dart';
import 'package:playground/playground/widget/viewer.dart';
import 'package:split_view/split_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Component> listComponent = [];

  List<double?> weights = [0.7, 0.3];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SplitView(
        viewMode: SplitViewMode.Horizontal,
        indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
        activeIndicator: const SplitIndicator(
          viewMode: SplitViewMode.Horizontal,
          isActive: true,
        ),
        controller: SplitViewController(weights: weights),
        onWeightChanged: (w) {
          weights = w.toList();
        },
        children: [
          SingleChildScrollView(
            child: Viewer(
              listComponent: listComponent,
            ),
          ),
          Properties(
            listComponent: listComponent,
            onUpdate: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
