import 'package:dokana/screens/orders/orders_screen.dart';
import 'package:dokana/screens/viewed_recently/viewed_recently.dart';
import 'package:dokana/screens/wishlist/wishlist_screen.dart';
import 'package:dokana/widgets/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/global_methods.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Hi,  ',
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                      ),
                      children: [
                        TextSpan(
                            text: 'My name',
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('My name pressed');
                              }),
                      ]),
                ),
                const SizedBox(
                  height: 3,
                ),
                const TextWidget(
                  text: 'Email@email.com',
                  textSize: 18,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(height: 2, thickness: 2),
                ),
                _userListTile(
                  icon: Icons.map_outlined,
                  title: 'Address',
                  subTitle: 'sub Address',
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                ),
                _userListTile(
                  icon: IconlyLight.bag,
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        ctx: context, routeName: OrdersScreen.routeName);
                  },
                  title: 'Orders',
                ),
                _userListTile(
                  icon: IconlyLight.heart,
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        ctx: context, routeName: WishlistScreen.routeName);
                  },
                  title: 'Wish list',
                ),
                _userListTile(
                  icon: IconlyLight.show,
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        ctx: context, routeName: ViewedRecentlyScreen.routeName);
                  },
                  title: 'Viewed',
                ),
                _userListTile(
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                  title: 'Forget password',
                ),

                SwitchListTile.adaptive(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'Light Mode',
                    textSize: 22,
                    isTitle: true,
                  ),
                  secondary: themeState.getDarkTheme
                      ? const Icon(Icons.dark_mode_outlined)
                      : const Icon(Icons.light_mode_outlined),
                  value: themeState.getDarkTheme,
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  },
                ),
                _userListTile(
                  icon: IconlyLight.logout,
                  title: 'Log out',
                  onPressed: () async {
                    GlobalMethods.warningDialog(
                      title: 'Log out',
                      context: context,
                      fct: (){},
                      subtitle: 'Do you wanna Sign Out?',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const TextWidget(text: 'Update', textSize: 16),
            content: TextField(
              // onChanged: (value) {
              //   print('_addressTextController.text is ==> ${_addressTextController.text}');
              // },
              controller: _addressTextController,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Your new address',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              ),
            ],
          );
        });
  }

  ListTile _userListTile({
    required String title,
    String? subTitle,
    required GestureTapCallback onPressed,
    required IconData icon,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        textSize: 22,
        isTitle: true,
      ),
      subtitle: Text(subTitle ?? ''),
      leading: Icon(icon),
      onTap: onPressed,
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
