import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/screen_size_utility.dart';
import 'package:pokemon/features/listing_feature/presentation/controllers/pokemon_listing_controller.dart';

class SearchDialog extends GetView<PokemonListingController> {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return AlertDialog(
      title: Obx(() => Text(controller.isSearching.value
          ? 'Searching for ${searchController.text}...'
          : 'Search for pokemon')),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: SizedBox(
        width: ScreenSize.width * 0.8,
        child: Obx(
          () => Visibility(
            visible: !controller.isSearching.value &&
                !controller.noSearchResult.value,
            replacement: Visibility(
              visible: !controller.noSearchResult.value,
              replacement: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No results found for the search term "${searchController.text}"',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.isSearching.value = false;
                      controller.noSearchResult.value = false;
                      controller.prePopulate();
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0),
                        ),
                      ),
                      child: Text(
                        "Go Back",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.isSearching.value = false;
                      controller.prePopulate();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: "Enter pokemon name...",
                    ),
                    maxLines: 8,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (searchController.text.isNotEmpty) {
                      controller.isSearching.value = true;
                      controller
                          .searchPokemon(searchController.text.toLowerCase());
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      gradient: LinearGradient(colors: [
                        ColorPallete.secondaryColor.withOpacity(0.5),
                        Colors.greenAccent,
                      ]),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0),
                      ),
                    ),
                    child: Text(
                      "Search",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
