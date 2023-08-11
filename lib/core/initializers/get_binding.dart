import 'package:get/get.dart';
import 'package:pokemon/features/auth_feature/presentation/controllers/auth_controller.dart';

class GetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
