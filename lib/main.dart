import 'package:dokana/consts/theme_data.dart';
import 'package:dokana/inner_screen/feeds_screen.dart';
import 'package:dokana/provider/dark_theme_provider.dart';
import 'package:dokana/screens/btm_bar.dart';
import 'package:dokana/screens/orders/orders_screen.dart';
import 'package:dokana/screens/viewed_recently/viewed_recently.dart';
import 'package:dokana/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'inner_screen/on_sale_screen.dart';
import 'inner_screen/product_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return ResponsiveSizer(builder: (context, orientation, screenType) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: Styles.themeData(themeProvider.getDarkTheme, context),
              home: const BottomBarScreen(),
              routes: {
                OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
                FeedsScreen.routeName: (ctx) => const FeedsScreen(),
                ProductDetails.routeName: (ctx) => const ProductDetails(),
                WishlistScreen.routeName: (ctx) => const WishlistScreen(),
                OrdersScreen.routeName: (ctx) => const OrdersScreen(),
                ViewedRecentlyScreen.routeName: (ctx) => const ViewedRecentlyScreen(),
              });
        });
      }),
    );
  }
}
