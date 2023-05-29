import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:servisgo/features/home/presentation/bloc/partner_cubit/partner_cubit.dart';
import 'package:servisgo/size_config.dart';

import '../../../../constants.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../data/models/accepted_service_model.dart';
import '../../domain/entities/accepted_service_entity.dart';
import '../bloc/accepted_service_cubit/accepted_service_cubit.dart';
import '../widgets/tracker_info_card.dart';

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
      // appBar: AppBar(
      //   leading: Container(),
      //   title: Text(
      //     "Map Unavailable",
      //     style: Theme.of(context).textTheme.bodyMedium,
      //   ),
      // ),
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
            final partnerLocation = LatLng(
              currentService.latitudePartner!,
              currentService.longitudePartner!,
            );
            final customerLocation = LatLng(
              currentService.latitudeCustomer!,
              currentService.longitudePartner!,
            );

            List<LatLng> polylineCoordinates = [];

            // return const NoResultsBody();
            return TrackerMap(
              customerLocation: customerLocation,
              partnerLocation: partnerLocation,
              polylineCoordinates: polylineCoordinates,
              partnerId: currentService.partnerId,
              acceptedService: currentService,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class TrackerMap extends StatefulWidget {
  const TrackerMap({
    Key? key,
    required this.customerLocation,
    required this.partnerLocation,
    required this.polylineCoordinates,
    required this.partnerId,
    required this.acceptedService,
  }) : super(key: key);

  final LatLng customerLocation;
  final LatLng partnerLocation;

  final List<LatLng> polylineCoordinates;
  final String partnerId;

  final AcceptedServiceEntity acceptedService;

  @override
  State<TrackerMap> createState() => _TrackerMapState();
}

class _TrackerMapState extends State<TrackerMap> {
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(
        widget.partnerLocation.latitude,
        widget.partnerLocation.longitude,
      ),
      PointLatLng(
        widget.customerLocation.latitude,
        widget.customerLocation.longitude,
      ),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => widget.polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    BlocProvider.of<PartnerCubit>(context).getPartners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: widget.customerLocation,
            zoom: 13.5,
          ),
          polylines: {
            Polyline(
              polylineId: const PolylineId("route"),
              points: widget.polylineCoordinates,
              color: kPrimaryColor,
              width: 6,
            ),
          },
          markers: {
            Marker(
              markerId: const MarkerId("Partner"),
              position: widget.partnerLocation,
            ),
            Marker(
              markerId: const MarkerId("Customer"),
              position: widget.customerLocation,
            ),
          },
        ),
        Positioned(
          bottom: getProportionateScreenHeight(66),
          left: getProportionateScreenWidth(32),
          right: getProportionateScreenWidth(32),
          child: BlocBuilder<PartnerCubit, PartnerState>(
            builder: (_, state) {
              if (state is PartnerLoaded) {
                final partner = state.partners.firstWhere(
                    (partner) => partner.partnerId == widget.partnerId);
                return TrackerInfoCard(
                  partner: partner,
                  acceptedService: widget.acceptedService,
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
