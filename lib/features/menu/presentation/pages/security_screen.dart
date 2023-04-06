import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/faq_tile.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Security",
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
                  "Security Information",
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
                  question: "Background Checks",
                  answer:
                      "ServisGo may conduct background checks on service providers before allowing them to offer services on the platform. Customers can ask service providers to provide documentation that verifies they have gone through a background check process.",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                const FAQTile(
                  question: "Ratings",
                  answer:
                      "Customers can look at the ratings and reviews left by previous customers to gauge the service provider's reliability and quality of work.",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                const FAQTile(
                  question: "Communication",
                  answer:
                      "Customers should communicate clearly and promptly with service providers to avoid any misunderstandings and ensure that the service provider understands the customer's needs.",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                const FAQTile(
                  question: "Payment",
                  answer:
                      "Customers should only make payments through the application's secure payment system and should not provide payment information outside of the app.",
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
                const FAQTile(
                  question: "Personal Safety",
                  answer:
                      "Customers should prioritize their personal safety and should avoid sharing personal information with service providers. They should also ensure that they are present when the service provider arrives and leaves their home.",
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
