import 'package:flutter/material.dart';
import 'package:servisgo/size_config.dart';

class SelectProvider extends StatelessWidget {
  const SelectProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select A Service Provider"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: SingleChildScrollView(),
      ),
    );
  }
}
