import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trip_admin/pages/addhotel.dart';

class Hotelpage extends StatelessWidget {
  const Hotelpage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> places = [
      {
        "name": "Manali Hill View",
        "location": "Manali, India",
        "price": 4200,
        "image":
            "https://media-cdn.tripadvisor.com/media/photo-s/16/1a/ea/54/hotel-presidente-4s.jpg"
      },
      {
        "name": "Goa Beach Resort",
        "location": "Goa, India",
        "price": 3500,
        "image":
            "https://media-cdn.tripadvisor.com/media/photo-s/16/1a/ea/54/hotel-presidente-4s.jpg"
      },
    ];

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>
      (stream: FirebaseFirestore.instance.collection('Hotels').snapshots(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
        return  CircularProgressIndicator();
        }

        final hotel = snapshot.data!.docs;
        return  ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: hotel.length,
            itemBuilder: (context, index) {
              final place = hotel[index];
          
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 4,
                child: Row(
                  children: [
                    // ------------------ LEFT SIDE IMAGE ------------------
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(14),
                      ),
                      child: Image.network(
                        place["image1"],
                        height: 95,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
          
                    // ------------------ CENTER TEXT ------------------
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place["hotel"],
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                      
                            const SizedBox(height: 12),
                            Text(
                              "₹${place["price perday"]}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
          
                  ],
                ),
              );
            },
          );
      },),

      // Floating flute reaction button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Addhotel()));
        },
        child: const Icon(Icons.add), // flute icon alternative
      ),
    );
  }
}
