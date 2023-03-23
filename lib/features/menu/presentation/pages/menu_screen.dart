// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servisgo/main.dart';

import '../../../../components/bottom_navbar.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import '../../../auth/presentation/bloc/signin_cubit/signin_cubit.dart';
import '../widgets/menu_item_tile.dart';
import 'profile_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
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
                        builder: (context) => const ProfileScreen()));
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
                    child: Center(
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/servisgo-fyp.appspot.com/o/Default_PFP.png?alt=media&token=c6cec350-3a9b-4c85-a219-a9d5a8a1a3db",
                      ),
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
              "Ayodele Fagbami",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: kPrimaryColor),
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
            Text(
              "afagbami@gmail.com",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: kGreys),
            ),
            SizedBox(height: getProportionateScreenHeight(28)),
            MenuItemTile(
              press: () {},
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
              press: () {},
              icon: "assets/icons/Setting.svg",
              text: "Settings",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            MenuItemTile(
              press: () {},
              icon: "assets/icons/ShieldDone.svg",
              text: "Security",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            MenuItemTile(
              press: () {},
              icon: "assets/icons/InfoCircle.svg",
              text: "Help & Support",
            ),
            SizedBox(height: getProportionateScreenHeight(24)),
            MenuItemTile(
              press: () {},
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
                    MaterialPageRoute(builder: (context) => const MyApp()),
                    (route) => false);
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
