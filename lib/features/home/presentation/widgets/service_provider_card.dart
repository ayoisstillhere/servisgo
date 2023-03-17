import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servisgo/features/details/presentation/pages/service_provider_details_screen.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class ServiceProviderCard extends StatelessWidget {
  const ServiceProviderCard({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.reviews,
  }) : super(key: key);
  final String image;
  final String name;
  final String location;
  final String rating;
  final String reviews;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceProviderDetails(imageUrl: image,))),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(12),
        ).copyWith(
            top: getProportionateScreenHeight(12),
            bottom: getProportionateScreenHeight(16)),
        decoration: BoxDecoration(
          color: kBgColor,
          border: Border.all(
            color: kOutlineVariant,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: image,
              transitionOnUserGestures: true,
              child: Image.network(
                image,
                height: getProportionateScreenHeight(96),
                width: getProportionateScreenWidth(128),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getProportionateScreenHeight(4)),
            Text(
              location,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(color: kGreys),
            ),
            SizedBox(height: getProportionateScreenHeight(4)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/icons/ratingStar.svg",
                  height: getProportionateScreenHeight(14),
                  width: getProportionateScreenWidth(14),
                ),
                SizedBox(width: getProportionateScreenWidth(4)),
                RichText(
                  text: TextSpan(
                      text: rating,
                      style: Theme.of(context).textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: reviews,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kGreys),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
