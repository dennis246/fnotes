import 'package:flutter/material.dart';
import 'package:overlaytest/AppViewRouter.dart';
import 'package:overlaytest/CenterView.dart';

import 'AppViewRegistry.dart';

class PageDlg2 extends StatelessWidget {
  //bool visible = false;
  //PageDlg1({required visible});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.amber,
        child: GridView.count(
          crossAxisCount: 1,
          children: [
            Center(
                child: GridView.count(
              crossAxisCount: 1,
              children: [
                Text("Page 2 Dialog view : 304985"),
                ElevatedButton(
                    onPressed: () => {
                          AppViewRouter.pageAction(
                              context: context,
                              viewName: CenterViewIncludes.PageDlg2.name,
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
    children: [



    ]);
  }
}
