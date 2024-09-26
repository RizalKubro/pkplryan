import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_shope/food.dart';
import 'package:pet_shope/resi.dart';

class SingleItem extends StatefulWidget {
  final List<String> itemDetails;

  const SingleItem({Key? key, required this.itemDetails}) : super(key: key);

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  int itemCount = 1;
  double price = 0.0; // Inisialisasi harga awal

  @override
  void initState() {
    super.initState();
    // Set harga awal berdasarkan itemDetails
    price = double.parse(
        widget.itemDetails[2].replaceAll('Rp. ', '').replaceAll(',', ''));
  }

  void incrementItemCount() {
    setState(() {
      itemCount++;
      price = double.parse(widget.itemDetails[2]
              .replaceAll('Rp. ', '')
              .replaceAll(',', '')) *
          itemCount;
    });
  }

  void decrementItemCount() {
    setState(() {
      if (itemCount > 1) {
        itemCount--;
        price = double.parse(widget.itemDetails[2]
                .replaceAll('Rp. ', '')
                .replaceAll(',', '')) *
            itemCount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Food()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                      child: Icon(
                        FontAwesomeIcons.arrowCircleLeft,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Image.asset(
                        "images/${widget.itemDetails[0]}.png",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemDetails[1],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Icon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Icon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Icon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Icon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            widget.itemDetails[3],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      // Menampilkan harga berdasarkan item count
                                      '\Rp${price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        incrementItemCount();
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      '$itemCount',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    GestureDetector(
                                      onTap: () {
                                        decrementItemCount();
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            size: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Resi(
                                          itemName: widget
                                              .itemDetails[1], // Nama item
                                          itemPrice: price
                                              .toStringAsFixed(2), // Harga item
                                          itemCount: itemCount
                                              .toString(), // Jumlah item count
                                          itemImage:
                                              "images/${widget.itemDetails[0]}.png", // Gambar item
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Buy'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 12), backgroundColor: Colors.orange,
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
