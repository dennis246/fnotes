import 'package:flutter/material.dart';
import 'package:overlaytest/AppViewRouter.dart';

import 'AppViewRegistry.dart';
import 'CenterView.dart';
import 'InTimeRender.dart';

class PageDlg1 extends StatelessWidget {
  //bool visible = false;
  //PageDlg1({required visible});

  @override
  Widget build(BuildContext context) {
    print("Building PageDlg1");

    return Dialog(
        backgroundColor: Colors.amber,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: GridView.count(
          crossAxisCount: 1,
          children: [
            Center(
                child: GridView.count(
              crossAxisCount: 1,
              children: [
                Text("Page 1 Dialog view"),
                ElevatedButton(
                    onPressed: () => {
                          AppViewRouter.pageAction(
                              context: context,
                              viewName: CenterViewIncludes.PageDlg1.name,
                              viewAction: ViewAction.close)
                        },
                    child: Text("Close Dlg"))
              ],
            ))
          ],
        ));
  }

  topBar() {
    return Row(children: [
      SizedBox(
        height: 50,
        width: 50,
        child: TextButton(onPressed: () {}, child: Text("new")),
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: TextButton(onPressed: () {}, child: Text("save")),
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: TextButton(onPressed: () {}, child: Text("delete")),
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: TextButton(onPressed: () {}, child: Text("close")),
      )
    ]);
  }

  detailsPanel() {
    return GridView.count(
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 1,
        children: []);
  }

  @override
  void inTimeRender() {
    // TODO: implement inTimeRender




  }
}


