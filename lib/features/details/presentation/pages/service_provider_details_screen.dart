import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../widgets/service_icon.dart';
import '../../../home/domain/entities/partner_entity.dart';

import '../../../../components/bullet_point.dart';
import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../confirmBooking/presentation/pages/confirm_booking_screen.dart';

class ServiceProviderDetails extends StatelessWidget {
  const ServiceProviderDetails({
    Key? key,
    required this.partner,
    required this.currentUser,
  }) : super(key: key);
  final PartnerEntity partner;
  final UserEntity currentUser;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> services = [
      {
        'title': 'Cleaning',
        'description':
            'Our cleaning services provide a range of standard cleaning tasks, which may include:',
        'bulletPoint1':
            'Dusting and wiping down all surfaces, including furniture, countertops, and shelves.',
        'bulletPoint2':
            'Vacuuming or sweeping and mopping floors to eliminate dust, debris, and pet hair.',
        'bulletPoint3':
            'Sanitizing and disinfecting high-touch areas, such as doorknobs, light switches, and remote controls.',
        'bulletPoint4':
            'Cleaning kitchen appliances, including the stovetop, oven, and refrigerator.',
        'bulletPoint5':
            'Scrubbing and disinfecting bathrooms, including toilets, sinks, showers, and tubs.',
        'price': '6500',
      },
      {
        'title': 'Gardening',
        'description':
            'Our gardening services offer a variety of tasks to keep your outdoor spaces beautiful:',
        'bulletPoint1':
            'Lawn mowing and edging to maintain a neat and well-manicured appearance.',
        'bulletPoint2':
            'Trimming and pruning trees, shrubs, and bushes for healthy growth and shape.',
        'bulletPoint3':
            'Planting flowers, plants, and vegetables to enhance the beauty of outdoor spaces.',
        'bulletPoint4':
            'Weed control and removal to keep the garden free from unwanted vegetation.',
        'bulletPoint5':
            'Mulching and fertilizing to promote soil health and enhance plant growth.',
        'price': '4000',
      },
      {
        'title': 'Plumbing',
        'description':
            'Our plumbing services ensure the proper functioning of your plumbing system:',
        'bulletPoint1':
            'Repairing leaky faucets, pipes, and toilets to prevent water wastage and damage.',
        'bulletPoint2':
            'Clearing clogged drains and pipes using professional tools and techniques.',
        'bulletPoint3':
            'Installing and replacing plumbing fixtures, such as sinks, showers, and toilets.',
        'bulletPoint4':
            'Detecting and repairing water leaks in the plumbing system.',
        'bulletPoint5':
            'Conducting routine maintenance checks to ensure the proper functioning of the plumbing system.',
        'price': '4000',
      },
      {
        'title': 'Electrical',
        'description':
            'Our electrical services ensure that your electrical system is safe and functioning properly. We offer various electrical services, such as:',
        'bulletPoint1':
            'Lighting Installation including fixtures, switches, and dimmers.',
        'bulletPoint2':
            'Electrical panel upgrades to support increased power demands.',
        'bulletPoint3':
            'Troubleshooting and repairing electrical wiring issues.',
        'bulletPoint4':
            'Installing and maintaining security systems, including CCTV cameras and motion sensors.',
        'bulletPoint5':
            'Electrical inspections and code compliance assessments.',
        'price': '4000',
      },
      {
        'title': 'Handyman',
        'description':
            'Our handyman services provide assistance with a variety of household tasks:',
        'bulletPoint1':
            'Assembling and installing furniture, shelves, and cabinets.',
        'bulletPoint2':
            'Hanging mirrors, artwork, and shelves securely on walls.',
        'bulletPoint3':
            'Repairing or replacing damaged doors, windows, and screens.',
        'bulletPoint4':
            'Installing or repairing locks and handles for enhanced security.',
        'bulletPoint5':
            'Performing general maintenance tasks, such as caulking, painting, and minor repairs.',
        'price': '5000',
      },
      {
        'title': 'Painting',
        'description':
            'Our painting services offer professional interior and exterior painting:',
        'bulletPoint1': 'Preparing surfaces by cleaning, sanding, and priming.',
        'bulletPoint2': 'Applying multiple coats of paint evenly and smoothly.',
        'bulletPoint3':
            'Providing color consultation and assistance in choosing the right paint colors.',
        'bulletPoint4':
            'Repairing and patching damaged areas on walls and ceilings before painting.',
        'bulletPoint5':
            'Cleaning up and removing paint debris after completing the painting project.',
        'price': '6000',
      },
      {
        'title': 'Home Improvement',
        'description':
            'Our home improvement services help enhance and upgrade your living spaces:',
        'bulletPoint1':
            'Kitchen and bathroom remodeling for a fresh and modern look.',
        'bulletPoint2':
            'Flooring installation, including hardwood, tile, and laminate.',
        'bulletPoint3': 'Cabinet installation and custom storage solutions.',
        'bulletPoint4':
            'Window and door replacement for improved energy efficiency and aesthetics.',
        'bulletPoint5':
            'Basement finishing and attic conversions for additional living space.',
        'price': '10000',
      },
    ];

    Map details = {};

    if (partner.serviceClass == "Cleaning") {
      details = services[0];
    } else if (partner.serviceClass == "Gardening") {
      details = services[1];
    } else if (partner.serviceClass == "Plumbing") {
      details = services[2];
    } else if (partner.serviceClass == "Electrical") {
      details = services[3];
    } else if (partner.serviceClass == "Handyman") {
      details = services[4];
    } else if (partner.serviceClass == "Painting") {
      details = services[5];
    } else if (partner.serviceClass == "Improve") {
      details = services[6];
    }

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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: partner.partnerPfpURL,
                    transitionOnUserGestures: true,
                    child: Image.network(
                      partner.partnerPfpURL,
                      width: double.infinity,
                      height: getProportionateScreenHeight(298),
                      fit: BoxFit.cover,
                    ),
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
                                  partner.partnerName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(color: kPrimaryColor),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(6)),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(4)),
                                  height: getProportionateScreenHeight(16),
                                  width: getProportionateScreenWidth(70),
                                  decoration: BoxDecoration(
                                    color: kCallToAction,
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(12)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "FixITbRO",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: kBlacks),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ServiceIcon(serviceClass: partner.serviceClass),
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
                                  "${avgRating.toStringAsFixed(1)} (${partner.ratings.length} reviews)",
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
                        SizedBox(height: getProportionateScreenHeight(20)),
                        Text(
                          details['title'],
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(height: getProportionateScreenHeight(12)),
                        Text(
                          details['description'],
                          textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kGreys),
                        ),
                        SizedBox(height: getProportionateScreenHeight(12)),
                        BulletPoint(
                          text: details[
                              'bulletPoint1'], // Add more bullet points for cleaning services if needed
                        ),
                        BulletPoint(
                          text: details[
                              'bulletPoint2'], // Add more bullet points for cleaning services if needed
                        ),
                        BulletPoint(
                          text: details[
                              'bulletPoint3'], // Add more bullet points for cleaning services if needed
                        ),
                        BulletPoint(
                          text: details[
                              'bulletPoint4'], // Add more bullet points for cleaning services if needed
                        ),
                        BulletPoint(
                          text: details[
                              'bulletPoint5'], // Add more bullet points for cleaning services if needed
                        ),
                        SizedBox(height: getProportionateScreenHeight(36)),
                        DefaultButton(
                          text: "Book Now - #${details['price']}/hr",
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmBookingScreen(
                                          price: details['price'],
                                          currentUser: currentUser,
                                          serviceClass: partner.serviceClass,
                                        )));
                          },
                        ),
                        SizedBox(height: getProportionateScreenHeight(64)),
                      ],
                    ),
                  ),
                ],
              ),
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
    );
  }
}
