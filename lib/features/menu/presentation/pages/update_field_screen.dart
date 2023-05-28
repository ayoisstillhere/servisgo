import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/widgets/form_error.dart';

import '../../../../components/default_button.dart';
import '../../../../components/nav_page.dart';
import '../../../../size_config.dart';
import '../../../auth/presentation/widgets/form_header.dart';
import '../../../home/presentation/bloc/user_cubit/user_cubit.dart';

class UpdateFieldScreen extends StatefulWidget {
  const UpdateFieldScreen({
    Key? key,
    required this.field,
    required this.uid,
    required this.value,
  }) : super(key: key);
  final String field;
  final String uid;
  final String value;

  @override
  State<UpdateFieldScreen> createState() => _UpdateFieldScreenState();
}

class _UpdateFieldScreenState extends State<UpdateFieldScreen> {
  TextEditingController _fieldController = TextEditingController();
  String? selectedState;
  String? selectedCity;

  final List<String> errors = [];

  List<NigeriaLocation> nigeriaLocations = [
    NigeriaLocation(
      state: 'Lagos',
      cities: ['Ikeja', 'Lekki', 'V.I'],
    ),
    NigeriaLocation(
      state: 'Abuja',
      cities: ['Garki', 'Wuse', 'Maitama'],
    ),
    NigeriaLocation(
      state: 'Ogun',
      cities: ['Abeokuta', 'Ijebu-Ode', 'Sagamu'],
    ),
    // Add more states and cities as needed
  ];

  List<DropdownMenuItem<String>> _buildStateDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var location in nigeriaLocations) {
      items.add(
        DropdownMenuItem(
          value: location.state,
          child: Text(location.state),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> _buildCityDropdownItems(String selectedState) {
    List<DropdownMenuItem<String>> items = [];
    for (var location in nigeriaLocations) {
      if (location.state == selectedState) {
        for (var city in location.cities) {
          items.add(
            DropdownMenuItem(
              value: city,
              child: Text(city),
            ),
          );
        }
        break;
      }
    }
    return items;
  }

  @override
  void initState() {
    _fieldController = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  void dispose() {
    _fieldController.dispose();
    super.dispose();
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
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
        child: Form(
          child: Column(
            children: [
              FormHeader(
                title: "Update ${widget.field}",
                subtitle:
                    "Enter the new ${widget.field} you want to update to!",
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              TextFormField(
                controller: _fieldController,
              ),
              widget.field == "Address"
                  ? SizedBox(height: getProportionateScreenHeight(30))
                  : const SizedBox(height: 0, width: 0),
              widget.field == "Address"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(132),
                          child: DropdownButtonFormField<String>(
                            value: selectedState,
                            items: _buildStateDropdownItems(),
                            onChanged: (value) {
                              setState(() {
                                selectedState = value;
                                selectedCity =
                                    null; // Reset the selected city when state changes
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'State',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(132),
                          child: DropdownButtonFormField<String>(
                            value: selectedCity,
                            items: selectedState != null
                                ? _buildCityDropdownItems(selectedState!)
                                : [],
                            onChanged: (value) {
                              setState(() {
                                selectedCity = value;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'City',
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(height: 0, width: 0),
              SizedBox(height: getProportionateScreenHeight(36)),
              FormError(errors: errors),
              widget.field != "Address"
                  ? DefaultButton(
                      text: "Submit",
                      press: () {
                        update();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavPage()));
                      },
                    )
                  : DefaultButton(
                      text: "Submit Address",
                      press: () {
                        if (selectedCity != null &&
                            selectedState != null &&
                            _fieldController.text.trim() != "") {
                          updateAddress();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavPage()));
                        } else {
                          addError(error: "Please Fill all Fields");
                        }
                      },
                    ),
              SizedBox(height: getProportionateScreenHeight(16)),
            ],
          ),
        ),
      ),
    );
  }

  void update() async {
    if (widget.field == "Name") {
      await BlocProvider.of<UserCubit>(context)
          .updateNameUsecase(_fieldController.text.trim(), widget.uid);
    } else if (widget.field == "Phone") {
      await BlocProvider.of<UserCubit>(context)
          .updatePhoneUsecase(_fieldController.text.trim(), widget.uid);
    }
  }

  void updateAddress() async {
    await BlocProvider.of<UserCubit>(context).updateAddress(
        _fieldController.text.trim(),
        selectedCity!,
        selectedState!,
        widget.uid);
  }
}

class NigeriaLocation {
  final String state;
  final List<String> cities;

  NigeriaLocation({required this.state, required this.cities});
}
