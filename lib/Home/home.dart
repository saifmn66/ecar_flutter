import 'package:e_car/Home/widgets/small-card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double fullwidth = MediaQuery.of(context).size.width;
    final double half = (fullwidth / 2) - 25;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                  top: 70.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    height: 200,
                    width: double.maxFinite > 800 ? 700 : double.maxFinite,
                    color: Colors.blue,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "images/cover.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(121, 49, 198, 91),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color.fromARGB(0, 114, 114, 114),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 73, 73, 73),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(121, 49, 198, 91),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color.fromARGB(0, 114, 114, 114),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 73, 73, 73),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  SmallCard(
                    width: half,
                    lottie: "images/bg.json",
                    content: Column(children: const [
                        
                      ],
                    ),
                  ),
                  SmallCard(
                    width: half,
                    lottie: "images/bg.json",
                    content: Column(children: const [
                        
                      ],
                    ),
                  ),
                  SmallCard(
                    width: half,
                    lottie: "images/bg.json",
                    content: Column(children: const [
                        
                      ],
                    ),
                  ),
                  SmallCard(
                    width: half,
                    lottie: "images/bg.json",
                    content: Column(children: const [
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
