import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppViewRegistry.dart';
import 'DataStore.dart';
import 'InTimeRender.dart';
import 'PageDlg1.dart';
import 'AppViewRouter.dart';

class CenterView extends StatelessWidget implements InTimeRender {
  const CenterView({super.key});

  @override
  Widget build(BuildContext context) {
    DataStore.updateWidgetInfoList(context);
    print(
        "CenterView Build method invoked with included contents: ");
    //print(MediaQuery.of(context).size.height);
    List<Widget> includedWidgets = [];

    includedWidgets.add(GridView.count(
        //physics: AlwaysScrollableScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 1,
        children: <Widget>[
          emitGridBox1(context),
          emitGridBox2(context),
        ]));


    List<Widget>? viewsToBeRendered = AppViewRouter.deferViewsToBeRendered(includeViews: [CenterViewIncludes.PageDlg1.name,CenterViewIncludes.PageDlg2.name]);

    if(viewsToBeRendered != null && viewsToBeRendered.length > 0) {
      includedWidgets.addAll(viewsToBeRendered);
    }

    return Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(children: includedWidgets));
  }

  emitGridBox1(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(8),
      color: Colors.teal[200],
      child: SizedBox(
          height: 200,
          width: 200,
          child: Center(
              child: GridView.count(
            padding: const EdgeInsets.all(5),
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 1,
            children: [
              Text("Grid Box 1"),
              ElevatedButton(
                  onPressed: () => {
                        AppViewRouter.pageAction(
                            context: context,
                            viewName: "PageDlg1",
                            viewAction: ViewAction.open)
                      },
                  child: Text("Open Page 1"))
            ],
          ))),
    );
  }

  emitGridBox2(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(8),
      color: Colors.lightBlueAccent[200],
      child: SizedBox(
          height: 200,
          width: 200,
          child: Center(
              child: GridView.count(
            padding: const EdgeInsets.all(5),
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 1,
            children: [
              Text("Grid Box 2"),
              ElevatedButton(
                  onPressed: () => {
                        AppViewRouter.pageAction(
                            context: context,
                            viewName: "PageDlg2",
                            viewAction: ViewAction.open)
                      },
                  child: Text("Open Page 2"))
            ],
          ))),
    );
  }

  @override
  void inTimeRender() {
    // TODO: implement inTimeRender
    //List<Widget>? viewsToBeRendered = PageRouter.addViewsToBeRendered(includeViews: ["page1","page2"]);
  }
}


enum CenterViewIncludes {
  PageDlg1, PageDlg2
}