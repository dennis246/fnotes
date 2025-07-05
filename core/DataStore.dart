import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'AppDataModel.dart';
import 'WidgetInfo.dart';


class DataStore {
  //static LinkedHashMap appDataList = LinkedHashMap();

/*  static final Set<String> appDataIntent = {
    "register",
    "update",
    "delete",
    "post",
    "backup"
  };*/

  static List<AppDataModel> appDataList = [];

  static List<WidgetInfo> widgetInfoList = [];

  static Map<String, Object> appProps = {};

  //init
  static registerDefaults() {
    if (kIsWeb) {
      //Utils.createSysDirectory("D");
      //var directory = Directory("D://quicknotes_app").create(recursive: true);
    }
/*
    appProps.putIfAbsent("renderNotifierDSViewYN", () => "N");
    appProps.putIfAbsent("renderNotifierDialogYN", () => "N");
    appProps.putIfAbsent("notifierDisplayPeriodInSec", () => 4);*/

    /*
    appDataList.add(AppDataModel(
        key: "notesList",
        value: QuickNote.sampleDataList(),
        intent: ModelIntent.insert));

    appDataList.add(AppDataModel(
        key: "currentNote",
        value:
            QuickNote("02", "def-title", "def-desc", "yellow", DateTime.now()),
        intent: ModelIntent.insert));

    var notifInst = NotifierDS(
        id: "389",
        title: "init app",
        description: "init desc at ${DateTime.now().toString()}",
        toBeRenderedYN: "N",
        attendedYN: "N",
        addedOn: DateTime.now());


     */


    print("registered app data of ${appDataList.length} objects");
  }

  loadAppDataList() => appDataList;

  static dynamic findFromAppDataModelList({required String searchTerm}) {
    //int index = -1;
    for (var prop in appDataList) {
      //index += 1;
      if (prop.key.compareTo(searchTerm) == 0) {
        return prop.value;
      }
    }
    return null;
  }

  static void updateWidgetInfoList(BuildContext context) {
    Widget wg = context.widget;
    final String wtype = objectRuntimeType(wg, 'Widget');
    print("type ${wtype}");

    // Widget? widgetRecord = findFromWidgetInfoList(wtype) as Widget;
    bool isExistingRef = false;
    for (var wif in widgetInfoList) {
      if (wif.referenceID.compareTo(wtype) == 0) {
        isExistingRef = true;
        wif = WidgetInfo(wif.referenceID, context);
        print(
            "updating wiflist (${widgetInfoList.length}) : ${context.widget}");
        break;
      }
    }

    if (isExistingRef == false) {
      widgetInfoList.add(WidgetInfo(wtype, context));
      print("adding to wiflist (${widgetInfoList.length}) : ${context.widget}");
    }
  }

  static Object? findFromWidgetInfoList({required String searchTerm}) {
    //int index = -1;
    for (var wif in widgetInfoList) {
      // index += 1;
      if (wif.referenceID.compareTo(searchTerm) == 0) {
        print("found widget ref to update : ${wif.referenceID}");
        return wif.context;
      }
    }

    throw Exception("WidgetInfo search CY: ${searchTerm} no such widget found");
  }

  static void updateWidgetsByReference(List<String> wIDsToUpdate) {
    for (var searchTerm in wIDsToUpdate) {
      BuildContext context =
          findFromWidgetInfoList(searchTerm: searchTerm) as BuildContext;
      (context as Element).markNeedsBuild();
    }
  }

  static void updateAppDataModelByReference(
      {required String reference,
      required Object currentObject,
      required ModelIntent intent}) {
    /*if (!ModelIntent.values.contains(suppliedIntent.toLowerCase())) {
      throw Exception("Invalid operation");
    }*/

    var targetIndex = -1;
    var runningIndex = -1;
    bool referenceFound = false;

    try {
      AppDataModel appDataModelInst = AppDataModel(
          key: reference, value: currentObject, intent: ModelIntent.initiation);

      if (intent.name.compareTo("insert") == 0) {
        appDataList.add(appDataModelInst);
      }

      if (intent.name.compareTo("update") == 0) {
        for (var appDataRow in appDataList) {
          runningIndex += 1;
          if (appDataRow.key.compareTo(reference) == 0) {
            targetIndex = runningIndex;
            referenceFound = true;
            print("found app data of ${appDataRow}");
            break;
          }
        }

        if (referenceFound) {
          appDataList.removeAt(targetIndex);
          // AppDataModel appDataModelInst = AppDataModel(reference, currentObject);
          appDataList.insert(
              targetIndex,
              AppDataModel(
                  key: reference,
                  value: currentObject,
                  intent: ModelIntent.insert));
          print("del insert note ${appDataModelInst.key}");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static String dataObjectAsRawString(currentObject) {
    return "";
  }

  static void removeWidgetByReference(String searchTerm) {
    int index = -1;
    bool refFound = false;
    for (var wif in widgetInfoList) {
      index += 1;
      if (wif.referenceID.compareTo(searchTerm) == 0) {
        refFound = true;
        break;
      }
    }

    if (refFound) {
      widgetInfoList.removeAt(index);
    }
  }
} // DataStore ends
