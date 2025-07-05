import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppViewRegistry.dart';
import 'DataStore.dart';
import 'PageDlg1.dart';
import 'PageDlg2.dart';

class AppViewRouter {
  //static bool page1Visible = false;
  static List<AppViewRegistry> appViewRegistryList = [];

  static registerToAppViewRegistry() {
    // mod rights controlled later
    appViewRegistryList.add(const AppViewRegistry(
        key: "CenterView",
        value: null,
        action: ViewAction.unbound,
        renderedYN: 'N'));
    appViewRegistryList.add(AppViewRegistry(
        key: "PageDlg1",
        value: PageDlg1(),
        action: ViewAction.unbound,
        renderedYN: 'N'));
    appViewRegistryList.add(AppViewRegistry(
        key: "PageDlg2",
        value: PageDlg2(),
        action: ViewAction.unbound,
        renderedYN: 'N'));
  }

  static pageAction(
      {required BuildContext context,
      required String viewName,
      required ViewAction viewAction,
      List<String>? updateList}) {
    print("${context.widget} to be refreshed");

    /*bool isPartOfRegistry = false;
    Widget? crWidget;*/
    for (var registryEntry in appViewRegistryList) {
      if (viewName == registryEntry.key) {
        //isPartOfRegistry = true;
        var crWidget = registryEntry.value;

        if (viewAction.name == "open") {
        appViewRegistryList.remove(registryEntry);
          var updatedRegistry = AppViewRegistry(
              key: registryEntry.key,
              value: registryEntry.value,
              renderedYN: "Y",
              action: viewAction);
          appViewRegistryList.add(updatedRegistry);
        } else if (viewAction.name == "close") {
          appViewRegistryList.remove(registryEntry);
          var updatedRegistry = AppViewRegistry(
              key: registryEntry.key,
              value: registryEntry.value,
              renderedYN: "N",
              action: viewAction);
          appViewRegistryList.add(updatedRegistry);
        }
        break;
      }
    }

    DataStore.updateWidgetsByReference(["CenterView"]);
  }

  static List<Widget>? deferViewsToBeRendered(
      {required List<String> includeViews}) {
    List<Widget>? toBeRenderedList = [];
    for (var viewRef in includeViews) {
      var registryEntry =
          AppViewRouter.findFromAppViewRegistryList(searchTerm: viewRef);

      if (registryEntry != null && registryEntry.value != null && registryEntry.renderedYN == "Y") {
        toBeRenderedList.add(registryEntry.value as Widget);
      }
    }

    return toBeRenderedList;
  }

  static AppViewRegistry? findFromAppViewRegistryList({required String searchTerm}) {
    //int index = -1;
    for (var avr in appViewRegistryList) {
      // index += 1;
      if (avr.key.compareTo(searchTerm) == 0) {
        print("found widget ref to update : ${avr.key}");
        return avr;
      }
    }

    print(
        "AppViewRegistry search CY: ${searchTerm} no such widget found");
    return null;
  }
}
