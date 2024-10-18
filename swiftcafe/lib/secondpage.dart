import 'dart:ui';

import 'package:cafe/thirdpage.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final List<BeverageDetail> beverages = [
    BeverageDetail(
      title: 'Latté',
      rating: '4.9',
      description: 'Café latte is a milk coffee that is made up of one or two shots of espresso, steamed milk, and a final, thin layer of frothed milk on top.',
    ),
    BeverageDetail(
      title: 'Hot Cappuccino',
      rating: '4.7',
      description: 'A classic Italian coffee drink made with espresso and steamed milk.',
    ),
    BeverageDetail(
      title: 'Espresso',
      rating: '4.8',
      description: 'A concentrated coffee brewed by forcing a small amount of nearly boiling water through finely-ground coffee beans.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E3C3F),
      body: Stack(children: [Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/coffee.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.2), // Overlay color with opacity
          ),
        ),Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/handcoffee.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '20/12/2022',
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                          Text(
                            'Joshua Scanlan',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.white),
                        onPressed: () {},
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/userprof.jpeg'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 14),
              // Search Bar
              TextField(
                style: TextStyle(color: Colors.white10,fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'Search favorite Beverages',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 14),
              // Most Popular Beverages Section
              Text(
                'Most Popular Beverages',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (index) => BeverageCard(index: index)),
                ),
              ),
              SizedBox(height: 14),
              // Get It Instantly Section
              Text(
                'Get it instantly',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: beverages.length,
                      itemBuilder: (context, index) {
                        return BeverageDetailCard(
                          title: beverages[index].title,
                          rating: beverages[index].rating,
                          description: beverages[index].description,
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomNavBar(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    ],
        ),
      ),

    ],
    ),
    );
  }
}

class BeverageDetail {
  final String title;
  final String rating;
  final String description;

  BeverageDetail({
    required this.title,
    required this.rating,
    required this.description,
  });
}

class BeverageCard extends StatelessWidget {
  final int index;

  const BeverageCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/images/coffeecupa.png',
      'assets/images/coffeecupb.png',
      'assets/images/coffeecupc.png',
    ];

    return InkWell(child: Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 8),
          Image.asset(images[index], height: 80),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hot Cappuccino',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text('Espresso, Steamed Milk', style: TextStyle(color: Colors.white70,fontSize: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('4.9 ', style: TextStyle(color: Colors.white,fontSize: 10)),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(' (458)', style: TextStyle(color: Colors.white,fontSize: 10)),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.green),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>CoffeeOrderPage()));
      },
    );
  }
}

class BeverageDetailCard extends StatelessWidget {
  final String title;
  final String rating;
  final String description;

  const BeverageDetailCard({
    required this.title,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [

          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Row(
                  children: [

                    Text('$rating ', style: TextStyle(color: Colors.white,fontSize: 10)),
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text(' (458)', style: TextStyle(color: Colors.white,fontSize: 10)),
                    SizedBox(width: 5),
                    Icon(Icons.flag, color: Colors.green, size: 16),
                  ],
                ),
                SizedBox(height: 8),
                Text(description, style: TextStyle(color: Colors.white70,fontSize: 10)),
              ],
            ),
          ),
          Container(width: 10,),
          
          Expanded(flex:4,child: Container(child: ClipRRect(borderRadius:BorderRadius.all(Radius.circular(10)) ,child: Stack(children: [Container(
          margin:EdgeInsets.only(bottom: 20),child: Image.asset('assets/images/coffeebeans.png',fit: BoxFit.fill,)),
            Positioned(left:0,right: 0,bottom:0,child: Container(
              height: 30,
              width: 60,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(onPressed: (){}, style:ElevatedButton.styleFrom(backgroundColor: Colors.green),child: Text("Add",style: TextStyle(fontSize: 8),)),
            ),),],),),
          ),
          )
          
        ],
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      elevation: 10,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIcon(Icons.home, 0),
            _buildIcon(Icons.person, 1),
            _buildIcon(Icons.wallet, 2),
            _buildIcon(Icons.shopping_cart, 3),
            _buildIcon(Icons.message_outlined, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.black : Colors.transparent,
            ),
            padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
            child: Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : Colors.white,
            ),
          ),

        ],
      ),
    );
  }

}

