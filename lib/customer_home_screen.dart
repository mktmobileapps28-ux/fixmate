import 'package:flutter/material.dart';

// Purani saari files ke imports yahan honge
import 'bookings_screen.dart';
import 'profile_screen.dart';
import 'ac_repair_screen.dart';
import 'electrician_screen.dart';
import 'plumber_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _currentIndex = 0;

  // Teeno main tabs ki list
  final List<Widget> _pages = [
    HomeContent(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF673AB7),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), activeIcon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String selectedCategory = "AC Repair";

  // Providers ka dummy data
  final Map<String, List<Map<String, String>>> providersData = {
    "AC Repair": [
      {"name": "Ali AC Master", "rating": "4.8", "price": "1500", "exp": "5 yrs"},
      {"name": "Quick Fix Cooling", "rating": "4.5", "price": "1200", "exp": "3 yrs"},
    ],
    "Electrician": [
      {"name": "Kamran Electric", "rating": "4.7", "price": "800", "exp": "6 yrs"},
    ],
    "Plumber": [
      {"name": "Sajid Plumb Works", "rating": "4.6", "price": "1000", "exp": "4 yrs"},
    ],
    "Cleaning": [
      {"name": "Clean & Shine", "rating": "4.8", "price": "3000", "exp": "5 yrs"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lahore, Pakistan", style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white, elevation: 0,
        actions: [IconButton(icon: Icon(Icons.notifications_none, color: Colors.black), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for services...",
                prefixIcon: Icon(Icons.search),
                filled: true, fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 25),

            Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),

            // Categories Row - Yahan humne target screens pass ki hain
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                catItem(Icons.ac_unit, "AC Repair", ACRepairScreen()),
                catItem(Icons.bolt, "Electrician", ElectricianScreen()),
                catItem(Icons.plumbing, "Plumber", PlumberScreen()),
              ],
            ),

            SizedBox(height: 25),

            // Discount Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Color(0xFFF4F0FF), borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text("30% OFF", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF673AB7))),
                      Text("On your first booking", style: TextStyle(fontSize: 14)),
                    ]),
                  ),
                  Icon(Icons.local_offer, size: 40, color: Color(0xFF673AB7)),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Available Providers List
            Text("Available $selectedCategory", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: providersData[selectedCategory]?.length ?? 0,
              itemBuilder: (context, index) {
                var provider = providersData[selectedCategory]![index];
                return providerCard(provider);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Updated catItem: Tap karne par Category bhi change hogi aur Screen bhi khul sakegi
  Widget catItem(IconData icon, String label, Widget targetScreen) {
    bool isSelected = selectedCategory == label;
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = label; // List update karne ke liye
        });
        // Agar aap chahte hain ke screen bhi khule:
        Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF673AB7) : Color(0xFFF4F0FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: isSelected ? Colors.white : Color(0xFF673AB7)),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500)),
        ],
      ),
    );
  }

  Widget providerCard(Map<String, String> data) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundColor: Color(0xFFF4F0FF), child: Icon(Icons.person, color: Color(0xFF673AB7))),
          SizedBox(width: 15),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(data['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
              Text("${data['exp']} Exp • Rs. ${data['price']}", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ]),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF673AB7)),
            child: Text("Book", style: TextStyle(color: Colors.white, fontSize: 12)),
          )
        ],
      ),
    );
  }
}