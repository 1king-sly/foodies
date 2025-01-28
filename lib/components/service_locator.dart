import 'package:foodies/permission/permission_handler.dart';
import 'package:foodies/permission/permission_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<PermissionService>
    (PermissionHandlerPermissionService());
}