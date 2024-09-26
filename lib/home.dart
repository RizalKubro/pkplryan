import 'package:flutter/material.dart';
import 'package:pet_shope/accessoris.dart';
import 'package:pet_shope/food.dart';
import 'package:pet_shope/todohome.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "PET SHOP",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(
                color: Color.fromARGB(255, 167, 83, 45),
                height: 1,
                thickness: 5,
              ),
              SizedBox(height: 50),
              Center(
                child: ClipOval(
                  child: Image.asset(
                    "images/39.png",
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Food()),
                  );
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 167, 83, 45),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          "Food",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Accessoris()),
                  );
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 167, 83, 45),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          "Accessories",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
                            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodoScreen()),
                  );
                },
              child:Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 167, 83, 45),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Text(
                        "Animal Care",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
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
