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
      state: 'Abia',
      cities: ['Aba', 'Arochukwu', 'Umuahia'],
    ),
    NigeriaLocation(
      state: 'Adamawa',
      cities: ['Jimeta', 'Mubi', 'Numan', 'Yola'],
    ),
    NigeriaLocation(
      state: 'Akwa Ibom',
      cities: ['Ikot Abasi', 'Ikot Ekpene', 'Oron', 'Uyo'],
    ),
    NigeriaLocation(
      state: 'Anambra',
      cities: ['Awka', 'Onitsha'],
    ),
    NigeriaLocation(
      state: 'Bauchi',
      cities: ['Azare', 'Bauchi', 'Jama′are', 'Katagum', 'Misau'],
    ),
    NigeriaLocation(
      state: 'Bayelsa',
      cities: ['Brass'],
    ),
    NigeriaLocation(
      state: 'Benue',
      cities: ['Makurdi'],
    ),
    NigeriaLocation(
      state: 'Borno',
      cities: ['Biu', 'Dikwa', 'Maiduguri'],
    ),
    NigeriaLocation(
      state: 'Cross River',
      cities: ['Calabar', 'Ogoja'],
    ),
    NigeriaLocation(
      state: 'Delta',
      cities: ['Asaba', 'Burutu', 'Koko', 'Sapele', 'Ughelli', 'Warri'],
    ),
    NigeriaLocation(
      state: 'Ebonyi',
      cities: ['Abakaliki'],
    ),
    NigeriaLocation(
      state: 'Edo',
      cities: ['Benin City'],
    ),
    NigeriaLocation(
      state: 'Ekiti',
      cities: ['Ado-Ekiti', 'Effon-Alaiye', 'Ikere-Ekiti'],
    ),
    NigeriaLocation(
      state: 'Enugu',
      cities: ['Enugu', 'Nsukka'],
    ),
    NigeriaLocation(
      state: 'Federal Capital Territory',
      cities: ['Abuja'],
    ),
    NigeriaLocation(
      state: 'Gombe',
      cities: ['Deba Habe', 'Gombe', 'Kumo'],
    ),
    NigeriaLocation(
      state: 'Imo',
      cities: ['Owerri'],
    ),
    NigeriaLocation(
      state: 'Jigawa',
      cities: ['Birnin Kudu', 'Dutse', 'Gumel', 'Hadejia', 'Kazaure'],
    ),
    NigeriaLocation(
      state: 'Kaduna',
      cities: ['Jemaa', 'Kaduna', 'Zaria'],
    ),
    NigeriaLocation(
      state: 'Kano',
      cities: ['Kano'],
    ),
    NigeriaLocation(
      state: 'Katsina',
      cities: ['Daura', 'Katsina'],
    ),
    NigeriaLocation(
      state: 'Kebbi',
      cities: ['Argungu', 'Birnin Kebbi', 'Gwandu', 'Yelwa'],
    ),
    NigeriaLocation(
      state: 'Kogi',
      cities: ['Idah', 'Kabba', 'Lokoja', 'Okene'],
    ),
    NigeriaLocation(
      state: 'Kwara',
      cities: ['Ilorin', 'Jebba', 'Lafiagi', 'Offa', 'Pategi'],
    ),
    NigeriaLocation(
      state: 'Lagos',
      cities: [
        'Badagry',
        'Epe',
        'Ikeja',
        'Ikorodu',
        'Lagos',
        'Mushin',
        'Shomolu',
        'Lekki',
        'Ajah'
      ],
    ),
    NigeriaLocation(
      state: 'Nasarawa',
      cities: ['Keffi', 'Lafia', 'Nasarawa'],
    ),
    NigeriaLocation(
      state: 'Niger',
      cities: [
        'Agaie',
        'Baro',
        'Bida',
        'Kontagora',
        'Lapai',
        'Minna',
        'Suleja'
      ],
    ),
    NigeriaLocation(
      state: 'Ogun',
      cities: ['Abeokuta', 'Ijebu-Ode', 'Ilaro', 'Shagamu'],
    ),
    NigeriaLocation(
      state: 'Ondo',
      cities: ['Akure', 'Ikare', 'Oka-Akoko', 'Ondo', 'Owo'],
    ),
    NigeriaLocation(
      state: 'Osun',
      cities: [
        'Ede',
        'Ikire',
        'Ikirun',
        'Ila',
        'Ile-Ife',
        'Ilesha',
        'Ilobu',
        'Inisa',
        'Iwo',
        'Oshogbo'
      ],
    ),
    NigeriaLocation(
      state: 'Oyo',
      cities: ['Ibadan', 'Iseyin', 'Ogbomosho', 'Oyo', 'Saki'],
    ),
    NigeriaLocation(
      state: 'Plateau',
      cities: ['Bukuru', 'Jos', 'Vom', 'Wase'],
    ),
    NigeriaLocation(
      state: 'Rivers',
      cities: ['Bonny', 'Degema', 'Okrika', 'Port Harcourt'],
    ),
    NigeriaLocation(
      state: 'Sokoto',
      cities: ['Sokoto'],
    ),
    NigeriaLocation(
      state: 'Taraba',
      cities: ['Ibi', 'Jalingo', 'Muri'],
    ),
    NigeriaLocation(
      state: 'Yobe',
      cities: ['Damaturu', 'Nguru'],
    ),
    NigeriaLocation(
      state: 'Zamfara',
      cities: ['Gusau', 'Kaura Namoda'],
    ),
  ];

  List<DropdownMenuItem<String>> _buildStateDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var location in nigeriaLocations) {
      final truncatedText = location.state.length > 7
          ? '${location.state.substring(0, 7)}...' // Truncate text if longer than 15 characters
          : location.state;

      items.add(
        DropdownMenuItem(
          value: location.state,
          child: Tooltip(
            message: location.state,
            child: Text(truncatedText),
          ),
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
          final truncatedText = city.length > 8
              ? '${city.substring(0, 8)}...' // Truncate text if longer than 15 characters
              : city;

          items.add(
            DropdownMenuItem(
              value: city,
              child: Tooltip(
                message: city,
                child: Text(truncatedText),
              ),
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
