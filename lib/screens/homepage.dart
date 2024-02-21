import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/screens/product_details.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardItem> products = [];
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
    products = [
      CardItem(
          title: 'shirt 1',
          images: [
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg',
            'assets/images/shirt1.jpg'
          ],
          pricing: '10'),
      CardItem(
          title: 'shirt 2',
          images: [
            'assets/images/shirt2.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '50'),
      CardItem(
          title: 'shirt 3',
          images: [
            'assets/images/shirt3.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '30'),
      CardItem(
          title: 'jean 1',
          images: [
            'assets/images/jean1.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '60'),
      CardItem(
          title: 'jean 2',
          images: [
            'assets/images/jean2.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '30'),
      CardItem(
          title: 'jean 3',
          images: [
            'assets/images/jean3.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '30'),
      CardItem(
          title: 'jean 4',
          images: [
            'assets/images/jean4.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '30'),
      CardItem(
          title: 'tshirt 1',
          images: [
            'assets/images/shirt4.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '30'),
      CardItem(
          title: 'shirt 4',
          images: [
            'assets/images/shirt5.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '30'),
      CardItem(
          title: 'tshirt 2',
          images: [
            'assets/images/shirt6.jpg',
            'assets/images/shirt1.jpg',
            'assets/images/shirt2.jpg',
            'assets/images/shirt3.jpg'
          ],
          pricing: '30'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                      ))
                  // PageView.builder(
                  //     itemCount: banner.length,
                  //     onPageChanged: (int index) {
                  //       setState(() {
                  //
                  //       });
                  //     },
                  //     itemBuilder: (context, index) {
                  //       return Image.asset(
                  //         banner[index],
                  //         fit: BoxFit.cover,
                  //       );
                  //     }),
                  ),
            ),
            GridView.count(
              childAspectRatio: .8,
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children:
                  // products
                  //     .where(
                  //   (element) => element.title
                  //       .toLowerCase()
                  //       .contains(search_text.toLowerCase()),
                  // )
                  //     .map((carditem) {
                  //   return buildCard(carditem);
                  // }).toList()
                  products.map((cardItem) {
                return buildCard(cardItem);
              }).toList(),
            ),
          ],
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 0,
    );
  }

  Widget buildCard(CardItem cardItem) {
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    return Image.asset(
                      cardItem.images[index],
                      fit: BoxFit.scaleDown,
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(cardItem.images.length,
                  (int circleIndex) {
                return Padding(
                  padding: EdgeInsets.all(4.0),
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
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'SFUIDisplay')),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      cardItem.isfav = !cardItem.isfav;
                    });
                  },
                  icon:cardItem.isfav
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
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
      this.isfav = false});
}
