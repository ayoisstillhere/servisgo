// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servisgo/components/nav_page.dart';
import 'package:servisgo/features/auth/domain/entities/user_entity.dart';
import 'package:servisgo/features/menu/presentation/bloc/pfp_cubit/pfp_cubit.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/profile_item_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

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
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(currentUser.pfpURL),
                      ),
                    ),
                    Positioned(
                      top: getProportionateScreenHeight(112),
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                title: const Text(
                                  "Edit Profile Picture",
                                  textAlign: TextAlign.center,
                                ),
                                children: [
                                  SimpleDialogOption(
                                    padding: EdgeInsets.all(
                                        getProportionateScreenWidth(20)),
                                    onPressed: () async {
                                      pickImage(ImageSource.camera, context);
                                    },
                                    child: const Text(
                                      "Take a Photo",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SimpleDialogOption(
                                    padding: EdgeInsets.all(
                                        getProportionateScreenWidth(20)),
                                    onPressed: () {
                                      pickImage(ImageSource.gallery, context);
                                    },
                                    child: const Text(
                                      "Choose From Gallery",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SimpleDialogOption(
                                    padding: EdgeInsets.all(
                                        getProportionateScreenWidth(20)),
                                    child: const Text(
                                      "Cancel",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: getProportionateScreenHeight(48),
                          width: getProportionateScreenWidth(48),
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kCallToAction,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Camera.svg",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(36)),
              ProfileItemTile(
                field: "Name",
                value: currentUser.name,
                uid: currentUser.uid,
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              ProfileItemTile(
                field: "Phone",
                value: currentUser.phoneNumber,
                uid: currentUser.uid,
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              ProfileItemTile(
                field: "Email",
                value: currentUser.email,
                uid: currentUser.uid,
              ),
              SizedBox(height: getProportionateScreenHeight(24)),
              ProfileItemTile(
                field: "Address",
                value: currentUser.address,
                uid: currentUser.uid,
              ),
              SizedBox(height: getProportionateScreenHeight(120)),
            ],
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource source, BuildContext context) async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(source: source);
    Uint8List image = await file!.readAsBytes();

    String pfpUrl = await BlocProvider.of<PfpCubit>(context).uploadImage(image);

    await BlocProvider.of<PfpCubit>(context)
        .updatePFPUrl(pfpUrl, currentUser.uid);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NavPage()));
  }
}
