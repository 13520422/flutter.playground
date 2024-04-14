import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';
import 'package:playground/playground/widget/import_view.dart';
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

  int mode = 1;
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
          mode == 0
              ? ViewCode(
                  key: UniqueKey(),
                  listComponet: listComponent,
                  onViewDesign: () {
                    setState(() {
                      mode = 1;
                    });
                  },
                  innerSetState: (f) {
                    innerSetStateViewCode = f;
                  },
                  onViewImport: () {
                    setState(() {
                      mode = 2;
                    });
                  },
                )
              : mode == 1
                  ? Viewer(
                      //mode==1
                      listComponent: listComponent,
                      onViewCode: () {
                        setState(() {
                          mode = 0;
                        });
                      },
                      innerSetState: (f) {
                        innerSetStateViewDesign = f;
                      },
                    )
                  : ImportComponent(
                      //mode==2
                      onSubmit: (List<Component> cpts) {
                        setState(() {
                          mode = 1;
                          listComponent.addAll(cpts);
                        });
                      },
                      onCancel: () {
                        setState(() {
                          mode = 1;
                        });
                      },
                    ),
          Properties(
            listComponent: listComponent,
            onUpdate: () {
              // print("update widget");
              // setState(() {});
              if (mode == 0) {
                innerSetStateViewCode?.call(() {});
              } else if (mode == 1) {
                innerSetStateViewDesign?.call(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
