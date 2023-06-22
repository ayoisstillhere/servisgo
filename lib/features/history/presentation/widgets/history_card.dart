// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servisgo/features/home/domain/entities/partner_entity.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../home/presentation/bloc/partner_cubit/partner_cubit.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({
    Key? key,
    required this.status,
    required this.price,
    required this.service,
    required this.date,
    required this.partnerId,
  }) : super(key: key);
  final String? status, price, service, date;
  final String partnerId;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  void initState() {
    BlocProvider.of<PartnerCubit>(context).getPartners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerCubit, PartnerState>(
      builder: (context, state) {
        if (state is PartnerLoaded) {
          final PartnerEntity partner = state.partners
              .firstWhere((partner) => partner.partnerId == widget.partnerId);
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(12),
                  vertical: getProportionateScreenHeight(16),
                ),
                width: double.infinity,
                height: getProportionateScreenHeight(148),
                decoration: BoxDecoration(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? const Color(0xFF2A2A2A)
                      : kBgColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? const BoxShadow(
                            color: Colors.transparent,
                          )
                        : BoxShadow(
                            color: kBlacks.withOpacity(0.06),
                            spreadRadius: 0,
                            blurRadius: 30,
                            offset: const Offset(0, 8),
                          ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              partner.partnerName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: kGreys,
                                  ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(4)),
                            Text(
                              "₦${widget.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? kGreys
                                        : kBlacks,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(8),
                            vertical: getProportionateScreenHeight(4),
                          ),
                          decoration: BoxDecoration(
                            color: widget.status == "Complete"
                                ? kPrimaryColor
                                : kCallToAction,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            widget.status!,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: widget.status == "Complete"
                                          ? kBgColor
                                          : kBlacks,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/work.svg",
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? kGreys
                              : kBlacks,
                        ),
                        SizedBox(width: getProportionateScreenWidth(4)),
                        Text(
                          "${widget.service} Service",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/calendar.svg",
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? kGreys
                              : kBlacks,
                        ),
                        SizedBox(width: getProportionateScreenWidth(4)),
                        Text(
                          widget.date!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(28)),
            ],
          );
        }
        return Center(
          child: SpinKitPulsingGrid(
            color: kPrimaryColor,
            size: getProportionateScreenWidth(100),
          ),
        );
      },
    );
  }
}
