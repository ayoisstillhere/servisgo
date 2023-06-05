// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:servisgo/features/home/domain/entities/partner_entity.dart';

import 'package:servisgo/features/tracker/domain/entities/accepted_service_entity.dart';
import 'package:servisgo/features/tracker/presentation/bloc/accepted_service_cubit/accepted_service_cubit.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../bloc/partner_cubit/partner_cubit.dart';

class CurrentJobCard extends StatefulWidget {
  const CurrentJobCard({
    Key? key,
    required this.currentService,
    required this.currentUser,
  }) : super(key: key);
  final AcceptedServiceEntity currentService;
  final UserEntity currentUser;

  @override
  State<CurrentJobCard> createState() => _CurrentJobCardState();
}

class _CurrentJobCardState extends State<CurrentJobCard> {
  double rating = 0.0;

  @override
  void initState() {
    BlocProvider.of<PartnerCubit>(context).getPartners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return BlocBuilder<PartnerCubit, PartnerState>(
      builder: (_, state) {
        if (state is PartnerLoaded) {
          final currentPartner = state.partners.firstWhere((partner) =>
              partner.partnerId == widget.currentService.partnerId);
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32)),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
                vertical: getProportionateScreenHeight(16),
              ),
              width: double.infinity,
              // height: getProportionateScreenHeight(200),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kOutlineVariant,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: getProportionateScreenWidth(32),
                        backgroundImage: NetworkImage(
                          currentPartner.partnerPfpURL,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(8)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentPartner.partnerName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(8)),
                                Row(
                                  children: [
                                    Text(
                                      widget.currentService.scheduledDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: kGreys,
                                          ),
                                    ),
                                    SizedBox(
                                        width: getProportionateScreenWidth(12)),
                                    Text(
                                      widget.currentService.scheduledTime,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: kGreys,
                                          ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenWidth(12)),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Service",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kGreys),
                          ),
                          SizedBox(height: getProportionateScreenHeight(4)),
                          Text(
                            widget.currentService.serviceClass,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(width: getProportionateScreenWidth(100)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price Per Hour",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kGreys),
                          ),
                          SizedBox(height: getProportionateScreenHeight(4)),
                          Text(
                            "#${widget.currentService.servicePrice}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenWidth(24)),
                  GestureDetector(
                    onTap: () async {
                      await showRating(currentPartner);
                      BlocProvider.of<AcceptedServiceCubit>(context)
                          .updateServiceToCompleted(widget.currentService.id,
                              widget.currentService.partnerId);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(8))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(24),
                          vertical: getProportionateScreenHeight(8),
                        ),
                        child: Center(
                          child: Text(
                            "Mark As Complete",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.dark
                                          ? kBlacks
                                          : kBgColor,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<void> showRating(final PartnerEntity currentPartner) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: getProportionateScreenHeight(284),
            width: getProportionateScreenWidth(320),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(6),
              vertical: getProportionateScreenWidth(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/stars.svg"),
                Text(
                  "Rate ${currentPartner.partnerName}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  "Tap a star to give your rating",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kGreys,
                      ),
                ),
                RatingBar.builder(
                  minRating: 0,
                  itemSize: 46,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  updateOnDrag: true,
                  onRatingUpdate: (rating) => setState(() {
                    this.rating = rating;
                  }),
                ),
                GestureDetector(
                  onTap: () async {
                    await BlocProvider.of<AcceptedServiceCubit>(context)
                        .updateServiceRating(widget.currentService.id,
                            widget.currentService.partnerId, rating);

                    final Customer customer = Customer(
                      name: widget.currentUser.name,
                      phoneNumber: widget.currentUser.phoneNumber,
                      email: widget.currentUser.email,
                    );
                    final Flutterwave flutterwave = Flutterwave(
                      context: context,
                      publicKey:
                          "FLWPUBK_TEST-6d01d9880e194bd2788e43795a1cf32d-X",
                      currency: "NGN",
                      redirectUrl: "https://pub.dev/",
                      txRef:
                          "${widget.currentService.id}-${DateTime.now().millisecondsSinceEpoch}",
                      amount: widget.currentService.servicePrice,
                      customer: customer,
                      paymentOptions: "ussd, card, barter, payattitude",
                      customization: Customization(title: "Pay for Servcie"),
                      isTestMode: true,
                    );
                    final ChargeResponse response = await flutterwave.charge();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: getProportionateScreenWidth(224),
                    height: getProportionateScreenHeight(36),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? kDarkPrimaryColor
                          : kPrimaryColor,
                    ),
                    child: Center(
                        child: Text(
                      "Submit Rating",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? kBlacks
                              : kBgColor),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
