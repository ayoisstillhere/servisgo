import 'package:flutter/material.dart';
import 'package:servisgo/size_config.dart';

import '../widgets/service_provider_card.dart';

class SelectProvider extends StatelessWidget {
  SelectProvider({super.key});
  final List serviceProvidersList = [
    const ServiceProviderCard(
      image:
          "https://cdn.pixabay.com/photo/2021/03/21/13/28/woman-6112091_1280.jpg",
      name: "Judith Omole",
      location: "Surulere",
      rating: "4.5 ",
      reviews: "(1234)",
    ),
    const ServiceProviderCard(
      image:
          "https://cdn.pixabay.com/photo/2020/01/20/17/30/look-4780865__480.jpg",
      name: "Stephen Anyanwu",
      location: "Surulere",
      rating: "4.5 ",
      reviews: "(1234)",
    ),
    const ServiceProviderCard(
      image:
          "https://images.unsplash.com/photo-1530785602389-07594beb8b73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fG5pZ2VyaWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
      name: "Blessing Ornu",
      location: "Surulere",
      rating: "4.5 ",
      reviews: "(1234)",
    ),
    const ServiceProviderCard(
      image:
          "https://cdn.pixabay.com/photo/2018/10/11/15/35/angry-boy-3740043__480.jpg",
      name: "Tobi Odusayo",
      location: "Surulere",
      rating: "4.5 ",
      reviews: "(1234)",
    ),
    const ServiceProviderCard(
      image:
          "https://images.unsplash.com/photo-1594564190328-0bed16a89837?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmlnZXJpYW58ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
      name: "Akpan Ibisi",
      location: "Surulere",
      rating: "4.5 ",
      reviews: "(1234)",
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
          return serviceProvidersList[index];
        },
      ),
    );
  }
}
