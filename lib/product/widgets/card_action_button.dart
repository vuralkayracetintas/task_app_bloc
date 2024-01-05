import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CardActionButton extends StatelessWidget {
  CardActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  Icon icon;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.height * 0.08,
      width: context.sized.height * 0.08,
      child: Card(
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
