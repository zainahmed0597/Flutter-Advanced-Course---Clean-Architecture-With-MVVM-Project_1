import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import '../domain/model/model.dart';
import 'package:flutter/services.dart';


Future<DeviceInfo> getDeviceDetails() async {
  String? name = "Unknown";
  String? identifier = "Unknown";
  String? version = "Unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      // return android device info
      // var build = await deviceInfoPlugin.androidInfo;  old code
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      // name = build.brand + " " + build.model; // old code
      name = androidInfo.brand;
      identifier = androidInfo.id;
      version = androidInfo.version.codename;
    } else if (Platform.isIOS) {
      // return ios device info
      // var build = await deviceInfoPlugin.iosInfo; // old code
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      // name = build.name + " " + build.model; //  old code
      name = iosInfo.model;
      identifier = iosInfo.identifierForVendor;
      version = iosInfo.systemVersion;
    }
  } on PlatformException {
    // return default data here
    return DeviceInfo(name!, identifier!, version!);
  }
  return DeviceInfo(name!, identifier!, version!);
}
bool isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}