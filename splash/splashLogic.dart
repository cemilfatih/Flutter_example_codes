import 'package:flutter/foundation.dart';
import 'package:ieee_mobile_app/enums/splashScreenEnum.dart';
import '../../enums/FirebaseCollectionsEnum.dart';
import '../../enums/PlatformEnum.dart';
import '../../models/appVersionModel.dart';
import '../../utility/versionManager.dart';

import 'package:package_info/package_info.dart';

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

class splashLogic {



  var isRequiredForceUpdate;


  Future<int> checkAppVersion() async {
    try {

      final databaseVersion = await getVersionFromDatabase();
      final clientVersion = await getAppVersion();

      if (databaseVersion == null || databaseVersion.isEmpty) {
        isRequiredForceUpdate == splashScreenEnum.forceUpdate.screenCode;
      }


/*
      if (checkisNeedForceUpdate.isNeedForUpdate() == ) {
        isRequiredForceUpdate = true;
      } else {
        isRequiredForceUpdate = false;
      }

 */


       isRequiredForceUpdate = VersionManager(
          deviceVersion: clientVersion,
          databaseVersion: databaseVersion!).isNeedForUpdate();


      return isRequiredForceUpdate;
    } catch (e) {
      print(e.toString());
      return splashScreenEnum.forceUpdate.screenCode;
    }
  }

  Future<String?> getVersionFromDatabase() async {
    if (kIsWeb) return null;

    final response = await FirebaseCollections.version.reference.withConverter<versionModel>(
        fromFirestore: (snapshot, _) => versionModel().fromFirebase(snapshot),
        toFirestore: (model, _) => model.toJson())
        .doc(PlatformEnum.versionName)
        .get();


    return response
        .data()
        ?.number;
  }

  Future<String?> getCode() async {

    final response = await FirebaseCollections.version.reference.withConverter<splashCodeModel>(
        fromFirestore: (snapshot , _) => splashCodeModel().fromFirebase(snapshot),
        toFirestore: (snapshot, _) => snapshot.toJson())
        .doc("passcode")
        .get();

    return response.data()!.code;
  }
}