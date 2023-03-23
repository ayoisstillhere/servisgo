import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/bullet_point.dart';
import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../confirmBooking/presentation/pages/confirm_booking_screen.dart';

class ServiceProviderDetails extends StatelessWidget {
  const ServiceProviderDetails({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Hero(
                  tag: imageUrl,
                  transitionOnUserGestures: true,
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: getProportionateScreenHeight(298),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: getProportionateScreenWidth(32),
                  top: getProportionateScreenHeight(58),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16),
                        vertical: getProportionateScreenHeight(18),
                      ),
                      height: getProportionateScreenHeight(56),
                      width: getProportionateScreenWidth(56),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(16),
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/ArrowLeft.svg",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(16)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Blessing Ornu",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: kPrimaryColor),
                          ),
                          SizedBox(height: getProportionateScreenHeight(6)),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(4)),
                            height: getProportionateScreenHeight(16),
                            width: getProportionateScreenWidth(70),
                            decoration: BoxDecoration(
                              color: kCallToAction,
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(12)),
                            ),
                            child: Center(
                              child: Text(
                                "Lekki",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0XFFFA99D3),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8.6),
                          vertical: getProportionateScreenHeight(8.6),
                        ),
                        child: Image.asset(
                          "assets/icons/CleaningIcon.png",
                          height: getProportionateScreenHeight(30.81),
                          width: getProportionateScreenWidth(30.81),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/Star.svg"),
                          SizedBox(width: getProportionateScreenWidth(4)),
                          Text(
                            "4.9 (1.3k reviews)",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kGreys),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/money.svg"),
                          SizedBox(width: getProportionateScreenWidth(4)),
                          Text(
                            "# 2000/hr",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kGreys),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/clock.svg"),
                          SizedBox(width: getProportionateScreenWidth(4)),
                          Text(
                            "2h avg. job",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kGreys),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(24)),
                  Text(
                    "House Cleaning",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: getProportionateScreenHeight(12)),
                  Text(
                    'This includes a range of standard cleaning services, which may include those listed below. Additional services such as deep cleaning and laundry may also be available for an extra fee:',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: kGreys),
                  ),
                  SizedBox(height: getProportionateScreenHeight(12)),
                  const BulletPoint(
                    text:
                        'Kitchen Cleaning including cleaning the counter tops, sink, stovetop, and appliances.',
                  ),
                  const BulletPoint(
                    text:
                        'Bathroom Cleaning which typically includes cleaning the toilet, sink, shower, and wiping down surfaces and mirrors.',
                  ),
                  const BulletPoint(
                    text:
                        'Bedroom Cleaning includes dusting furniture, vacuuming or sweeping the floors and making the bed.',
                  ),
                  const BulletPoint(
                    text:
                        'Living Room Cleaning which typically includes dusting furniture, wiping down surfaces such as coffee tables and end tables, vacuuming or sweeping the floors.',
                  ),
                  const BulletPoint(
                    text:
                        'General Cleaning which involves dusting and wiping down baseboards, cleaning windows and window sills, and vacuuming or sweeping all floors throughout the home.',
                  ),
                  SizedBox(height: getProportionateScreenHeight(36)),
                  DefaultButton(
                    text: "Book Now - #2000/hr",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ConfirmBookingScreen()));
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(64)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
