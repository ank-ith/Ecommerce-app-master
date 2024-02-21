import 'package:flutter/material.dart';

import 'widgets/custom_scaffold.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CustomScaffold(
      body: Scaffold(
        body: GridView.count(
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(categories.length, (index) {
            return CategoryCard(category: categories[index]);
          }),
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 1,
    ));
  }
}

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});
}

final List<Category> categories = [
  Category(
      name: 'Jeans',
      imageUrl:
          'https://images.unsplash.com/photo-1592467674817-23092d6d3f3e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDE2fFM0TUtMQXNCQjc0fHxlbnwwfHx8fHw%3D'),
  Category(
      name: 'T-shirts',
      imageUrl:
          'https://images.unsplash.com/photo-1576871337622-98d48d1cf531?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dHNoaXJ0fGVufDB8fDB8fHww'),
  Category(
      name: 'Casuals',
      imageUrl:
          'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDN8fGNhc3VhbCUyMHdlYXJ8ZW58MHx8MHx8fDA%3D'),
  Category(
      name: 'Footwear',
      imageUrl:
          'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGZvb3R3ZWFyfGVufDB8fDB8fHww'),
  Category(
      name: 'Formals',
      imageUrl:
          'https://images.unsplash.com/photo-1472417583565-62e7bdeda490?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTl8fGZvcm1hbHN8ZW58MHx8MHx8fDA%3D'),
  Category(
      name: 'Accessories',
      imageUrl:
          'https://images.unsplash.com/photo-1614715838608-dd527c46231d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTM4fHxhY2Nlc3Nvcmllc3xlbnwwfHwwfHx8MA%3D%3D'),
];

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        category.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        title: Text(
          category.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontFamily: 'SFUIDisplay'),
        ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
    );

    // return Expanded(
    //   child: Card(
    //     elevation: 4,
    //     margin: EdgeInsets.all(8),
    //     child: InkWell(
    //       onTap: () {
    //         // Add onTap action here
    //       },
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           AspectRatio(
    //               aspectRatio: 1.4,
    //               child: Image.network(
    //                 category.imageUrl,
    //                 fit: BoxFit.scaleDown,
    //               )),
    //           SizedBox(height: 8),
    //           Text(
    //             category.name,
    //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //             textAlign: TextAlign.center,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

