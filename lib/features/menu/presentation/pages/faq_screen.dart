import 'package:flutter/material.dart';

import 'package:servisgo/constants.dart';

import '../../../../size_config.dart';
import '../widgets/faq_tile.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQ",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(32),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Questions",
                  style: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? Theme.of(context).textTheme.displaySmall
                      : Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: kBlacks),
                ),
                SizedBox(height: getProportionateScreenHeight(36)),
                const FAQTile(
                  question: "How do I book a service provider?",
                  answer:
                      "You can book a service by going to the home page and selecting the service you desire and heading over to the list of service providers. You can then select a service provider and book a service. You can also book a service by going to one of our top service provider's profiles and booking a service.",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                const FAQTile(
                  question: "How can I track the service provider?",
                  answer:
                      "You can see the service providers live location through the tracker screen. Just navigate to the tracker screen to see how long till the tasker gets to you!",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                const FAQTile(
                  question: "Can I cancel or reschedule a booking?",
                  answer:
                      "No not at the moment. We are working on this functionality, so ensure you are able to host the service provider at the time of booking.",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                const FAQTile(
                  question: "What payment methods are accepted?",
                  answer:
                      "We accept all major credit and debit cards through Paystack and Flutterwave payment gateways.",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                const FAQTile(
                  question: "How do I rate the service provider?",
                  answer:
                      "After the service is completed, you will be prompted by the app to rate the service provider using a five star system.",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
