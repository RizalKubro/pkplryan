import 'package:flutter/material.dart';
import 'package:pet_shope/sigleitem.dart';


class Itemswidgets extends StatefulWidget {
  final int activeTabIndex;
  Itemswidgets({required this.activeTabIndex});

  @override
  State<Itemswidgets> createState() => _ItemswidgetsState();
}

class _ItemswidgetsState extends State<Itemswidgets> {
  List<List<String>> catItems = [
    ['27', 'Wiskas makanan kering kucing 800gr', 'Rp. 64.000', 'Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['30', 'Happy cat makanan kering kucing 500gr', 'Rp. 55.000', 'Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['28', 'Nulo makanan kering kucing 800gr', 'Rp. 220.000', 'Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['29', 'Royal Canin makanan kering kucing 800gr', 'Rp. 231.000', 'Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda.']
  ];

  List<List<String>> dogItems = [
    ['33', 'Pedigree dog food 1kg', '100.000','Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['34', 'Royal Canin dog food 1kg', '150.000','Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['35', 'Hills Science dog food 1kg', '200.000','Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['36', 'Iams dog food 1kg', '180.000','Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. ']
  ];

  List<List<String>> birdItems = [
    ['22', 'Bird food type A', '30.000','Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['23', 'Bird food type B', '25.000','Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['24', 'Bird food type C', '35.000','Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. '],
    ['25', 'Bird food type D', '40.000','Juara adalah merek makanan Burung yang mengutamakan kesehatan dan nutrisi hewan peliharaan Anda. ']
  ];

  List<List<String>> getItems() {
    switch (widget.activeTabIndex) {
      case 0:
        return catItems;
      case 1:
        return dogItems;
      case 2:
        return birdItems;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> items = getItems();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Wrap(
            spacing: 15,
            runSpacing: 5,
            children: [
              for (int i = 0; i < items.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleItem(itemDetails: items[i]),
                      ),
                    );
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width / 2) - 30,
                    height: 250,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 167, 83, 45),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                              "images/${items[i][0]}.png",
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 60,
                              height:
                                  (MediaQuery.of(context).size.width / 2) - 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          items[i][1],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Rp ${int.parse(items[i][2].replaceAll(RegExp('[^0-9]'), '')).toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
