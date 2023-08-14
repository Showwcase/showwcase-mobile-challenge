import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/constants.dart';
import 'package:pokemon/config/screen_size_utility.dart';
import 'package:pokemon/config/widget_utility.dart';
import 'package:pokemon/features/add_feature/controllers/add_pokemon_controller.dart';

class AddPokemonPage extends GetView<AddPokemonController> {
  const AddPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorPallete.backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'Add Pokemon',
          style: TextStyle(
            color: ColorPallete.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'pokemon name is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF5F9FD),
                  label: const Text('Pokemon name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.1)),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                ),
              ),
              WidgetUtil.smallVSpacer,
              TextFormField(
                controller: controller.heightController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'pokemon height is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF5F9FD),
                  label: const Text('Pokemon height'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.1)),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                ),
              ),
              WidgetUtil.smallVSpacer,
              TextFormField(
                controller: controller.weightController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'pokemon weight is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF5F9FD),
                  label: const Text('Pokemon weight'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.1)),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                ),
              ),
              WidgetUtil.smallVSpacer,
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return Obx(
                    () => InputDecorator(
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFF5F9FD),
                        label: const Text('Type'),
                        hintText: '-- select --',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 0.1)),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                      isEmpty: controller.selectedType.value.isEmpty,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.selectedType.value,
                          isDense: true,
                          onChanged: (String? newValue) {
                            controller.selectedType.value = newValue ?? '';
                          },
                          items: pokemonTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              WidgetUtil.smallVSpacer,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      controller.addNewPokemon();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ColorPallete.primaryColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(ScreenSize.width * 0.6, 40),
                      ),
                    ),
                    child: const Text('Add'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
