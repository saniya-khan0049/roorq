import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roorq UI Demo',
      theme: ThemeData(
        // Setting the primary font and colors
        scaffoldBackgroundColor: const Color(
          0xFFF5F5F5,
        ), // Light grey background
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 4) {
      // Index 4 is the "Profile" button (0, 1, 2, 3, 4)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else {
      // For all other buttons, just change the highlighted tab
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. TOP APP BAR
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "HOME",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "ROORQ",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        leadingWidth: 100, // Give space for the logo text
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      // 2. MAIN BODY CONTENT
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Hero Section (The big image card)
              _buildHeroSection(),

              const SizedBox(height: 20),

              // The two buttons row (New Arrivals / Best Sellers)
              Row(
                children: [
                  Expanded(
                    child: _buildActionCard(
                      "NEW ARRIVALS",
                      Icons.shopping_bag_outlined,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionCard(
                      "BEST SELLERS",
                      Icons.emoji_events_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // 3. BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Needed for more than 3 items
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle, size: 12), // Simulating the dot icon
            activeIcon: Icon(Icons.circle, size: 12, color: Colors.red),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_view_day_outlined,
            ), // Placeholder for "Gold"
            label: 'Gold',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Helper Widget for the Hero Image Section
  Widget _buildHeroSection() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          // Placeholder image (replace with your asset)
          image: NetworkImage(
            'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black45,
            BlendMode.darken,
          ), // Darkens image for text readability
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100), // Spacing to push text down
          const Text(
            "WEEKLY DROPS\nNOW LIVE",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w900,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53935), // Red color
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "SHOP NOW",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for the Small Action Cards
  Widget _buildActionCard(String title, IconData icon) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.black87),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

//  THE MAIN PROFILE SCREEN
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "ROORQ",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "YOUR PROFILE",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Avatar Row
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  "Your Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // --- FUNCTIONAL BUTTONS ---

            // 1. Order History (Links to the page we made earlier)
            _buildProfileOption(
              context,
              Icons.history,
              "ORDER HISTORY",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderDetailsScreen(),
                  ),
                );
              },
            ),

            // 2. Saved Addresses (Links to a new placeholder page)
            _buildProfileOption(
              context,
              Icons.map_outlined,
              "SAVED ADDRESSES",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedAddressesScreen(),
                  ),
                );
              },
            ),

            // 3. Payment Methods (Links to a new placeholder page)
            _buildProfileOption(
              context,
              Icons.credit_card,
              "PAYMENT METHODS",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethodsScreen(),
                  ),
                );
              },
            ),

            // 4. Notifications (Links to a new placeholder page)
            _buildProfileOption(
              context,
              Icons.notifications_outlined,
              "NOTIFICATIONS",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),

            // 5. Settings (Links to a new placeholder page)
            _buildProfileOption(
              context,
              Icons.settings_outlined,
              "SETTINGS",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            // Log Out Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logout logic goes here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53935),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "LOG OUT",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for the Menu Rows
  Widget _buildProfileOption(
    BuildContext context,
    IconData icon,
    String title, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[600], size: 22),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// PLACEHOLDER SCREENS

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "ORDER DETAILS",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. ORDER ID HEADER
            const Text(
              "ORDER #ROOXAXXX",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // 2. DELIVERED STATUS
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.red, size: 16),
                  SizedBox(width: 6),
                  Text(
                    "DELIVERED",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 3. THE PRODUCT ITEM (The Varsity Hoodie)
            Row(
              children: [
                // Image Box
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?auto=format&fit=crop&w=200&q=80",
                      ), // Placeholder hoodie
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                // Text Details
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "VARSITY HOODIE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Size: M", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 4),
                      Text(
                        "\$14.00",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // Right side status
                const Text(
                  "Delivered",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(), // A thin line separator
            const SizedBox(height: 20),

            // 4. ORDER SUMMARY SECTION
            const Text(
              "ORDER SUMMARY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "VARSITY HOODIE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("\$14.00", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping", style: TextStyle(color: Colors.grey)),
                Text(
                  "Free",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            // 5. SHIPPING & PAYMENT INFO
            const Text(
              "SHIPPING INFORMATION",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "John Smith\n123 Innovation Drive\nTech City, TC 90210",
              style: TextStyle(height: 1.5, fontSize: 15),
            ),

            const SizedBox(height: 30),

            const Text(
              "PAYMENT METHOD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.credit_card, color: Colors.black54),
                SizedBox(width: 10),
                Text("Visa ending in 1234", style: TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // We use a clean AppBar that blends in
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. BIG BOLD TITLE
            const Text(
              "SAVED ADDRESSES",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 2. SCROLLABLE LIST OF ADDRESSES
            Expanded(
              child: ListView(
                children: [
                  _buildAddressCard(
                    title: "Home",
                    address: "123 Innovation Drive, Tech City\nState, 90210",
                    icon: Icons.edit_outlined,
                  ),
                  _buildAddressCard(
                    title: "Work",
                    address:
                        "456 Corporate Blvd, Business Park\nCity Center, 112233",
                    icon: Icons.edit_outlined,
                  ),
                  _buildAddressCard(
                    title: "Parents' House",
                    address:
                        "789 Suburban Lane, Quiet Town\nCountryside, 445566",
                    icon: Icons.close, // The 'X' icon
                  ),
                  _buildAddressCard(
                    title: "Other",
                    address:
                        "101 Vacation Road, Beachside\nResort Area, 998877",
                    icon: Icons.close,
                  ),
                ],
              ),
            ),

            // 3. THE "ADD NEW ADDRESS" BUTTON
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to add address would go here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE53935), // The Red Color
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "ADD NEW ADDRESS",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget to build the White Address Cards
  Widget _buildAddressCard({
    required String title,
    required String address,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // This adds the soft grey shadow behind the card
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Text info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5, // Adds spacing between lines of text
                  ),
                ),
              ],
            ),
          ),
          // Right side: The Icon (Edit or Delete)
          Icon(icon, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Clean White Header
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  PAGE TITLE
            const Text(
              "PAYMENT METHODS",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),

            //  LIST OF PAYMENT CARDS
            Expanded(
              child: ListView(
                children: [
                  // --- VISA CARD ---
                  _buildPaymentCard(
                    context,
                    logo: const Text(
                      "VISA",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    title: "", // Visa usually just shows the logo
                    number: "",
                    actionLabel: "EDIT",
                    isRemove: false,
                  ),

                  // --- MASTERCARD 1 ---
                  _buildPaymentCard(
                    context,
                    logo: const Icon(
                      Icons.credit_card,
                      size: 30,
                      color: Colors.black87,
                    ),
                    title: "Mastercard",
                    number: "",
                    actionLabel: "EDIT",
                    isRemove: false,
                  ),

                  // --- MASTERCARD 2 ---
                  _buildPaymentCard(
                    context,
                    logo: const Icon(
                      Icons.credit_card,
                      size: 30,
                      color: Colors.black54,
                    ),
                    title: "Mastercard",
                    number: "",
                    actionLabel: "REMOVE",
                    isRemove: true, // This turns the text red
                  ),

                  // --- APPLE PAY ---
                  _buildPaymentCard(
                    context,
                    logo: const Icon(
                      Icons.apple,
                      size: 35,
                      color: Colors.black,
                    ),
                    title: "Apple Pay",
                    number: "",
                    actionLabel: "",
                    isRemove: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget to build the White Payment Cards
  Widget _buildPaymentCard(
    BuildContext context, {
    required Widget logo,
    required String title,
    required String number,
    required String actionLabel,
    required bool isRemove,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // Soft Shadow effect
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          //  The Logo (Visa text or Icon)
          SizedBox(width: 50, child: logo),

          const SizedBox(width: 15),

          //  The Card Details (Title & Number)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                if (number.isNotEmpty) ...[
                  if (title.isNotEmpty) const SizedBox(height: 5),
                  Text(
                    number,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ],
            ),
          ),

          //  The Action Button (Edit/Remove)
          if (actionLabel.isNotEmpty)
            TextButton(
              onPressed: () {
                // Add logic here later
              },
              child: Text(
                actionLabel,
                style: TextStyle(
                  color: isRemove
                      ? const Color(0xFFE53935)
                      : Colors.black87, // Red if remove, Black if edit
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // These variables track the state of each switch (True = ON, False = OFF)
  bool _weeklyDrops = false;
  bool _orderUpdates = true;
  bool _backInStock = true;
  bool _promotions = true;
  bool _communityActivity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // The Header (Black bar with ROORQ and Back Arrow on right, matching image)
      appBar: AppBar(
        // backgroundColor: Colors.black,
        // elevation: 0,
        automaticallyImplyLeading: true, // Hides the default back arrow
        // title: const Text(
        //   "ROORQ",
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.w900,
        //     fontSize: 20,
        //     letterSpacing: 1.0,
        //   ),
        // ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 10), // Padding for the arrow
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "NOTIFICATIONS",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            //  WEEKLY DROP ALERTS
            _buildToggleCard(
              title: "WEEKLY DROP ALERTS",
              value: _weeklyDrops,
              onChanged: (newValue) {
                setState(() => _weeklyDrops = newValue);
              },
            ),

            //  ORDER UPDATES
            _buildToggleCard(
              title: "ORDER UPDATES",
              value: _orderUpdates,
              onChanged: (newValue) {
                setState(() => _orderUpdates = newValue);
              },
            ),

            //  BACK IN STOCK
            _buildToggleCard(
              title: "BACK IN STOCK",
              value: _backInStock,
              onChanged: (newValue) {
                setState(() => _backInStock = newValue);
              },
            ),

            // PROMOTIONS
            _buildToggleCard(
              title: "PROMOTIONS",
              value: _promotions,
              onChanged: (newValue) {
                setState(() => _promotions = newValue);
              },
            ),

            // COMMUNITY ACTIVITY
            _buildToggleCard(
              title: "COMMUNITY ACTIVITY",
              value: _communityActivity,
              onChanged: (newValue) {
                setState(() => _communityActivity = newValue);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget to build the Toggle Cards
  Widget _buildToggleCard({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // The soft shadow effect
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        // Thin grey border
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          // The Switch Widget
          Transform.scale(
            scale: 0.8, // Slightly smaller to match design elegance
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFFE53935), // Red when ON
              activeTrackColor: const Color(0xFFE53935).withOpacity(0.3),
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Header: Black bar with ROORQ on left, Back arrow on right
      appBar: AppBar(
        // backgroundColor: Colors.black,
        // elevation: 0,
        automaticallyImplyLeading: true, // Hides default back button
        // title: const Text(
        //   "ROORQ",
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.w900,
        //     fontSize: 20,
        //     letterSpacing: 1.0,
        //   ),
        // ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "SETTINGS",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            //  CONTACT SUPPORT (Links to the new page)
            _buildSettingsButton(
              context,
              icon: Icons.chat_bubble_outline,
              text: "Contact Support",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactSupportScreen(),
                  ),
                );
              },
            ),

            //  LEGAL & PRIVACY (Placeholder)
            _buildSettingsButton(
              context,
              icon: Icons.shield_outlined,
              text: "Legal & Privacy",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LegalPrivacyScreen(),
                  ),
                );
              },
            ),

            //  ABOUT ROOQ (Placeholder)
            _buildSettingsButton(
              context,
              icon: Icons.info_outline,
              text: "About ROOQ",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),

            //  LOG OUT (Red Text)
            _buildSettingsButton(
              context,
              icon: Icons.exit_to_app, // Door icon
              text: "Log Out",
              isRed: true, // Special flag to make text red
              onTap: () {
                // For now,just go to the previous screen
                // In a real app, this would clear user data
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for the big white buttons
  Widget _buildSettingsButton(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool isRed = false, // Defaults to false unless we say otherwise
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          // Box Shadow for 3D effect
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            // Icon
            Icon(
              icon,
              color: const Color(0xFFE53935), // Red Icon
              size: 28,
            ),
            const SizedBox(width: 20),
            // Text
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isRed
                    ? const Color(0xFFE53935)
                    : Colors.black, // Red if 'isRed' is true
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  CONTACT SUPPORT SCREEN IN SETTINGS

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "ROORQ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "CONTACT SUPPORT",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              "Our team is available to support you with any issues related to your orders or account.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),

            //  Live Chat
            _buildContactOption(Icons.chat_bubble_outline, "LIVE CHAT"),

            //  Email Us
            _buildContactOption(Icons.email_outlined, "EMAIL US"),

            //  Call Help Desk
            _buildContactOption(Icons.phone_outlined, "CALL HELP DESK"),
          ],
        ),
      ),
    );
  }

  // Helper for Contact Buttons (Centered red text)
  Widget _buildContactOption(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center everything
        children: [
          Icon(icon, color: const Color(0xFFE53935), size: 28),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE53935), // Red Text
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// OTHER PLACEHOLDER SCREENS IN SETTINGS

class LegalPrivacyScreen extends StatelessWidget {
  const LegalPrivacyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Legal & Privacy")),
      body: const Center(child: Text("Privacy Policy goes here.")),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About ROOQ")),
      body: const Center(child: Text("App Version 1.0.0")),
    );
  }
}
