import 'package:card_swiper/card_swiper.dart';
import 'package:dokana/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../services/utils.dart';
import '../widgets/on_sale_widget.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    // final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    final List<String> _offerImages = [
      'assets/images/offres/Offer1.jpg',
      'assets/images/offres/Offer2.jpg',
      'assets/images/offres/Offer3.jpg',
      'assets/images/offres/Offer4.jpg'
    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  _offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: false,
              itemCount: _offerImages.length,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red)),
              // control: const SwiperControl(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextButton(
            onPressed: () {},
            child: const TextWidget(
              text: 'View all',
              maxLines: 1,
              color: Colors.blue,
              textSize: 20,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On Sale'.toUpperCase(),
                        textSize: 20,
                        isTitle: true,
                        color: Colors.red,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: size.height * 0.24,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return const OnSaleWidget();
                      }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
