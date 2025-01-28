// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodies/permission/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerPermissionService implements PermissionService {
  @override
  Future<PermissionStatus> requestCameraPermission() async {
    return await Permission.camera.request();
  }

  @override
  Future<PermissionStatus> requestPhotosPermission() async {
    return await Permission.photos.request();
  }

  @override
  Future<bool> handleCameraPermission(BuildContext context) async {
    PermissionStatus cameraPermissionStatus = await requestCameraPermission();

    if (cameraPermissionStatus != PermissionStatus.granted) {
      debugPrint(
          '😰 😰 😰 😰 😰 😰 Permission to camera was not granted! 😰 😰 😰 😰 😰 😰');
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Camera Permission'),
          content: const Text(
              'Camera permission should Be granted to use this feature, would you like to go to app settings to give camera permission?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Future<bool> handlePhotosPermission(BuildContext context) async {
    PermissionStatus photosPermissionStatus = await requestPhotosPermission();

    if (photosPermissionStatus != PermissionStatus.granted) {
      debugPrint(
          '😰 😰 😰 😰 😰 😰 Permission to photos not granted! 😰 😰 😰 😰 😰 😰');
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Photos Permission'),
          content: const Text(
              'Photos permission should Be granted to use this feature, would you like to go to app settings to give photos permission?'),
              actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }
}
