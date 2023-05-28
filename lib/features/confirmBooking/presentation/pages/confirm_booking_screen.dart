import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';
import '../../../../components/nav_page.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/widgets/form_error.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../bloc/job_request_cubit/job_request_cubit.dart';

class ConfirmBookingScreen extends StatefulWidget {
  final String price;
  final UserEntity currentUser;
  final String serviceClass;
  const ConfirmBookingScreen({
    Key? key,
    required this.price,
    required this.currentUser,
    required this.serviceClass,
  }) : super(key: key);

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  LocationData? currentLocation;
  DateTime currentDateTime = DateTime.now();
  int currentMonth = DateTime.now().month;
  List<String> monthAbbreviations = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  late String currentMonthAbbreviation;
  final _createJobRequestFormKey = GlobalKey<FormState>();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _additionalDetailsContoller = TextEditingController();
  final List<String> errors = [];

  @override
  void initState() {
    currentMonthAbbreviation =
        monthAbbreviations[currentMonth - 1]; // Initialize here
    _addressController =
        TextEditingController(text: widget.currentUser.address);
    _dateController = TextEditingController(
        text: '$currentMonthAbbreviation ${currentDateTime.day}');
    _timeController = TextEditingController(
        text:
            '${currentDateTime.hour.toString().padLeft(2, '0')}:${currentDateTime.minute.toString().padLeft(2, '0')}');
    _priceController = TextEditingController(text: widget.price);
    _additionalDetailsContoller = TextEditingController();
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _priceController.dispose();
    _additionalDetailsContoller.dispose();
    super.dispose();
  }

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      if (mounted) {
        setState(() {});
      }
    });
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
          "Confirm Booking",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: BlocConsumer<JobRequestCubit, JobRequestState>(
        listener: (context, state) {
          if (state is JobRequestSuccess) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const NavPage()));
          }
          if (state is JobRequestFailure) {
            errors.clear();
            addError(error: state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is JobRequestLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32)),
            child: SingleChildScrollView(
              child: Form(
                key: _createJobRequestFormKey,
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
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          child: SvgPicture.asset(
                              "assets/icons/locationPinConfirm.svg"),
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
                          child: GestureDetector(
                            onTap: () async {
                              final date = await _pickDate();
                              if (date == null) return; // pressed cancel
                              setState(() {
                                _dateController = TextEditingController(
                                    text:
                                        '${monthAbbreviations[date.month - 1]} ${date.day}');
                              });
                            },
                            child: TextFormField(
                              controller: _dateController,
                              enabled: false,
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(8)),
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
                        ),
                        SizedBox(width: getProportionateScreenWidth(8)),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final time = await _pickTime();
                              if (time == null) return; // pressed cancel
                              setState(() {
                                _timeController = TextEditingController(
                                    text:
                                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}');
                              });
                            },
                            child: TextFormField(
                              controller: _timeController,
                              enabled: false,
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(12)),
                                  child: SvgPicture.asset(
                                      "assets/icons/ClockConfirm.svg"),
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
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(12)),
                          child: SvgPicture.asset(
                              "assets/icons/DollarConfirm.svg"),
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
                    TextFormField(
                      controller: _additionalDetailsContoller,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Additional Details",
                        floatingLabelStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kGreys),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(16),
                        ).copyWith(left: 16),
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
                    SizedBox(height: getProportionateScreenHeight(36)),
                    FormError(errors: errors),
                    DefaultButton(
                      text: "Confirm Booking",
                      press: _createJobRequest,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<DateTime?> _pickDate() => showDatePicker(
        context: context,
        initialDate: currentDateTime,
        firstDate: DateTime(2023),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> _pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: currentDateTime.hour, minute: currentDateTime.minute),
      );

  void _createJobRequest() async {
    await BlocProvider.of<JobRequestCubit>(context).createJobRequest(
      serviceClass: widget.serviceClass,
      scheduledTime: _timeController.text.trim(),
      scheduledDate: _dateController.text.trim(),
      address: _addressController.text.trim(),
      city: widget.currentUser.city,
      state: widget.currentUser.state,
      latitude: currentLocation!.latitude,
      longitude: currentLocation!.longitude,
      additionalDetails: _additionalDetailsContoller.text.trim(),
      price: _priceController.text.trim(),
    );
  }
}
