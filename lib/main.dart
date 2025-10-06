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
      title: 'Dos Computer Solution',
      theme: ThemeData.dark(),
      // Named Routes Configuration - demonstrates named route navigation
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const MainPage(),
        '/about': (context) => const AboutScreen(),
        '/contact': (context) => const ContactScreen(),
      },
      // Initial route - starts with LoginScreen
      initialRoute: '/',
    );
  }
}

// ============================================================================
// LOGIN SCREEN - Demonstrates pushReplacement navigation
// ============================================================================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(32),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.computer,
                    size: 64,
                    color: Color(0xFF1E3A8A),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Dos Computer Solution',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your Trusted PC Service Partner',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Example of Navigator.pushReplacement()
                        // This replaces the current screen (LoginScreen) with MainPage
                        // User cannot go back to login screen using back button
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Example of Navigator.push() vs pushReplacement()
                      // This would add MainPage on top of LoginScreen
                      // User can go back to LoginScreen using back button
                      // Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Demo: Push vs PushReplacement'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// MAIN PAGE - Demonstrates Drawer + BottomNavigationBar combination
// ============================================================================
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Bottom navigation pages
  final List<Widget> _pages = const [
    HomeScreen(),
    Center(child: Text("Services Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer Navigation - demonstrates drawer navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1E3A8A),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.computer,
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Dos Computer Solution',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Navigation Demo App',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Drawer items demonstrating different navigation methods
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF1E3A8A)),
              title: const Text('Home'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.build, color: Color(0xFF1E3A8A)),
              title: const Text('Services'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Color(0xFF1E3A8A)),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Example of named route navigation
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.contact_phone, color: Color(0xFF1E3A8A)),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Example of named route navigation
                Navigator.pushNamed(context, '/contact');
              },
            ),
            const Divider(),
            // ScreenA: Displays software-related products for installation
            ListTile(
              leading:
                  const Icon(Icons.install_desktop, color: Color(0xFF10B981)),
              title: const Text('Software Installation'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Example of Navigator.push() to open ScreenA (Software)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenA()),
                );
              },
            ),
            // ScreenB: Displays hardware-related items for sale
            ListTile(
              leading: const Icon(Icons.hardware, color: Color(0xFF3B82F6)),
              title: const Text('Hardware Products'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Example of Navigator.push() to open ScreenB (Hardware)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenB()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Example of pushReplacement - go back to login
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      // App Bar
      appBar: AppBar(
        title: const Text('Dos Computer Solution'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
      ),
      // Main Content
      body: _pages[_selectedIndex],
      // Bottom Navigation Bar - demonstrates bottom tab navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color(0xFF1E3A8A),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ============================================================================
// HOME SCREEN - Demonstrates TabBar and TabBarView navigation
// ============================================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // ✅ Task 4: Fixed TabBar with TabBarView - changed from 3 to 2 tabs
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Task 9: Added TabBar inside AppBar with 2 tabs
      appBar: AppBar(
        title: const Text('Dos Computer Solution'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.teal,
          tabs: const [
            Tab(text: "Overview"),
            Tab(text: "Projects"),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Hero Section with placeholder
          Container(
            height: 250,
            color: Colors.blueGrey.shade900,
            child: Stack(
              children: [
                Container(color: Colors.black.withOpacity(0.5)),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dos Computer Solution",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Professional computer repair services\nyou can trust",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                        ),
                        child: const Text("Request Service"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Contact Us"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ✅ Task 4: Fixed TabBar with TabBarView - now with 2 tabs inside Scaffold
          SizedBox(
            height: 400, // Fixed height for TabBarView
            child: TabBarView(
              controller: _tabController,
              children: [
                // Overview Tab
                _buildOverviewTab(),
                // Projects Tab
                _buildProjectsTab(),
              ],
            ),
          ),

          // Product Pages Section
          const SectionTitle(title: "Our Products & Services"),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                // Example of Navigator.push() - ScreenA (Software)
                ElevatedButton.icon(
                  onPressed: () {
                    // Example of Navigator.push() to open ScreenA (Software)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScreenA()),
                    );
                  },
                  icon: const Icon(Icons.install_desktop),
                  label: const Text("Software Installation Services"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 12),
                // Example of Navigator.push() - ScreenB (Hardware)
                ElevatedButton.icon(
                  onPressed: () {
                    // Example of Navigator.push() to open ScreenB (Hardware)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScreenB()),
                    );
                  },
                  icon: const Icon(Icons.hardware),
                  label: const Text("Hardware Products for Sale"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),

          // Services Section
          const SectionTitle(title: "Our Services"),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(12),
            children: const [
              ServiceCard(
                  icon: Icons.computer,
                  title: "PC Repair",
                  subtitle: "Desktop computer diagnostics and repair"),
              ServiceCard(
                  icon: Icons.laptop,
                  title: "Laptop Upgrades",
                  subtitle: "Hardware upgrades and performance optimization"),
              ServiceCard(
                  icon: Icons.security,
                  title: "Virus Removal",
                  subtitle: "Malware detection and system cleaning"),
              ServiceCard(
                  icon: Icons.sd_storage,
                  title: "Data Recovery",
                  subtitle: "Professional data recovery services"),
            ],
          ),

          // Profile Card Section
          const ProfileCard(),

          // Customer Support Section
          const SectionTitle(title: "Customer Support"),
          const ChatBubble(
            text:
                "Hi! I'm here to help with your computer issues. What can I assist you with today?",
            isMe: false,
            sender: "Support Team",
          ),
          const ChatBubble(
            text: "My laptop is running very slowly. Can you help?",
            isMe: true,
            sender: "You",
          ),
          const ChatBubble(
            text:
                "I'd be happy to help diagnose the issue. Let's schedule a diagnostic session.",
            isMe: false,
            sender: "Support Team",
          ),

          // Input box (static)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      filled: true,
                      fillColor: Colors.black54,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Overview Tab Content
  Widget _buildOverviewTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Company Overview",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Dos Computer Solution has been serving the community for over 10 years, providing professional computer repair and IT services.",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 8),
              Text("4.9 Rating (127 reviews)",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.teal),
              SizedBox(width: 8),
              Text("Same-day service available",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  // Projects Tab Content
  Widget _buildProjectsTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Projects",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Card(
            color: Colors.black54,
            child: ListTile(
              leading: Icon(Icons.computer, color: Colors.teal),
              title: Text("Gaming PC Build",
                  style: TextStyle(color: Colors.white)),
              subtitle: Text("Custom high-performance gaming setup",
                  style: TextStyle(color: Colors.white70)),
            ),
          ),
          Card(
            color: Colors.black54,
            child: ListTile(
              leading: Icon(Icons.laptop, color: Colors.blue),
              title:
                  Text("Laptop Repair", style: TextStyle(color: Colors.white)),
              subtitle: Text("Screen replacement and hardware upgrade",
                  style: TextStyle(color: Colors.white70)),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// SCREEN A - Software Installation Products
// ============================================================================
class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Software Installation'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Example of Navigator.pop() - goes back to previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.install_desktop,
                    size: 64,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Software Installation Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Professional software setup and installation services',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Software Products Grid
            const Text(
              'Available Software Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio:
                  1.3, // Fixed: Further increased aspect ratio to eliminate overflow
              children: [
                _buildSoftwareCard(
                  context,
                  'Microsoft Office 365',
                  'Complete Office suite installation and setup',
                  Icons.business_center,
                  const Color(0xFF10B981),
                ),
                _buildSoftwareCard(
                  context,
                  'Windows 11 Pro',
                  'Windows 11 Pro activation and optimization',
                  Icons.desktop_windows,
                  const Color(0xFF3B82F6),
                ),
                _buildSoftwareCard(
                  context,
                  'Adobe Photoshop',
                  'Professional photo editing software setup',
                  Icons.brush,
                  const Color(0xFF8B5CF6),
                ),
                _buildSoftwareCard(
                  context,
                  'Antivirus Installation',
                  'Kaspersky, Avast, and other security software',
                  Icons.security,
                  const Color(0xFFEF4444),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSoftwareCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      color: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12), // Reduced padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color), // Reduced icon size
            const SizedBox(height: 8), // Reduced spacing
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 13, // Reduced font size
              ),
              textAlign: TextAlign.center,
              maxLines: 2, // Allow text wrapping
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6), // Reduced spacing
            Expanded(
              // Use Expanded to prevent overflow
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11, // Reduced font size
                ),
                textAlign: TextAlign.center,
                maxLines: 3, // Limit lines
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8), // Reduced spacing
            ElevatedButton(
              onPressed: () {
                // Example of Navigator.push() to open ScreenA (Software)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Requested installation for $title'),
                    backgroundColor: color,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                minimumSize:
                    const Size(double.infinity, 32), // Reduced button height
                padding:
                    const EdgeInsets.symmetric(vertical: 8), // Reduced padding
              ),
              child: const Text(
                'Request',
                style: TextStyle(
                    fontSize: 10), // Further reduced font size and text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// SCREEN B - Hardware Products for Sale
// ============================================================================
class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hardware for Sale'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Example of Navigator.pop() - goes back to previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.hardware,
                    size: 64,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hardware Products for Sale',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Quality hardware components and accessories',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Hardware Products Grid
            const Text(
              'Available Hardware Items',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio:
                  1.3, // Fixed: Further increased aspect ratio to eliminate overflow
              children: [
                _buildHardwareCard(
                  context,
                  'SSD 512GB',
                  'High-speed solid state drive for faster performance',
                  Icons.storage,
                  const Color(0xFF10B981),
                  '\$89.99',
                ),
                _buildHardwareCard(
                  context,
                  '16GB DDR4 RAM',
                  'High-performance memory for gaming and multitasking',
                  Icons.memory,
                  const Color(0xFF3B82F6),
                  '\$79.99',
                ),
                _buildHardwareCard(
                  context,
                  'Mechanical Keyboard',
                  'RGB backlit mechanical keyboard with blue switches',
                  Icons.keyboard,
                  const Color(0xFF8B5CF6),
                  '\$129.99',
                ),
                _buildHardwareCard(
                  context,
                  'Gaming Mouse',
                  'High-precision gaming mouse with customizable buttons',
                  Icons.mouse,
                  const Color(0xFFEF4444),
                  '\$59.99',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHardwareCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    String price,
  ) {
    return Card(
      color: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12), // Reduced padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color), // Reduced icon size
            const SizedBox(height: 8), // Reduced spacing
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 13, // Reduced font size
              ),
              textAlign: TextAlign.center,
              maxLines: 2, // Allow text wrapping
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6), // Reduced spacing
            Expanded(
              // Use Expanded to prevent overflow
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11, // Reduced font size
                ),
                textAlign: TextAlign.center,
                maxLines: 3, // Limit lines
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6), // Reduced spacing
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 14, // Reduced font size
              ),
            ),
            const SizedBox(height: 8), // Reduced spacing
            ElevatedButton(
              onPressed: () {
                // Example of Navigator.push() to open ScreenB (Hardware)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added $title to cart - $price'),
                    backgroundColor: color,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                minimumSize:
                    const Size(double.infinity, 32), // Reduced button height
                padding:
                    const EdgeInsets.symmetric(vertical: 8), // Reduced padding
              ),
              child: const Text(
                'Buy',
                style: TextStyle(
                    fontSize: 10), // Further reduced font size and text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// ABOUT SCREEN - Demonstrates named route navigation
// ============================================================================
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Dos Computer Solution',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This screen was opened using named route navigation (Navigator.pushNamed).',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 16),
            Text(
              'We are a professional computer repair service with over 10 years of experience.',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// CONTACT SCREEN - Demonstrates named route navigation
// ============================================================================
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This screen was opened using named route navigation (Navigator.pushNamed).',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 16),
            Text(
              'Phone: +1 (555) 123-4567',
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              'Email: info@doscomputers.com',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// REUSABLE WIDGETS
// ============================================================================

// Chat Bubble Widget
class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String sender;

  const ChatBubble(
      {super.key,
      required this.text,
      required this.isMe,
      required this.sender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isMe ? Colors.teal : Colors.black54,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(color: isMe ? Colors.black : Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              sender,
              style: TextStyle(
                fontSize: 10,
                color: isMe ? Colors.black87 : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Service Card
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ServiceCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.tealAccent),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// Section Title
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.black87,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

// Profile Card
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person, size: 32, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Dos Computer Solution",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Certified Computer Technician",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text(
                  "4.9 Rating ",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "(127 reviews)",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.access_time, color: Colors.teal, size: 18),
                SizedBox(width: 6),
                Text(
                  "Same-day service available",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.workspace_premium, color: Colors.teal, size: 18),
                SizedBox(width: 6),
                Text(
                  "5+ years experience",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: const Text("Hardware"),
                  backgroundColor: Colors.blueGrey,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                Chip(
                  label: const Text("Software"),
                  backgroundColor: Colors.blueGrey,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                Chip(
                  label: const Text("Networking"),
                  backgroundColor: Colors.blueGrey,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
