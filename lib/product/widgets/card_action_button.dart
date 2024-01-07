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
      height: context.sized.height * 0.06,
      width: context.sized.height * 0.06,
      child: Container(
        decoration: BoxDecoration(
          color: context
              .general.appTheme.floatingActionButtonTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: Colors.black,
          iconSize: context.sized.height * 0.03,
        ),
      ),
    );
  }
}
