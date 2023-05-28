import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:servisgo/features/auth/domain/entities/user_entity.dart';

import '../../data/models/accepted_service_model.dart';
import '../bloc/accepted_service_cubit/accepted_service_cubit.dart';
import '../widgets/no_results_body.dart';

class TrackerScreen extends StatefulWidget {
  final UserEntity currentUser;
  const TrackerScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  void initState() {
    BlocProvider.of<AcceptedServiceCubit>(context).getAcceptedRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Map Unavailable",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: BlocBuilder<AcceptedServiceCubit, AcceptedServiceState>(
        builder: (_, state) {
          if (state is AcceptedServiceLoaded) {
            final currentService = state.acceptedRequests.firstWhere(
                (acceptedRequest) =>
                    acceptedRequest.customerId == widget.currentUser.uid &&
                    acceptedRequest.serviceStatus == "Pending",
                orElse: () => const AcceptedServiceModel(
                      id: "",
                      customerId: "",
                      partnerId: "",
                      serviceClass: "",
                      serviceStatus: "",
                      scheduledDate: "",
                      scheduledTime: "",
                      servicePrice: "",
                      serviceRating: 0,
                      additionalDetails: "",
                      customerAddress: "",
                      latitudeCustomer: 0,
                      longitudeCustomer: 0,
                      latitudePartner: 0,
                      longitudePartner: 0,
                    ));

            return const NoResultsBody();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
