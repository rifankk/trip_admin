import 'package:flutter/material.dart';

class Addmeals extends StatefulWidget {
  const Addmeals({super.key});

  @override
  State<Addmeals> createState() => _AddmealsState();
}

class _AddmealsState extends State<Addmeals> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

             Text("Title ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             SizedBox(height: 5),
            TextField(
              
              decoration: InputDecoration(
                hintText: "Enter Title",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20,),
             Text(" Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             SizedBox(height: 5),
            TextField(
              
              decoration: InputDecoration(
                hintText: " Enter  Time",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
               SizedBox(height: 20,),
             Text(" Price", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             SizedBox(height: 5),
            TextField(
              
              decoration: InputDecoration(
                hintText: " Enter  Price",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20,),
            const Text("Items", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            TextField(
           
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter Your items",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            ]
            ),
            ),
    );
  }
}