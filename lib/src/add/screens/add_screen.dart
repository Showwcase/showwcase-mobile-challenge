import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/constants/constants.dart';
import 'package:flutter_challenge/src/home/domain/services/home_service.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _homeService = HomeService();

  late TextEditingController name;
  late TextEditingController height;
  late TextEditingController weight;

  String selectedType = 'Ghost';

  final _spacer = const SizedBox(height: 30);

  SnackBar snackBar(String message, Color color) =>
      SnackBar(content: Text(message), backgroundColor: color);

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    height = TextEditingController();
    weight = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
    height.dispose();
    weight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Pokemon'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'name is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                _spacer,
                TextFormField(
                  controller: height,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'height is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Height'),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                _spacer,
                TextFormField(
                  controller: weight,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'weight is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Weight'),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                _spacer,
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                          label: Text('Type'),
                          hintText: '-- select --',
                          border: OutlineInputBorder()),
                      isEmpty: selectedType.isEmpty,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedType,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedType = newValue ?? '';
                              //    state.didChange(newValue);
                            });
                          },
                          items: pokemonTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                _spacer,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          showDialog(
                              context: context,
                              builder: (_) => const Center(
                                  child: CircularProgressIndicator()));

                          await _homeService.addPokemon(null);

                          Navigator.of(context, rootNavigator: true).pop();

                          _formKey.currentState?.reset();

                          ScaffoldMessenger.of(context).showSnackBar(snackBar(
                              'pokemon added successsfully', Colors.green));
                        }
                      },
                      child: const Text('Add'),
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
