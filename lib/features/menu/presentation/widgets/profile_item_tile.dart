import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../pages/update_field_screen.dart';

class ProfileItemTile extends StatelessWidget {
  const ProfileItemTile({
    Key? key,
    required this.field,
    required this.value,
    required this.uid,
  }) : super(key: key);
  final String field;
  final String value;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(64),
          child: Text(
            field,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(color: kGreys),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(60)),
        Expanded(
          child: field != "Email"
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateFieldScreen(
                                  field: field,
                                  uid: uid,
                                  value: value,
                                )));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(6),
                      ),
                      const Divider(),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(6),
                    ),
                    const Divider(),
                  ],
                ),
        ),
      ],
    );
  }
}
