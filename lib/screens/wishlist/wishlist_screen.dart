import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/text_widget.dart';
import 'wishlist_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
        appBar: AppBar(centerTitle: true,
            leading: const BackWidget(),
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: TextWidget(
              text: 'Wishlist (2)',
              color: color,
              isTitle: true,
              textSize: 22,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  GlobalMethods.warningDialog(
                    title: 'Empty Your wishlist',
                    context: context,
                    fct: (){},
                    subtitle: 'Are you sure?',
                  );
                },
                icon: Icon(
                  IconlyBroken.delete,
                  color: color,
                ),
              ),
            ]),
        body: MasonryGridView.count(
          crossAxisCount: 2,
          // mainAxisSpacing: 16,
          // crossAxisSpacing: 20,
          itemBuilder: (context, index) {
            return const WishlistWidget();
          },
        ));
  }
}
