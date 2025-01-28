import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodies/components/service_locator.dart';
import 'package:foodies/pages/location_page.dart';
import 'package:foodies/permission/permission_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? galleryFile;
  final picker = ImagePicker();

  PermissionService get permissionService => getIt<PermissionService>();

  Future<bool> _handleImageUploadPermissions(
      BuildContext context, ImageSource? imageSource) async {
    if (imageSource == null) {
      return false;
    }
    if (imageSource == ImageSource.camera) {
      return await permissionService.handleCameraPermission(context);
    } else if (imageSource == ImageSource.gallery) {
      return await permissionService.handlePhotosPermission(context);
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/pattern2.webp'),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.grey.shade100,
                // Colors.white,
                Colors.white,
              ],
            ),
          ),
        ),
        SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                        // alignment: const Alignment(0, 0),
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(17, 218, 98, 23),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_left_sharp,
                              color: Color(0xFFDA6317),
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    const SizedBox(
                      width: 264,
                      height: 129,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Upload Your Photo Profile',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            // SizedBox(height: 10),
                            Text(
                              'This data will be displayed in your account profile for security',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ]),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: galleryFile == null
                          ? Column(children: [
                              Container(
                                width: double.infinity,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      getImage(ImageSource.gallery);
                                    },
                                    child: Image.asset(
                                        'assets/images/gallery.webp'),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: double.infinity,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      getImage(ImageSource.camera);
                                    },
                                    child: Image.asset(
                                        'assets/images/camera.webp'),
                                  ),
                                ),
                              ),
                            ])
                          : Container(
                              width: double.infinity,
                              height: 350,
                              color: Colors.grey.shade50,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    getImage(ImageSource.camera);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(galleryFile!),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.9),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF53E88B),
                        Color(0xFF15BE77),
                      ],
                    ),
                  ),
                  child: TextButton(
                    onPressed: galleryFile == null
                        ? null
                        : () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LocationPage()),
                            );
                          },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    if (img == ImageSource.camera) {
      await Permission.camera.request();
      PermissionStatus cameraStatus = await Permission.camera.request();

      if (cameraStatus == PermissionStatus.granted) {
        final pickedFile = await picker.pickImage(source: img);
        XFile? xfilePick = pickedFile;

        setState(
          () {
            if (xfilePick != null) {
              galleryFile = File(pickedFile!.path);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
                  const SnackBar(content: Text('Nothing is selected')));
            }
          },
        );
      }
      if (cameraStatus == PermissionStatus.denied) {
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
      }
      if (cameraStatus == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }
    if (img == ImageSource.gallery) {

      await Permission.photos.request();
      PermissionStatus galleryStatus = await Permission.photos.request();

      if (galleryStatus == PermissionStatus.granted) {
        final pickedFile = await picker.pickImage(source: img);
        XFile? xfilePick = pickedFile;

        setState(
          () {
            if (xfilePick != null) {
              galleryFile = File(pickedFile!.path);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
                  const SnackBar(content: Text('Nothing is selected')));
            }
          },
        );
      }
      if (galleryStatus == PermissionStatus.denied) {
        debugPrint(
            '😰 😰 😰 😰 😰 😰 Permission to storage was not granted! 😰 😰 😰 😰 😰 😰');
        await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Gallery Permission'),
            content: const Text(
                'Storage  permission should Be granted to use this feature, would you like to go to app settings to give camera permission?'),
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
      }
      if (galleryStatus == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }
  }
}
