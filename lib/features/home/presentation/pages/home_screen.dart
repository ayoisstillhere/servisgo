import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/bottom_navbar.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/service_button.dart';
import '../widgets/service_provider_card.dart';
import 'select_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(32),
            ).copyWith(
                top: getProportionateScreenHeight(48),
                bottom: getProportionateScreenHeight(18)),
            color: kPrimaryColor,
            height: getProportionateScreenHeight(128),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Ayodele Fagbami!",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: kBgColor),
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
                SvgPicture.asset("assets/icons/Notifications.svg"),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(32)),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(156),
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(27),
                        horizontal: getProportionateScreenWidth(16),
                      ),
                      decoration: BoxDecoration(
                        color: kCallToAction,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                horizontal: getProportionateScreenWidth(4),
                                vertical: getProportionateScreenHeight(8)),
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
                        width: getProportionateScreenWidth(159.49),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(28),
              ),
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(32)),
                child: Text(
                  "Our Services",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kBlacks,
                      ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: getProportionateScreenWidth(32)),
                    ServiceButton(
                      color: const Color(0XFFFA99D3),
                      icon: "assets/icons/CleaningIcon.png",
                      serviceName: "Cleaning",
                      press: () {},
                    ),
                    SizedBox(width: getProportionateScreenWidth(28)),
                    ServiceButton(
                      color: const Color(0XFFF78273),
                      icon: "assets/icons/GardeningIcon.png",
                      serviceName: "Gardening",
                      press: () {},
                    ),
                    SizedBox(width: getProportionateScreenWidth(28)),
                    ServiceButton(
                      color: const Color(0XFFC45E84),
                      icon: "assets/icons/PlumbingIcon.png",
                      serviceName: "Plumbing",
                      press: () {},
                    ),
                    SizedBox(width: getProportionateScreenWidth(28)),
                    ServiceButton(
                      color: const Color(0XFFBDA5A6),
                      icon: "assets/icons/ElectricalIcon.png",
                      serviceName: "Electrical",
                      press: () {},
                    ),
                    SizedBox(width: getProportionateScreenWidth(28)),
                    ServiceButton(
                      color: kCallToAction,
                      icon: "assets/icons/HandymanIcon.png",
                      serviceName: "Handyman",
                      press: () {},
                    ),
                    SizedBox(width: getProportionateScreenWidth(28)),
                    ServiceButton(
                      color: const Color(0XFFA05338),
                      icon: "assets/icons/PaintingIcon.png",
                      serviceName: "Painting",
                      press: () {},
                    ),
                    SizedBox(width: getProportionateScreenWidth(28)),
                    ServiceButton(
                      color: const Color(0XFF5EECBE),
                      icon: "assets/icons/HomeImprovementIcon.png",
                      serviceName: "Improve",
                      press: () {},
                    ),
                    SizedBox(width: getProportionateScreenWidth(32)),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  SelectProvider()));
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: getProportionateScreenWidth(32)),
                    const ServiceProviderCard(
                      image:
                          "https://cdn.pixabay.com/photo/2021/03/21/13/28/woman-6112091_1280.jpg",
                      name: "Judith Omole",
                      location: "Surulere",
                      rating: "4.5 ",
                      reviews: "(1234)",
                    ),
                    SizedBox(width: getProportionateScreenWidth(12)),
                    const ServiceProviderCard(
                      image:
                          "https://cdn.pixabay.com/photo/2020/01/20/17/30/look-4780865__480.jpg",
                      name: "Stephen Anyanwu",
                      location: "Surulere",
                      rating: "4.5 ",
                      reviews: "(1234)",
                    ),
                    SizedBox(width: getProportionateScreenWidth(12)),
                    const ServiceProviderCard(
                      image:
                          "https://images.unsplash.com/photo-1530785602389-07594beb8b73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fG5pZ2VyaWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
                      name: "Blessing Ornu",
                      location: "Surulere",
                      rating: "4.5 ",
                      reviews: "(1234)",
                    ),
                    SizedBox(width: getProportionateScreenWidth(12)),
                    const ServiceProviderCard(
                      image:
                          "https://cdn.pixabay.com/photo/2018/10/11/15/35/angry-boy-3740043__480.jpg",
                      name: "Tobi Odusayo",
                      location: "Surulere",
                      rating: "4.5 ",
                      reviews: "(1234)",
                    ),
                    SizedBox(width: getProportionateScreenWidth(12)),
                    const ServiceProviderCard(
                      image:
                          "https://images.unsplash.com/photo-1594564190328-0bed16a89837?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmlnZXJpYW58ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
                      name: "Akpan Ibisi",
                      location: "Surulere",
                      rating: "4.5 ",
                      reviews: "(1234)",
                    ),
                    SizedBox(width: getProportionateScreenWidth(32)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
