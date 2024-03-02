import 'package:ecommerce_project/screens/homepage.dart';
import 'package:ecommerce_project/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(
        title: 'Shop all you want',
        image: "assets/images/onboardingimg.png",
        description: 'Select from a wide range of products'),
    WelcomeSlider(
        title: 'Save Time And Effort',
        image: "assets/images/onboardingimg1.jpg",
        description: 'Shop at your convience'),
    WelcomeSlider(
        title: 'Have a great shopping experience',
        image: "assets/images/onboardingimg2.jpg",
        description: '_________')
  ];
  final _pageController = PageController();
  int _currentpage = 0;
  //bool visited=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        isVisited();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.red, fontSize: 16, fontFamily: 'SFUIDisplay'),
                      ))),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentpage = value;
                      });
                    },
                    itemCount: welcomeSlider.length,
                    itemBuilder: (context, index) {
                      final item = welcomeSlider[index];
                      return Column(
                        children: [
                          Image.asset(
                            item.image,
                            height: 350,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //???
                          Text(
                            item.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold, fontFamily: 'SFUIDisplay'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            item.description,
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 20, fontFamily: 'SFUIDisplay'),
                          ),
                        ],
                      );
                    }),
              ),
              Row(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: _currentpage == index ? 30 : 10,
                      decoration: BoxDecoration(
                          color:
                              _currentpage == index ? Colors.red : Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  );
                }),
              )
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            if (_currentpage < welcomeSlider.length-1) {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
            }
            else {
              //navigator to home screen
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => const SignIn()));
              //gotoHome();
              isVisited();
            }
          },
          child: _currentpage != welcomeSlider.length-1
              ? const Icon(Icons.arrow_forward)
              : const Icon(Icons.done),
        ),
      ),
    );
  }
  // void nextPage(){
  //
  // }
  // void gotoHome(){
  // }

  Future<void> isVisited() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool("visited", true);
  }
}

class WelcomeSlider {
  final String title;
  final String description;
  final String image;

  WelcomeSlider(
      {required this.title, required this.image, required this.description});
// WelcomeSlider({required this.description,required this.image,required this.title});

}
