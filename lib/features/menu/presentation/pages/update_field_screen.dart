import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:servisgo/components/default_button.dart';
import 'package:servisgo/components/nav_page.dart';
import 'package:servisgo/features/auth/presentation/widgets/form_header.dart';
import 'package:servisgo/features/home/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:servisgo/size_config.dart';

class UpdateFieldScreen extends StatefulWidget {
  const UpdateFieldScreen({
    Key? key,
    required this.field,
    required this.uid,
  }) : super(key: key);
  final String field;
  final String uid;

  @override
  State<UpdateFieldScreen> createState() => _UpdateFieldScreenState();
}

class _UpdateFieldScreenState extends State<UpdateFieldScreen> {
  TextEditingController _fieldController = TextEditingController();

  @override
  void initState() {
    _fieldController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update ${widget.field}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32))
                .copyWith(top: getProportionateScreenHeight(36)),
        child: Column(
          children: [
            FormHeader(
              title: "Update ${widget.field}",
              subtitle: "Enter the new ${widget.field} you want to update to!",
            ),
            SizedBox(height: getProportionateScreenHeight(36)),
            TextFormField(
              controller: _fieldController,
            ),
            SizedBox(height: getProportionateScreenHeight(36)),
            DefaultButton(
              text: "Submit",
              press: () {
                update();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NavPage()));
              },
            ),
            SizedBox(height: getProportionateScreenHeight(16)),
          ],
        ),
      ),
    );
  }

  void update() async {
    if (widget.field == "Name") {
      await BlocProvider.of<UserCubit>(context)
          .updateNameUsecase(_fieldController.text.trim(), widget.uid);
    } else if (widget.field == "Phone") {
      await BlocProvider.of<UserCubit>(context).updatePhoneUsecase(
          _fieldController.text.trim(), widget.uid);
    } else if (widget.field == "Address") {
      await BlocProvider.of<UserCubit>(context).updateAddressUsecase(
          _fieldController.text.trim(), widget.uid);
    }
  }
}
