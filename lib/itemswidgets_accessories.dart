import 'package:flutter/material.dart';
import 'package:pet_shope/singleitemacessories.dart';


class ItemswidgetsAccessories extends StatefulWidget {
  final int activeTabIndex;
  ItemswidgetsAccessories({required this.activeTabIndex});

  @override
  State<ItemswidgetsAccessories> createState() => _ItemswidgetsState();
}

class _ItemswidgetsState extends State<ItemswidgetsAccessories> {
  List<List<String>> catItems = [
    ['8', 'Hoodie Kucing Gucci Geng set Kacanmata', 'Rp. 64.000', 'Kacamata kucing universal, untuk mempercantik dan mempergagah kucing peliharaan anda, kacamata ini terdapat beberapa model seperti gambar diatas, silahkan di C.O.'],
    ['9', 'Costume Bidadari Kucing Cewek', 'Rp. 55.000', 'Kacamata kucing universal, untuk mempercantik dan mempergagah kucing peliharaan anda, kacamata ini terdapat beberapa model seperti gambar diatas, silahkan di C.O.'],
    ['10', 'Hoodie Kucing Superme', 'Rp. 220.000', 'Kacamata kucing universal, untuk mempercantik dan mempergagah kucing peliharaan anda, kacamata ini terdapat beberapa model seperti gambar diatas, silahkan di C.O. '],
    ['11', 'Syal Kucing', 'Rp. 231.000', 'Kacamata kucing universal, untuk mempercantik dan mempergagah kucing peliharaan anda, kacamata ini terdapat beberapa model seperti gambar diatas, silahkan di C.O.'],
    ['12', 'Kacamata Kucing Universal', 'Rp. 231.000', 'Kacamata kucing universal, untuk mempercantik dan mempergagah kucing peliharaan anda, kacamata ini terdapat beberapa model seperti gambar diatas, silahkan di C.O.'],
    ['13', 'Syal Kucing', 'Rp. 231.000', 'Kacamata kucing universal, untuk mempercantik dan mempergagah kucing peliharaan anda, kacamata ini terdapat beberapa model seperti gambar diatas, silahkan di C.O.']
  ];

  List<List<String>> dogItems = [
    ['15', 'Topi NY Anjing Lucu', 'Rp. 100.000','Costume Anjing Perempuan, untuk mempercantik Anjing Lucu peliharaan anda, Costume ini di khususkan untuk anjing perempuan, Silahkan Di C.O.'],
    ['16', 'Hoddie Superme Anjing', 'Rp. 150.000','Costume Anjing Perempuan, untuk mempercantik Anjing Lucu peliharaan anda, Costume ini di khususkan untuk anjing perempuan, Silahkan Di C.O.'],
    ['17', 'Hoddie anjing set tas', 'Rp. 200.000','Costume Anjing Perempuan, untuk mempercantik Anjing Lucu peliharaan anda, Costume ini di khususkan untuk anjing perempuan, Silahkan Di C.O.'],
    ['18', 'Hoddie Superme Anjing', 'Rp. 180.000','Costume Anjing Perempuan, untuk mempercantik Anjing Lucu peliharaan anda, Costume ini di khususkan untuk anjing perempuan, Silahkan Di C.O.'],
    ['19', 'Costume Anjing Lucu', 'Rp. 180.000','Costume Anjing Perempuan, untuk mempercantik Anjing Lucu peliharaan anda, Costume ini di khususkan untuk anjing perempuan, Silahkan Di C.O.'],
    ['20', 'Kalung Ajing', 'Rp. 180.000','Costume Anjing Perempuan, untuk mempercantik Anjing Lucu peliharaan anda, Costume ini di khususkan untuk anjing perempuan, Silahkan Di C.O.']
  ];

  List<List<String>> birdItems = [
    ['2', 'variasi sangkar burung', 'Rp. 30.000', 'Tempat makan burung dengan model gantung, berguna untuk menaikkan nafsu makan burung peliharaan anda, minat silahkan di C.O.'],
    ['3', 'Mainan Jembatan Burung', 'Rp. 25.000', 'Tempat makan burung dengan model gantung, berguna untuk menaikkan nafsu makan burung peliharaan anda, minat silahkan di C.O.'],
    ['4', 'Mainan Jembatan Burung', 'Rp. 35.000', 'Tempat makan burung dengan model gantung, berguna untuk menaikkan nafsu makan burung peliharaan anda, minat silahkan di C.O.'],
    ['5', 'Gantungan Sangkar Burung', 'Rp. 40.000', 'Tempat makan burung dengan model gantung, berguna untuk menaikkan nafsu makan burung peliharaan anda, minat silahkan di C.O.'],
    ['6', 'Mainan Jembatan Burung', 'Rp. 40.000', 'Tempat makan burung dengan model gantung, berguna untuk menaikkan nafsu makan burung peliharaan anda, minat silahkan di C.O.'],
    ['7', 'Tempat makan gantung burung', 'Rp. 40.000', 'Tempat makan burung dengan model gantung, berguna untuk menaikkan nafsu makan burung peliharaan anda, minat silahkan di C.O.'],
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
                        builder: (context) => SingleItemAccessories(itemDetails: items[i]),
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
                            child: Center(
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
