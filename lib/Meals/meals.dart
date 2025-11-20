import 'package:flutter/material.dart';
import 'package:trip_admin/pages/addmeals.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> places = [
      {
        "name": "Biriyani",
        "location": "Manali, India",
        "price": 200,
        
      },
      {
        "name": "mandhi",
        "location": "Goa, India",
        "price": 250,
        
      },
    ];

    return Scaffold(
      appBar: AppBar(
    
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 4,
            child: Row(
              children: [
            

                // ------------------ CENTER TEXT ------------------
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place["name"],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              place["location"],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "₹${place["price"]}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),

      // Floating flute reaction button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Addmeals()));
        },
        child: const Icon(Icons.add), // flute icon alternative
      ),
    );
  }
}
