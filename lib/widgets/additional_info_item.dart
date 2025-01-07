import 'package:flutter/material.dart';

class AddtionalInfoItem extends StatelessWidget {
  final IconData infoCardIcon;
  final String infoText;
  final String infoDataValue;

  const AddtionalInfoItem(
      {required this.infoCardIcon,
      required this.infoText,
      this.infoDataValue = "0",
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Icon(
            infoCardIcon,
            size: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            infoText,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            infoDataValue,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ],
      ),
    );
  }
}