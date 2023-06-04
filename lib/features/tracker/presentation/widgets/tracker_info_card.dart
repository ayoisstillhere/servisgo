import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../home/domain/entities/partner_entity.dart';
import '../../domain/entities/accepted_service_entity.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../chat/presentation/pages/chat_screen.dart';

class TrackerInfoCard extends StatelessWidget {
  const TrackerInfoCard({
    Key? key,
    required this.partner,
    required this.currentUser,
    required this.acceptedService,
  }) : super(key: key);
  final PartnerEntity partner;
  final UserEntity currentUser;
  final AcceptedServiceEntity acceptedService;

  @override
  Widget build(BuildContext context) {
    final List ratings = partner.ratings;
    double sum = 0;
    double avgRating = 0;
    if (ratings.isNotEmpty) {
      for (var rating in ratings) {
        sum += rating;
      }
      avgRating = sum / ratings.length;
    } else {
      avgRating = 0;
    }
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16),
        vertical: getProportionateScreenHeight(18),
      ),
      height: getProportionateScreenHeight(140),
      width: getProportionateScreenWidth(358),
      decoration: BoxDecoration(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkBgColor
            : kBgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 30,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.06),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  partner.partnerPfpURL,
                ),
                radius: getProportionateScreenWidth(28),
              ),
              SizedBox(width: getProportionateScreenWidth(8)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      partner.partnerName,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(4)),
                    AutoSizeText(
                      acceptedService.customerAddress,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kGreys),
                      maxLines: 1, // Limit the number of lines to 2
                      minFontSize: 10, // Minimum font size
                      overflow: TextOverflow
                          .ellipsis, // Show ellipsis if the text exceeds the available space
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/trackerRatingStar.svg"),
                  SizedBox(width: getProportionateScreenWidth(4)),
                  Text(
                    avgRating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16),
                  vertical: getProportionateScreenHeight(8),
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  acceptedService.serviceClass,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: kBgColor),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Uri dialnumber = Uri(
                        scheme: 'tel',
                        path: partner.partnerPhone,
                      );
                      await launchUrl(dialnumber);
                    },
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset("assets/icons/trackerCall.svg"),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(4)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                    partner: partner,
                                    user: currentUser,
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(7)),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset("assets/icons/trackerChat.svg"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
