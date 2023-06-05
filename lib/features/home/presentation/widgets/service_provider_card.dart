import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../details/presentation/widgets/service_icon.dart';
import '../../domain/entities/partner_entity.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../details/presentation/pages/service_provider_details_screen.dart';

class ServiceProviderCard extends StatelessWidget {
  const ServiceProviderCard({
    Key? key,
    required this.image,
    required this.name,
    required this.serviceClass,
    required this.rating,
    required this.reviews,
    required this.partner,
    required this.currentUser,
  }) : super(key: key);
  final String image;
  final String name;
  final String serviceClass;
  final String rating;
  final String reviews;
  final PartnerEntity partner;
  final UserEntity currentUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ServiceProviderDetails(
                    partner: partner,
                    currentUser: currentUser,
                  ))),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(12),
        ).copyWith(
            top: getProportionateScreenHeight(12),
            bottom: getProportionateScreenHeight(16)),
        decoration: BoxDecoration(
          border: Border.all(
            color: kOutlineVariant,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: image,
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      image,
                      height: getProportionateScreenHeight(96),
                      width: getProportionateScreenWidth(128),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: getProportionateScreenWidth(5),
                  left: getProportionateScreenWidth(5),
                  child: ServiceIconSmall(
                    serviceClass: partner.serviceClass,
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
            Text(
              name,
              overflow: TextOverflow.ellipsis, // Use ellipsis overflow
              maxLines: 1, // Set the maximum number of lines
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getProportionateScreenHeight(4)),
            Text(
              serviceClass,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: kGreys),
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
                      text: "$rating ",
                      style: Theme.of(context).textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: "($reviews)",
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
