import 'package:device_info/device_info.dart';

class MyDeviceInfo {
  static dynamic readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'phone_id': build.androidId,
      'manufacturer': build.manufacturer,
      'system_version': build.version.baseOS,
      'apk_version': '1.0.0',
      'os_name': 'android',
      'system_os': build.version.release
    };
  }

  static dynamic readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'phone_id': data.identifierForVendor,
      'manufacturer': data.model,
      'system_version': data.utsname.version,
      'apk_version': data.utsname.release,
      'os_name': data.systemName,
      'system_os': data.utsname.sysname
    };
  }
}
