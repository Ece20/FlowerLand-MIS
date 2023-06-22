import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Logo widget goes here
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.local_florist, // Replace with your logo icon or widget
                color: Colors.green,
                size: 24,
              ),
            ),
            RichText(
              text: const TextSpan(
                text: 'FlowerLand',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,

                ),
                children: [
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      color: kblackClr,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundColor: klightGrayClr,
          child: Icon(Icons.notifications_outlined, color: kblackClr),
        ),
      ],
    );
  }
}
