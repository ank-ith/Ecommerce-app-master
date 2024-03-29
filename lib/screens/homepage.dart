import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/screens/product_details.dart';
import 'package:ecommerce_project/screens/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import 'widgets/custom_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String searchKey;
  List<CardItem> products = [
    CardItem(
        title: 'shirt 1',
        images: [
          'assets/images/shirt1-1.jpeg',
          'assets/images/shirt1-2.jpeg',
          'assets/images/shirt1-3.jpeg',
          'assets/images/shirt1-4.jpeg',
        ],
        pricing: '10', isfav: false),
    CardItem(
        title: 'shirt 2',
        images: [
          'assets/images/shirt2-1.jpeg',
          'assets/images/shirt2-2.jpeg',
          'assets/images/shirt2-3.jpeg',
          'assets/images/shirt2-4.jpeg',
        ],
        pricing: '50', isfav: false),
    CardItem(
        title: 'shirt 3',
        images: [
          'assets/images/1.jpeg',
          'assets/images/2.jpeg',
          'assets/images/3.jpeg',
          'assets/images/4.jpeg',
        ],
        pricing: '30', isfav: false),
    CardItem(
        title: 'jean 1',
        images: [
          'assets/images/jean1.jpg',
          'assets/images/shirt1.jpg',
          'assets/images/shirt2.jpg',
          'assets/images/shirt3.jpg'
        ],
        pricing: '60', isfav: false),
    CardItem(
        title: 'jean 2',
        images: [
          'assets/images/jean2.jpg',
          'assets/images/shirt1.jpg',
          'assets/images/shirt2.jpg',
          'assets/images/shirt3.jpg'
        ],
        pricing: '30', isfav: false),
    CardItem(
        title: 'jean 3',
        images: [
          'assets/images/jean3.jpg',
          'assets/images/shirt1.jpg',
          'assets/images/shirt2.jpg',
          'assets/images/shirt3.jpg'
        ],
        pricing: '30', isfav: false),
    CardItem(
        title: 'jean 4',
        images: [
          'assets/images/jean4.jpg',
          'assets/images/shirt1.jpg',
          'assets/images/shirt2.jpg',
          'assets/images/shirt3.jpg'
        ],
        pricing: '30', isfav: false),
    CardItem(
        title: 'tshirt 1',
        images: [
          'assets/images/shirt4.jpg',
          'assets/images/shirt1.jpg',
          'assets/images/shirt2.jpg',
          'assets/images/shirt3.jpg'
        ],
        pricing: '30', isfav: false),
    CardItem(
        title: 'shirt 4',
        images: [
          'assets/images/shirt5.jpg',
          'assets/images/shirt1.jpg',
          'assets/images/shirt2.jpg',
          'assets/images/shirt3.jpg'
        ],
        pricing: '30', isfav: false),
    CardItem(
        title: 'tshirt 2',
        images: [
          'assets/images/shirt6.jpg',
          'assets/images/shirt1.jpg',
          'assets/images/shirt2.jpg',
          'assets/images/shirt3.jpg'
        ],
        pricing: '30', isfav: false),
  ];
  List<String> banner = [
    'assets/images/banner/banner1.jpg',
    'assets/images/banner/banner2.jpg',
    'assets/images/banner/banner3.jpg'
  ];
  int _bannerIndex = 0;
  late int passsing_index;

  @override
  void initState() {
    // getSearchText();
    super.initState();
    searchKey = '';
  }

  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
      onSearchTextChanged: (String text) {
        setState(() {
          searchKey = text;
        });
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
            //   child: Container(child: Image.asset('assets/images/banner/banner1.jpg'),),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: CarouselSlider(
                      items: banner.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              imageUrl,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlayCurve: Curves.linear,
                        viewportFraction: 1,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        autoPlay: true,
                        height: 250.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, _) {
                          setState(() {
                            _bannerIndex = index;
                          });
                        },
                      ))),
            ),
            GridView.count(
                childAspectRatio: .8,
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: products
                    .where(
                  (element) => element.title
                      .toLowerCase()
                      .contains(searchKey.toLowerCase()),
                )
                    .map((carditem) {
                  return buildCard(carditem);
                }).toList()
                //     products.map((cardItem) {
                //   return buildCard(cardItem);
                // }).toList(),
                ),
          ],
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 0,
    );
  }

  Widget buildCard(CardItem cardItem) {
    final favprovider =
    Provider.of<FavProvider>(context, listen: false);
    return GestureDetector(
      onTap: () async {
        passsing_index = products.indexOf(cardItem);
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(
                received_card: products[passsing_index],
              ),
            ));
      },
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              child: PageView.builder(
                  itemCount: cardItem.images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      cardItem.currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image(
                      image: AssetImage(cardItem.images[index]),
                      height: 80,
                      width: 80,
                      fit: BoxFit.scaleDown,
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(cardItem.images.length,
                  (int circleIndex) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: circleIndex == cardItem.currentIndex
                        ? Colors.blue
                        : Colors.green,
                  ),
                );
              }),
            ),
            ListTile(
                title: Text(
                  cardItem.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'SFUIDisplay'),
                ),
                subtitle: Text('\$${cardItem.pricing}',
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay')),
                trailing:
                // SizedBox(
                //     height: 30,
                //     width: 30,
                //     child: Center(
                //         child: LikeButton(isLiked: cardItem.isfav,
                //       size: 25,
                //     )))
                IconButton(
                    onPressed: () {
                      if (favprovider.favorites.contains(FavItem(name: cardItem.title, price: cardItem.pricing, image: cardItem.images[0]))==false/*cardItem.isfav == false*/) {
                        favprovider.addToFav(FavItem(
                            name: cardItem.title,
                            price: cardItem.pricing,
                            image: cardItem.images[0]));
                      } else {
                        favprovider.removeFav(FavItem(
                            name: cardItem.title,
                            price: cardItem.pricing,
                            image: cardItem.images[0]));
                      }
                      // setState(() {
                      //  // products[cardItem.currentIndex].isfav=!products[cardItem.currentIndex].isfav;
                      //  // products[products.indexOf(cardItem)].isfav=!products[products.indexOf(cardItem)].isfav;
                      //   cardItem.isfav = !cardItem.isfav;
                      //  });
                    },
                    icon:favprovider.favorites.contains(FavItem(name: cardItem.title, price: cardItem.pricing, image: cardItem.images[0]))
                  //cardItem.isfav
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          )),
                )
          ],
        ),
      ),
    );
  }
}

class CardItem {
  final String title;
  final String pricing;
  final List<String> images;
  int currentIndex;
  bool isfav;

  CardItem(
      {required this.title,
      required this.images,
      required this.pricing,
      this.currentIndex = 0,
      required this.isfav });
}
