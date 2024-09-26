import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_shope/home.dart';
import 'package:pet_shope/success.dart';

class Resi extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String itemCount;
  final String itemImage;

  const Resi({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemCount,
    required this.itemImage,
  }) : super(key: key);

  @override
  State<Resi> createState() => _ResiState();
}

class _ResiState extends State<Resi> {
  String? selectedCourier;

  @override
  Widget build(BuildContext context) {
    double itemPrice = double.parse(widget.itemPrice);
    double shippingCost = 0;

    // Mengatur biaya pengiriman berdasarkan kurir yang dipilih
    if (selectedCourier == 'JNT') {
      shippingCost = 10.000;
    } else if (selectedCourier == 'JNE') {
      shippingCost = 12.000;
    } else if (selectedCourier == 'COD') {
      shippingCost = 15.000;
    } else if (selectedCourier == 'Ninja Express') {
      shippingCost = 8.000;
    }

    double totalPayment = itemPrice + shippingCost;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.arrowCircleLeft,
                        color: Colors.black,
                        size: 35,
                      ),
                      SizedBox(width: 14),
                      Text(
                        "Check Out",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Color.fromARGB(255, 167, 83, 45),
                  height: 1,
                  thickness: 3,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                      color: Color.fromARGB(255, 167, 83, 45),
                      size: 24,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            "Alamat Pengirim",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Rahim | (+62)823-3568-3784",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Jln raya MT Haryono KECAMATAN KAKSAAN, KELURAHAN SEMAMPIR, JAWA TIMUR, ID 67372",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Color.fromARGB(255, 167, 83, 45),
                  height: 1,
                  thickness: 3,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        widget.itemImage,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Rp. ${widget.itemPrice}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Jumlah: ${widget.itemCount}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Color.fromARGB(255, 167, 83, 45),
                  height: 1,
                  thickness: 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih Kurir',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text('JNT'),
                            leading: Radio<String>(
                              value: 'JNT',
                              groupValue: selectedCourier,
                              onChanged: (value) {
                                setState(() {
                                  selectedCourier = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('JNE'),
                            leading: Radio<String>(
                              value: 'JNE',
                              groupValue: selectedCourier,
                              onChanged: (value) {
                                setState(() {
                                  selectedCourier = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text('COD'),
                            leading: Radio<String>(
                              value: 'COD',
                              groupValue: selectedCourier,
                              onChanged: (value) {
                                setState(() {
                                  selectedCourier = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Ninja Express'),
                            leading: Radio<String>(
                              value: 'Ninja Express',
                              groupValue: selectedCourier,
                              onChanged: (value) {
                                setState(() {
                                  selectedCourier = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(
                  color: Color.fromARGB(255, 167, 83, 45),
                  height: 1,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Pesanan (1 produk)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Harga: Rp ${double.parse(widget.itemPrice).toStringAsFixed(3)}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rincian Pembayaran',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Harga Item: Rp ${double.parse(widget.itemPrice).toStringAsFixed(3)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Biaya Pengiriman: Rp ${shippingCost.toStringAsFixed(3)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Total Pembayaran: Rp ${totalPayment.toStringAsFixed(3)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Color.fromARGB(255, 167, 83, 45),
                  height: 1,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Metode Pembayaran :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Transfer Bank',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Color.fromARGB(255, 167, 83, 45),
                  height: 1,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentSuccess(
                                  itemImage: widget.itemImage,
                                  key: GlobalKey()),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color.fromARGB(
                            255, 167, 83, 45), // Ubah warna teks tombol
                        padding: EdgeInsets.symmetric(
                            horizontal: 90,
                            vertical: 15), // Atur padding tombol
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Ubah bentuk tombol
                        ),
                      ),
                      child: Text(
                        'Buat Pesanan',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
