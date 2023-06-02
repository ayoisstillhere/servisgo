import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/partner_entity.dart';

import '../../../../size_config.dart';
import '../bloc/partner_cubit/partner_cubit.dart';
import '../widgets/service_provider_card.dart';

class SelectProvider extends StatefulWidget {
  const SelectProvider({
    Key? key,
    required this.serviceClass,
    required this.currentUser,
  }) : super(key: key);
  final String serviceClass;
  final UserEntity currentUser;

  @override
  State<SelectProvider> createState() => _SelectProviderState();
}

class _SelectProviderState extends State<SelectProvider> {
  @override
  void initState() {
    BlocProvider.of<PartnerCubit>(context).getPartners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerCubit, PartnerState>(
      builder: (_, state) {
        if (state is PartnerLoaded) {
          return _selectBody(context, state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Scaffold _selectBody(BuildContext context, PartnerLoaded partners) {
    List<PartnerEntity> serviceProvidersList = [];
    if (widget.serviceClass != "top") {
      serviceProvidersList = partners.partners
          .where((partner) => partner.serviceClass == widget.serviceClass)
          .toList();
    } else {
      serviceProvidersList = partners.partners.toList();
    }
    serviceProvidersList
        .sort((a, b) => b.averageRating.compareTo(a.averageRating));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select A Service Provider",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: GridView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: getProportionateScreenWidth(24),
          mainAxisSpacing: getProportionateScreenHeight(16),
          childAspectRatio: 0.79166667,
        ),
        itemCount: serviceProvidersList.length,
        itemBuilder: (BuildContext context, int index) {
          final List ratings = serviceProvidersList[index].ratings;
          double sum = 0;
          double avgRating = 0;
          if (ratings.isNotEmpty) {
            for (var rating in ratings) {
              sum += rating;
            }
            avgRating = sum / ratings.length;
          } else {
            avgRating = 0;
          }
          return ServiceProviderCard(
            image: serviceProvidersList[index].partnerPfpURL,
            name: serviceProvidersList[index].partnerName,
            // location: serviceProvidersList[index].location,
            location: "Fixitbro",
            rating: avgRating.toStringAsFixed(1),
            reviews: serviceProvidersList[index].ratings.length.toString(),
            partner: serviceProvidersList[index],
            currentUser: widget.currentUser,
          );
        },
      ),
    );
  }
}
