import 'package:get/get.dart';
import 'package:pokemon/features/add_feature/controllers/add_pokemon_controller.dart';
import 'package:pokemon/features/auth_feature/controllers/auth_controller.dart';
import 'package:pokemon/features/details_feature/controllers/details_controller.dart';
import 'package:pokemon/features/listing_feature/presentation/controllers/pokemon_listing_controller.dart';

class GetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());

    Get.lazyPut(() => PokemonListingController(), fenix: true);
    Get.lazyPut(() => AddPokemonController(), fenix: true);
    Get.lazyPut(() => DetailsController(), fenix: true);
  }
}
