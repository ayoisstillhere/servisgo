import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class ServiceIcon extends StatelessWidget {
  const ServiceIcon({
    Key? key,
    required this.serviceClass,
  }) : super(key: key);
  final String serviceClass;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Color>> iconColor = [
      {
        "Cleaning": const Color(0XFFFA99D3),
        "Gardening": const Color(0XFFF78273),
        "Plumbing": const Color(0XFFC45E84),
        "Electrical": const Color(0XFFBDA5A6),
        "Handyman": kCallToAction,
        "Painting": const Color(0XFFA05338),
        "Improve": const Color(0XFF5EECBE),
      },
    ];
    List<Map<String, String>> iconImage = [
      {
        "Cleaning": "assets/icons/CleaningIcon.png",
        "Gardening": "assets/icons/GardeningIcon.png",
        "Plumbing": "assets/icons/PlumbingIcon.png",
        "Electrical": "assets/icons/ElectricalIcon.png",
        "Handyman": "assets/icons/HandymanIcon.png",
        "Painting": "assets/icons/PaintingIcon.png",
        "Improve": "assets/icons/HomeImprovementIcon.png",
      },
    ];
    return Container(
      decoration: BoxDecoration(
        color: iconColor[0][serviceClass],
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(8.6),
        vertical: getProportionateScreenHeight(8.6),
      ),
      child: Image.asset(
        iconImage[0][serviceClass]!,
        height: getProportionateScreenHeight(30.81),
        width: getProportionateScreenWidth(30.81),
      ),
    );
  }
}
class ServiceIconSmall extends StatelessWidget {
  const ServiceIconSmall({
    Key? key,
    required this.serviceClass,
  }) : super(key: key);
  final String serviceClass;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Color>> iconColor = [
      {
        "Cleaning": const Color(0XFFFA99D3),
        "Gardening": const Color(0XFFF78273),
        "Plumbing": const Color(0XFFC45E84),
        "Electrical": const Color(0XFFBDA5A6),
        "Handyman": kCallToAction,
        "Painting": const Color(0XFFA05338),
        "Improve": const Color(0XFF5EECBE),
      },
    ];
    List<Map<String, String>> iconImage = [
      {
        "Cleaning": "assets/icons/CleaningIcon.png",
        "Gardening": "assets/icons/GardeningIcon.png",
        "Plumbing": "assets/icons/PlumbingIcon.png",
        "Electrical": "assets/icons/ElectricalIcon.png",
        "Handyman": "assets/icons/HandymanIcon.png",
        "Painting": "assets/icons/PaintingIcon.png",
        "Improve": "assets/icons/HomeImprovementIcon.png",
      },
    ];
    return Container(
      decoration: BoxDecoration(
        color: iconColor[0][serviceClass],
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(5),
        vertical: getProportionateScreenHeight(5),
      ),
      child: Image.asset(
        iconImage[0][serviceClass]!,
        height: getProportionateScreenHeight(25),
        width: getProportionateScreenWidth(25),
      ),
    );
  }
}
