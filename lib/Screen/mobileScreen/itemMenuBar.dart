import 'package:flutter/material.dart';

class ItemMenuBar extends StatelessWidget {
  const ItemMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 1,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: Text("Apple")),
                    body: Center(child: Text("Welcome to Apple Page!")),
                  ),
                ),
              );
            },

            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 221, 238, 247),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.apple),
                  SizedBox(width: 10),
                  Text(
                    "Apple",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
