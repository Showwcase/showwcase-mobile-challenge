import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 17)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 20),
          child: Text(value),
        ),
      ],
    );
  }
}
