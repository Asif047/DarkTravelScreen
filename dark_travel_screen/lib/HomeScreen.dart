import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  var images =
      ["https://plus.unsplash.com/premium_photo-1700577888245-9729a4fe6040?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
 
      "https://images.unsplash.com/photo-1610641818989-c2051b5e2cfd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

      "https://images.unsplash.com/photo-1699469811440-9afec1e07b54?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
 
      "https://plus.unsplash.com/premium_photo-1700140826710-86b40edd3895?q=80&w=1820&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
 
      "https://images.unsplash.com/photo-1576190348129-d158fb6c67fd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1359),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text("Travel", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),

            SizedBox(height: 10,),

            Container(
              height: 50,
              color: const Color(0xFF382f6e),
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.search, color: Colors.grey,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search destination",
                          hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  getCapsuleButton("Italy", Colors.red, Colors.orange),
                  SizedBox(width: 10,),
                  getCapsuleButton("Rome", Colors.green, Colors.greenAccent),
                  SizedBox(width: 10,),
                  getCapsuleButton("French", Colors.blue, Colors.lightBlueAccent),
                  SizedBox(width: 10,),
                  getCapsuleButton("Sydney", Colors.purpleAccent, Colors.pinkAccent),
                ],
              ),
            ),

            SizedBox(height: 10,),

            Text("Destination", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),

            SizedBox(height: 20,),

            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                                height:100,
                                width: double.infinity,
                                child: Image.network(i, fit: BoxFit.cover,)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("New Zealand", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
                                    Text("USD 5.250", style: TextStyle(fontSize: 14, color: Colors.grey),),
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                  RatingBar.builder(
                                    itemSize: 14,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),

                                    const Text("4.5 (620 Review)", style: TextStyle(fontSize: 14, color: Colors.grey),),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                    );
                  },
                );
              }).toList(),
            ),
            
            Text("Popular Tour", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
            
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  getItemUI(images[1], "Paris Tour", "USD 1200 | 5 Days"),
                  getItemUI(images[2], "Paris Tour", "USD 1200 | 5 Days"),
                  getItemUI(images[3], "Paris Tour", "USD 1200 | 5 Days"),
                  getItemUI(images[4], "Paris Tour", "USD 1200 | 5 Days"),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getItemUI(String image, String title, String subtitle){
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 80, width: 140,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(image),
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)
            )
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
            Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }

  Widget getCapsuleButton(String title, Color color1, Color color2) {
    return  Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color1, color2]
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      height: 20,
      width: 100,
      child: Center(child: Text(title, style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),)),
    );
  }
}