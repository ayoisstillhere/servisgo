import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../tracker/domain/entities/accepted_service_entity.dart';
import '../../../tracker/presentation/bloc/accepted_service_cubit/accepted_service_cubit.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isPending = false;
  bool isCompleted = false;
  bool isAll = true;

  @override
  void initState() {
    BlocProvider.of<AcceptedServiceCubit>(context).getAcceptedRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(
          width: 0,
          height: 0,
        ),
        title: Text(
          "Order History",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAll = true;
                      isCompleted = false;
                      isPending = false;
                    });
                  },
                  child: Container(
                    width: getProportionateScreenWidth(48),
                    height: getProportionateScreenHeight(48),
                    decoration: BoxDecoration(
                        color: isAll ? primaryColor : const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "All",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: isAll ? kBgColor : kBlacks,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAll = false;
                      isCompleted = true;
                      isPending = false;
                    });
                  },
                  child: Container(
                    width: getProportionateScreenWidth(126.39),
                    height: getProportionateScreenHeight(48),
                    decoration: BoxDecoration(
                        color: isCompleted
                            ? primaryColor
                            : const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "Completed",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: isCompleted ? kBgColor : kBlacks,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAll = false;
                      isCompleted = false;
                      isPending = true;
                    });
                  },
                  child: Container(
                    width: getProportionateScreenWidth(126.39),
                    height: getProportionateScreenHeight(48),
                    decoration: BoxDecoration(
                        color:
                            isPending ? primaryColor : const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "Pending",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: isPending ? kBgColor : kBlacks,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(32)),
            BlocBuilder<AcceptedServiceCubit, AcceptedServiceState>(
              builder: (context, state) {
                if (state is AcceptedServiceLoaded) {
                  List<AcceptedServiceEntity> requests = [];
                  for (AcceptedServiceEntity request
                      in state.acceptedRequests) {
                    if (request.customerId == widget.currentUser.uid) {
                      requests.add(request);
                    }
                  }
                  List<AcceptedServiceEntity> completeRequests = [];
                  List<AcceptedServiceEntity> pendingRequests = [];
                  for (AcceptedServiceEntity request in requests) {
                    if (request.serviceStatus == "Completed") {
                      completeRequests.add(request);
                    } else if (request.serviceStatus == "Pending") {
                      pendingRequests.add(request);
                    }
                  }
                  if (isAll) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return HistoryCard(
                            status: requests[index].serviceStatus,
                            price: requests[index].servicePrice,
                            service: requests[index].serviceClass,
                            date: requests[index].scheduledDate,
                            partnerId: requests[index].partnerId,
                          );
                        },
                        itemCount: requests.length,
                        shrinkWrap: true,
                      ),
                    );
                  }
                  if (isCompleted) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return HistoryCard(
                            status: completeRequests[index].serviceStatus,
                            price: completeRequests[index].servicePrice,
                            service: completeRequests[index].serviceClass,
                            date: completeRequests[index].scheduledDate,
                            partnerId: requests[index].partnerId,
                          );
                        },
                        itemCount: completeRequests.length,
                        shrinkWrap: true,
                      ),
                    );
                  }
                  if (isPending) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return HistoryCard(
                            status: pendingRequests[index].serviceStatus,
                            price: pendingRequests[index].servicePrice,
                            service: pendingRequests[index].serviceClass,
                            date: pendingRequests[index].scheduledDate,
                            partnerId: requests[index].partnerId,
                          );
                        },
                        itemCount: pendingRequests.length,
                        shrinkWrap: true,
                      ),
                    );
                  }
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
