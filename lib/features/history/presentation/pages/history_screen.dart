// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:servisgo/constants.dart';

import '../../../../size_config.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> jobData = [
      {
        "providerName": "Mercy Okafor",
        "status": "Pending",
        "price": "2000",
        "service": "Cleaning",
        "date": "Aug 26",
      },
      {
        "providerName": "Akpan Ibisi",
        "status": "Complete",
        "price": "3000",
        "service": "Plumbing",
        "date": "Aug 26",
      },
      {
        "providerName": "Glory Akinbobola",
        "status": "Pending",
        "price": "4000",
        "service": "Electrical",
        "date": "Aug 26",
      },
      {
        "providerName": "William Saliba",
        "status": "Complete",
        "price": "2000",
        "service": "Improvement",
        "date": "Aug 26",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order History",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: getProportionateScreenWidth(48),
                  height: getProportionateScreenHeight(48),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      "All",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kBgColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(126.39),
                  height: getProportionateScreenHeight(48),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      "Completed",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kBlacks,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(126.39),
                  height: getProportionateScreenHeight(48),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      "Pending",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kBlacks,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(32)),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => HistoryCard(
                  providerName: jobData[index]["providerName"],
                  status: jobData[index]["status"],
                  price: jobData[index]["price"],
                  service: jobData[index]["service"],
                  date: jobData[index]["date"],
                ),
                itemCount: jobData.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.providerName,
    required this.status,
    required this.price,
    required this.service,
    required this.date,
  }) : super(key: key);
  final String? providerName, status, price, service, date;

  @override
  Widget build(BuildContext context) {
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
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
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
                        providerName!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: kGreys,
                            ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(4)),
                      Text(
                        "#$price",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
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
                      color:
                          status == "Complete" ? kPrimaryColor : kCallToAction,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      status!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: status == "Complete" ? kBgColor : kBlacks,
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
                    "$service Service",
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
                    date!,
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
}
