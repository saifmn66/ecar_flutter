import 'package:flutter/material.dart';

class Charger extends StatelessWidget {
  const Charger({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(74, 158, 158, 158),
        ),

        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset("images/Icon.png", height: 50, width: 50),
                ),
              ),
              const SizedBox(height: 10),
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
