import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_shope/home.dart';
import 'package:pet_shope/itemswidgets_accessories.dart';

class Accessoris extends StatefulWidget {
  const Accessoris({Key? key});

  @override
  State<Accessoris> createState() => _AccessorisState();
}

class _AccessorisState extends State<Accessoris> with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController?.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabSelection);
    _tabController?.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {}); // Update the state when tab selection changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.arrowCircleLeft, // Mengganti dengan ikon yang benar
                                color: Colors.black,
                                size: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: 'Cat'),
                    Tab(text: 'Dog'),
                    Tab(text: 'Bird'),
                    Tab(text: 'Other'),
                  ],
                ),
                if (_tabController != null)
                  Center(
                    child: ItemswidgetsAccessories(activeTabIndex: _tabController!.index),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
