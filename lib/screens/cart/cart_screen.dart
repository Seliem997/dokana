import 'package:dokana/screens/cart/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Cart (2)',
            color: color,
            isTitle: true,
            textSize: 22,
          ),
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialog(
                  title: 'Empty your Cart',
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
      body: Column(
        children: [
          _checkout(ctx: context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return const CartWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkout({required BuildContext ctx}) {
    final Color color = Utils(ctx).color;
    Size size = Utils(ctx).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      // color: ,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(children: [
          Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextWidget(
                  text: 'Order Now',
                  textSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          FittedBox(
            child: TextWidget(
              text: 'Total: \$0.259',
              color: color,
              textSize: 18,
              isTitle: true,
            ),
          ),
        ]),
      ),
    );
  }
}
