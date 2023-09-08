import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/screen_size_utility.dart';
import 'package:pokemon/features/details_feature/controllers/details_controller.dart';
import 'package:pokemon/features/details_feature/widgets/details_background.dart';
import 'package:pokemon/features/details_feature/widgets/details_card.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/pokemon.dart';
import 'package:pokemon/features/listing_feature/data/services/listing_service.dart';

class PokemonDetailsPage extends GetView<DetailsController> {
  PokemonDetailsPage({Key? key, required this.params}) : super(key: key);

  final Map<String, dynamic> params;

  final _listingService = ListingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pokemon Details',
          style: TextStyle(
            color: ColorPallete.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: FutureBuilder(
        future: _listingService.getPokemonFromUrl(params['url']),
        builder: (context, res) {
          if (res.hasData) {
            final data = res.data;

            if (data is Pokemon) {
              String? img = data.sprites?.other?.officialArtwork?.frontDefault;

              return Stack(
                children: [
                  const DetailsBackground(),
                  DetailsCard(data: data),
                  Padding(
                    padding: EdgeInsets.only(top: ScreenSize.height * 0.11),
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        img!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: CircularProgressIndicator(
                  color: ColorPallete.primaryColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
