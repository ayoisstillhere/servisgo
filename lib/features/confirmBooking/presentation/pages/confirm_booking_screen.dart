import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class ConfirmBookingScreen extends StatefulWidget {
  const ConfirmBookingScreen({super.key});

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    _addressController = TextEditingController(
        text: '14C Ola Crescent, High Gardens Estate, Ikota');
    _dateController = TextEditingController(text: 'Sep 15');
    _timeController = TextEditingController(text: '14:00');
    _priceController = TextEditingController(text: '2000');
    super.initState();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirm Booking",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(40)),
              Text(
                "Confirm Service Details",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: kPrimaryColor),
              ),
              SizedBox(height: getProportionateScreenHeight(48)),
              TextFormField(
                controller: _addressController,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: "Home Address",
                  floatingLabelStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: kGreys),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(16),
                  ).copyWith(left: 16),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    child:
                        SvgPicture.asset("assets/icons/locationPinConfirm.svg"),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dateController,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: "Date",
                        floatingLabelStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kGreys),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          child: SvgPicture.asset(
                              "assets/icons/calendarConfirm.svg"),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(8),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(8),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(8)),
                  Expanded(
                    child: TextFormField(
                      controller: _timeController,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: "Time",
                        floatingLabelStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kGreys),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(12)),
                          child:
                              SvgPicture.asset("assets/icons/ClockConfirm.svg"),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(8),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(8),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              TextFormField(
                controller: _priceController,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: "Price",
                  floatingLabelStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: kGreys),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                    child: SvgPicture.asset("assets/icons/DollarConfirm.svg"),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(48)),
              DefaultButton(
                text: "Confirm Booking",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
