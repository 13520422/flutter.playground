import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';
import 'package:playground/playground/widget/properties.dart';
import 'package:playground/playground/widget/view_code.dart';
import 'package:playground/playground/widget/viewer.dart';
import 'package:split_view/split_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Component> listComponent = [];

  bool isViewCode = false;
  void Function(void Function())? innerSetStateViewCode;
  void Function(void Function())? innerSetStateViewDesign;

  List<double?> weights = [0.65, 0.35];

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
          isViewCode
              ? ViewCode(
                  key: UniqueKey(),
                  listComponet: listComponent,
                  onViewDesign: () {
                    setState(() {
                      isViewCode = !isViewCode;
                    });
                  },
                  innerSetState: (f) {
                    innerSetStateViewCode = f;
                  },
                )
              : Viewer(
                  listComponent: listComponent,
                  onViewCode: () {
                    setState(() {
                      isViewCode = !isViewCode;
                    });
                  },
                  innerSetState: (f) {
                    innerSetStateViewDesign = f;
                  },
                ),
          Properties(
            listComponent: listComponent,
            onUpdate: () {
              // print("update widget");
              // setState(() {});
              if (isViewCode) {
                innerSetStateViewCode?.call(() {});
              } else {
                innerSetStateViewDesign?.call(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
