import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../tracker/data/models/accepted_service_model.dart';
import '../../../tracker/presentation/bloc/accepted_service_cubit/accepted_service_cubit.dart';

import '../../../auth/domain/entities/user_entity.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../notifications/presentation/pages/notifications_screen.dart';
import '../../domain/entities/partner_entity.dart';
import '../bloc/partner_cubit/partner_cubit.dart';
import '../widgets/current_job_card.dart';
import '../widgets/service_button.dart';
import '../widgets/service_provider_card.dart';
import 'select_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<PartnerCubit>(context).getPartners();
    BlocProvider.of<AcceptedServiceCubit>(context).getAcceptedRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bannerColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkBannerColor
            : kPrimaryColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32),
              ).copyWith(
                  top: getProportionateScreenHeight(48),
                  bottom: getProportionateScreenHeight(18)),
              color: bannerColor,
              height: getProportionateScreenHeight(128),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Hello, ${widget.currentUser.name}!",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: kBgColor),
                          maxLines: 1, // Limit the number of lines to 2
                          minFontSize: 10,
                        ),
                        SizedBox(height: getProportionateScreenHeight(4)),
                        Text(
                          "What do you need done today?",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kBgColor),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen(
                              currentUser: widget.currentUser),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/icons/Notifications.svg",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AcceptedServiceCubit, AcceptedServiceState>(
                  builder: (_, state) {
                    if (state is AcceptedServiceLoaded) {
                      final activeService = state.acceptedRequests.firstWhere(
                          (acceptedRequests) =>
                              acceptedRequests.customerId ==
                                  widget.currentUser.uid &&
                              acceptedRequests.serviceStatus == "Ongoing",
                          orElse: () => const AcceptedServiceModel(
                                id: "",
                                customerId: "",
                                partnerId: "",
                                serviceClass: "",
                                serviceStatus: "",
                                scheduledDate: "",
                                scheduledTime: "",
                                servicePrice: "",
                                serviceRating: 0,
                                additionalDetails: "",
                                customerAddress: "",
                                latitudeCustomer: 0,
                                longitudeCustomer: 0,
                                latitudePartner: 0,
                                longitudePartner: 0,
                              ));
                      return activeService.id != ""
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: getProportionateScreenWidth(32)),
                                  child: Text(
                                    "Active Service",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : kBlacks,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(8)),
                                CurrentJobCard(
                                  currentService: activeService,
                                  currentUser: widget.currentUser,
                                ),
                              ],
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(32)),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: getProportionateScreenHeight(156),
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          getProportionateScreenHeight(27),
                                      horizontal:
                                          getProportionateScreenWidth(16),
                                    ),
                                    decoration: BoxDecoration(
                                      color: kCallToAction,
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenWidth(4)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "FIRST TIME DISCOUNT!",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: kBgColor),
                                        ),
                                        Text(
                                          "10% OFF",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(color: kBgColor),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  getProportionateScreenWidth(
                                                      4),
                                              vertical:
                                                  getProportionateScreenHeight(
                                                      8)),
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.circular(
                                                getProportionateScreenWidth(4)),
                                          ),
                                          child: Text(
                                            "ORDER NOW",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: kBgColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: getProportionateScreenWidth(152),
                                    child: Image.asset(
                                      "assets/images/cleanerNobg.png",
                                      height: getProportionateScreenHeight(120),
                                      width:
                                          getProportionateScreenWidth(159.49),
                                    ),
                                  ),
                                ],
                              ),
                            );
                    }
                    return Center(
                      child: SpinKitPulsingGrid(
                        color: kPrimaryColor,
                        size: getProportionateScreenWidth(100),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(32)),
                  child: Text(
                    "Our Services",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.white
                              : kBlacks,
                        ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: getProportionateScreenWidth(32)),
                      ServiceButton(
                        color: const Color(0XFFFA99D3),
                        icon: "assets/icons/CleaningIcon.png",
                        serviceName: "Cleaning",
                        currentUser: widget.currentUser,
                      ),
                      SizedBox(width: getProportionateScreenWidth(28)),
                      ServiceButton(
                        color: const Color(0XFFF78273),
                        icon: "assets/icons/GardeningIcon.png",
                        serviceName: "Gardening",
                        currentUser: widget.currentUser,
                      ),
                      SizedBox(width: getProportionateScreenWidth(28)),
                      ServiceButton(
                        color: const Color(0XFFC45E84),
                        icon: "assets/icons/PlumbingIcon.png",
                        serviceName: "Plumbing",
                        currentUser: widget.currentUser,
                      ),
                      SizedBox(width: getProportionateScreenWidth(28)),
                      ServiceButton(
                        color: const Color(0XFFBDA5A6),
                        icon: "assets/icons/ElectricalIcon.png",
                        serviceName: "Electrical",
                        currentUser: widget.currentUser,
                      ),
                      SizedBox(width: getProportionateScreenWidth(28)),
                      ServiceButton(
                        color: kCallToAction,
                        icon: "assets/icons/HandymanIcon.png",
                        serviceName: "Handyman",
                        currentUser: widget.currentUser,
                      ),
                      SizedBox(width: getProportionateScreenWidth(28)),
                      ServiceButton(
                        color: const Color(0XFFA05338),
                        icon: "assets/icons/PaintingIcon.png",
                        serviceName: "Painting",
                        currentUser: widget.currentUser,
                      ),
                      SizedBox(width: getProportionateScreenWidth(28)),
                      ServiceButton(
                        color: const Color(0XFF5EECBE),
                        icon: "assets/icons/HomeImprovementIcon.png",
                        serviceName: "Improve",
                        currentUser: widget.currentUser,
                      ),
                      SizedBox(width: getProportionateScreenWidth(32)),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(32)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Service Providers",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectProvider(
                                        serviceClass: 'top',
                                        currentUser: widget.currentUser,
                                      )));
                        },
                        child: Text(
                          "View More",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kCallToAction),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                BlocBuilder<PartnerCubit, PartnerState>(
                  builder: (context, state) {
                    if (state is PartnerLoaded) {
                      return _topProvidersScrollView(state);
                    }
                    return Center(
                      child: SpinKitPulsingGrid(
                        color: kPrimaryColor,
                        size: getProportionateScreenWidth(100),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _topProvidersScrollView(PartnerLoaded partners) {
    List<PartnerEntity> serviceProvidersList = partners.partners.toList();
    serviceProvidersList
        .sort((a, b) => b.averageRating.compareTo(a.averageRating));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(32),
            right: getProportionateScreenWidth(20)),
        child: Row(
          children: List.generate(
            3,
            (index) {
              final List ratings = serviceProvidersList[index].ratings;
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

              return Padding(
                padding:
                    EdgeInsets.only(right: getProportionateScreenWidth(12)),
                child: ServiceProviderCard(
                  image: serviceProvidersList[index].partnerPfpURL,
                  name: serviceProvidersList[index].partnerName,
                  serviceClass: serviceProvidersList[index].serviceClass,
                  rating: avgRating.toStringAsFixed(1),
                  reviews:
                      serviceProvidersList[index].ratings.length.toString(),
                  partner: serviceProvidersList[index],
                  currentUser: widget.currentUser,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
