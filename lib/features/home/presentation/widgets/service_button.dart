import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../pages/select_provider.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.serviceName,
    required this.press,
  }) : super(key: key);
  final Color color;
  final String icon;
  final String serviceName;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectProvider()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(12),
              vertical: getProportionateScreenHeight(12),
            ),
            child: Image.asset(
              icon,
              height: getProportionateScreenHeight(43),
              width: getProportionateScreenWidth(43),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(4)),
        Text(
          serviceName,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.white
                        : kGreys,
              ),
        ),
      ],
    );
  }
}
