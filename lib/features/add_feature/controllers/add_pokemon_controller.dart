import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/features/listing_feature/data/services/listing_service.dart';

class AddPokemonController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final _listingService = ListingService();

  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController nameController;

  RxString selectedType = 'Fire'.obs;

  void addNewPokemon() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await _listingService.addPokemon(null);

      Get.back;

      formKey.currentState?.reset();

      Get.snackbar(
        'Success!',
        'Pokemon added successsfully!',
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    heightController = TextEditingController();
    weightController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
