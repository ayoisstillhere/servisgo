// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:servisgo/features/menu/presentation/pages/security_screen.dart';
import 'package:servisgo/features/onboarding/presentation/pages/onboarding_screen.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import '../../../auth/presentation/bloc/signin_cubit/signin_cubit.dart';
import '../../../notifications/presentation/pages/notifications_screen.dart';
import '../widgets/menu_item_tile.dart';
import 'faq_screen.dart';
import 'help_support_screen.dart';
import 'profile_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(
          width: 0,
          height: 0,
        ),
        title: Text(
          "Menu",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              currentUser: currentUser,
                            )));
              },
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    height: getProportionateScreenHeight(100),
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      color: kBgColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF9CA3AF).withOpacity(0.12),
                            blurRadius: 50,
                            offset: const Offset(5, 15)),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(currentUser.pfpURL),
                    ),
                  ),
                  Positioned(
                    top: getProportionateScreenHeight(56),
                    right: 0,
                    child: Container(
                      height: getProportionateScreenHeight(24),
                      width: getProportionateScreenWidth(24),
                      padding: EdgeInsets.all(getProportionateScreenWidth(4)),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kCallToAction,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Edit.svg",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            Text(
              currentUser.name,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: primaryColor),
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
            Text(
              currentUser.email,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: kGreys),
            ),
            SizedBox(height: getProportionateScreenHeight(28)),
            MenuItemTile(
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsScreen(
                              currentUser: currentUser,
                            )));
              },
              icon: "assets/icons/Notification.svg",
              text: "Notifications",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            MenuItemTile(
              press: () {},
              icon: "assets/icons/Wallet.svg",
              text: "Payment",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            MenuItemTile(
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecurityScreen()));
              },
              icon: "assets/icons/ShieldDone.svg",
              text: "Security",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            MenuItemTile(
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HelpSupportScreen()));
              },
              icon: "assets/icons/InfoCircle.svg",
              text: "Help & Support",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            MenuItemTile(
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FAQScreen()));
              },
              icon: "assets/icons/Document.svg",
              text: "FAQ",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            MenuItemTile(
              press: () async {
                await BlocProvider.of<AuthCubit>(context).loggedOut();
                await BlocProvider.of<SigninCubit>(context).submitSignOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnboardingScreen()),
                  (route) => false,
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const OnboardingScreen()),
                // );
              },
              icon: "assets/icons/Logout.svg",
              text: "Logout",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
          ],
        ),
      )),
    );
  }
}
