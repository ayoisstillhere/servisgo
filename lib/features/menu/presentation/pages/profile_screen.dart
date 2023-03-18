import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../components/default_button.dart';

import '../../../../size_config.dart';

import '../../../../constants.dart';
import '../widgets/profile_item_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
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
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      height: getProportionateScreenHeight(172),
                      width: getProportionateScreenWidth(172),
                      decoration: BoxDecoration(
                        color: kBgColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFF9CA3AF).withOpacity(0.12),
                              blurRadius: 85.5,
                              offset: const Offset(8.55, 26.65)),
                        ],
                      ),
                      child: Center(
                        child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/servisgo-fyp.appspot.com/o/Default_PFP.png?alt=media&token=c6cec350-3a9b-4c85-a219-a9d5a8a1a3db",
                        ),
                      ),
                    ),
                    Positioned(
                      top: getProportionateScreenHeight(112),
                      right: 0,
                      child: Container(
                        height: getProportionateScreenHeight(48),
                        width: getProportionateScreenWidth(48),
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kCallToAction,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Camera.svg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(36)),
              const ProfileItemTile(
                field: "Name",
                value: "Ayodele Fagbami",
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              const ProfileItemTile(
                field: "Phone",
                value: "+234 8183556281",
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              const ProfileItemTile(
                field: "Email",
                value: "afagbami@gmail.com",
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              const ProfileItemTile(
                field: "Adress",
                value: "16B, Jennifer Rd., Lagos",
              ),
              SizedBox(height: getProportionateScreenHeight(120)),
              DefaultButton(
                text: "Save Changes",
                press: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
