import 'package:flutter/material.dart';

class LikeBadge extends StatelessWidget {
  const LikeBadge({Key? key, this.value = '0'}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Stack(
          children: [
            const Icon(
              Icons.favorite,
              size: 30,
            ),
            Positioned(
              right: 1,
              top: -2,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                maxRadius: 10,
                child: Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 11, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
