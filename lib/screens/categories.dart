import 'package:dokana/widgets/categories_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _catInfo = [
      {
        'imgPath': 'assets/images/cat/fruits.png',
        'catText': 'Fruits',
        'color': const Color(0xff53B175),
      },
      {
        'imgPath': 'assets/images/cat/veg.png',
        'catText': 'Vegetables',
        'color': const Color(0xffF8A44C),
      },
      {
        'imgPath': 'assets/images/cat/Spinach.png',
        'catText': 'Herbs',
        'color': const Color(0xffF7A593),
      },
      {
        'imgPath': 'assets/images/cat/nuts.png',
        'catText': 'Nuts',
        'color': const Color(0xffD3B0E0),
      },
      {
        'imgPath': 'assets/images/cat/spices.png',
        'catText': 'Spices',
        'color': const Color(0xffFDE598),
      },
      {
        'imgPath': 'assets/images/cat/grains.png',
        'catText': 'Grains',
        'color': const Color(0xffB7DFF5),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240/250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return CategoriesWidget(
              categoryName: _catInfo[index]['catText'],
              categoryColor: _catInfo[index]['color'],
              imgPath: _catInfo[index]['imgPath'],
            );
          }),
        ),
      ),
    );
  }
}
