import 'package:blur/blur.dart';
import 'package:ecommerce_project/screens/account_settings.dart';
import 'package:ecommerce_project/screens/favorites.dart';
import 'package:ecommerce_project/screens/homepage.dart';
import 'package:ecommerce_project/screens/orders.dart';
import 'package:ecommerce_project/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/custom_scaffold.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  void initState() {
    super.initState();
    getNameEmail();
  }

  late String name;
  late String email;
  late bool isLoggedIn = false;

  Future<void> getNameEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? 'No Email';
      isLoggedIn = prefs.getBool('isloggedin') ?? false;
    });
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored values
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: false,
      body: isLoggedIn
          ? Column(
              children: [
                Expanded(
                  child: Material(
                    elevation: 5,
                    child: Container(
                      color: Colors.green,
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            const Divider(),
                            Center(
                              child: Text(
                                email,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'SFUIDisplay',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Material(
                        elevation: 5,
                        child: ListTile(
                          title: const Text(
                            'My Orders',
                            style: TextStyle(fontFamily: 'SFUIDisplay'),
                          ),
                          leading:
                              const Icon(Icons.shopping_bag, color: Colors.green),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OrderHistoryScreen(),
                            ));
                          },
                        ),
                      ),
                      const Divider(),
                      Material(
                        elevation: 5,
                        child: ListTile(
                          title: const Text(
                            'Favourites',
                            style: TextStyle(fontFamily: 'SFUIDisplay'),
                          ),
                          leading: const Icon(Icons.favorite, color: Colors.green),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Fav_screen(),
                            ));
                          },
                        ),
                      ),
                      const Divider(),
                      Material(
                        elevation: 5,
                        child: ListTile(
                          title: const Text(
                            'Account Settings',
                            style: TextStyle(fontFamily: 'SFUIDisplay'),
                          ),
                          leading: const Icon(Icons.person, color: Colors.green),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AccountSettingsScreen(),
                            ));
                          },
                        ),
                      ),
                      const Divider(),
                      Material(
                        elevation: 5,
                        child: ListTile(
                          title: const Text(
                            'Logout',
                            style: TextStyle(fontFamily: 'SFUIDisplay'),
                          ),
                          leading: const Icon(Icons.exit_to_app, color: Colors.green),
                          onTap: () {
                            showLogoutDialog(context);
                            logout();
                          },
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            )
          : Stack(children: [
              Blur(
                blur: 2.5,
                blurColor: Theme.of(context).primaryColorLight,
                child: Column(
                  children: [
                    Expanded(
                      child: Material(
                        elevation: 5,
                        child: Container(
                          color: Colors.green,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.grey,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                const Divider(),
                                Center(
                                  child: Text(
                                    email,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'SFUIDisplay',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          Material(
                            elevation: 5,
                            child: ListTile(
                              title: const Text(
                                'My Orders',
                                style: TextStyle(fontFamily: 'SFUIDisplay'),
                              ),
                              leading:
                                  const Icon(Icons.shopping_bag, color: Colors.green),
                              onTap: () {},
                            ),
                          ),
                          const Divider(),
                          Material(
                            elevation: 5,
                            child: ListTile(
                              title: const Text(
                                'Favourites',
                                style: TextStyle(fontFamily: 'SFUIDisplay'),
                              ),
                              leading:
                                  const Icon(Icons.favorite, color: Colors.green),
                              onTap: () {},
                            ),
                          ),
                          const Divider(),
                          Material(
                            elevation: 5,
                            child: ListTile(
                              title: const Text(
                                'Account Settings',
                                style: TextStyle(fontFamily: 'SFUIDisplay'),
                              ),
                              leading: const Icon(Icons.person, color: Colors.green),
                              onTap: () {},
                            ),
                          ),
                          const Divider(),
                          Material(
                            elevation: 5,
                            child: ListTile(
                              title: const Text(
                                'Logout',
                                style: TextStyle(fontFamily: 'SFUIDisplay'),
                              ),
                              leading:
                                  const Icon(Icons.exit_to_app, color: Colors.green),
                              onTap: () {},
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AlertDialog(
                title: const Text(
                  'User not logged in',
                  style: TextStyle(fontFamily: 'SFUIDisplay'),
                ),
                content: const Text(
                  'Please login or sign up to continue',
                  style: TextStyle(fontFamily: 'SFUIDisplay'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ));
                    },
                    child: const Text(
                      'Ok',
                      style: TextStyle(fontFamily: 'SFUIDisplay'),
                    ),
                  ),
                ],
              ),
            ]),
      showBottomNavBar: true,
      initialIndex: 2,
    );
  }
}

void showLogoutDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log out'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              child: const Text('Ok'),
            )
          ],
          content: const Text('Successfully logged out'),
        );
      });
}
