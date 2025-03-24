import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BusinessManagementApp());
}

class BusinessManagementApp extends StatelessWidget {
  const BusinessManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Management',
      theme: ThemeData(
        primaryColor: const Color(0xFF8DA9C4), // Light Navy Blue
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF8DA9C4), // Light Navy Blue
          secondary: const Color(0xFFE8CEBF), // Beige
          background: Colors.white,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8DA9C4), // Light Navy Blue
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF8DA9C4), // Light Navy Blue
        ),
      ),
      home: const HomeScreen(username: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF8DA9C4), // Light Navy Blue
              const Color(0xFF8DA9C4).withOpacity(0.7),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Logo/Icon
                          Icon(
                            Icons.insights,
                            size: 80,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 16),
                          // App Name
                          Text(
                            'Insight HQ',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Business Management Suite',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Username Field
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'Enter your username',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a username';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Password Field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Handle forgot password
                              },
                              child: const Text('Forgot Password?'),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Navigate to home screen after successful login
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const HomeScreen(
                                            username: 'User',
                                          ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Register Option
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Handle registration
                                },
                                child: const Text('Register'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MarketingScreen(),
    const ReviewsScreen(),
    const StatisticsScreen(),
    const SponsorsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  void _showNavigationSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          decoration: const BoxDecoration(
            color: Color(0xFF8DA9C4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavButton(0, Icons.home, 'Home'),
                    _buildNavButton(1, Icons.star, 'Reviews'),
                    _buildNavButton(2, Icons.bar_chart, 'Stats'),
                    _buildNavButton(3, Icons.handshake, 'Sponsors'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  void _showAccountOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withOpacity(0.2),
                  child: Text(
                    widget.username.isNotEmpty
                        ? widget.username[0].toUpperCase()
                        : 'U',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(widget.username),
                subtitle: const Text('Current Account'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.switch_account),
                title: const Text('Switch Account'),
                onTap: () {
                  Navigator.pop(context);
                  // Show account switching options here
                  _showSwitchAccountDialog();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Account Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to account settings
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showLogoutConfirmation();
                },
              ),
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  void _showSwitchAccountDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Switch Account'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAccountOption('Business Owner'),
                _buildAccountOption('Manager'),
                _buildAccountOption('Employee'),
                const Divider(),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  title: const Text('Add New Account'),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle add new account
                  },
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildAccountOption(String name) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        child: Text(
          name[0],
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          // Update current username
        });
      },
    );
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Logout Confirmation'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate back to login screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Logout'),
              ),
            ],
          ),
    );
  }

  Widget _buildNavButton(int index, IconData icon, String label) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                _selectedIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.6),
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color:
                  _selectedIndex == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insight HQ'),
        elevation: 0,
        actions: [
          // Add account icon button
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: _showAccountOptions,
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _showNavigationSheet,
        backgroundColor: const Color(0xFF1A237E),
        child: const Icon(Icons.menu),
      ),
    );
  }
}

class SponsorsScreen extends StatefulWidget {
  const SponsorsScreen({Key? key}) : super(key: key);

  @override
  State<SponsorsScreen> createState() => _SponsorsScreenState();
}

class _SponsorsScreenState extends State<SponsorsScreen> {
  String _searchQuery = '';
  String _selectedFilter = 'All';
  final List<String> _filterOptions = ['All', 'Money', 'Services', 'Products'];

  // Sample sponsor data
  final List<Map<String, dynamic>> _allSponsors = [
    {
      'name': 'NVIDIA',
      'description': 'E-commerce, cloud computing, logistics',
      'offering':
          'Access to NVIDIA technology, courses, and preferred pricing on NVIDIA products',
      'type': 'Products',
      'logo': Icons.computer,
    },
    {
      'name': 'Amazon',
      'description':
          'Full-service marketing agency specializing in local businesses',
      'offering': 'Seller growth, tech access support',
      'type': 'Services',
      'logo': Icons.campaign,
    },
    {
      'name': 'Google',
      'description': 'Search, advertising, technology services',
      'offering': 'Digital skills, business growth funding.',
      'type': 'Services',
      'logo': Icons.account_balance,
    },
    {
      'name': 'Microsoft',
      'description': ' Software, cloud, technology solutions',
      'offering': 'Tech equity, startup cloud access.',
      'type': 'Products',
      'logo': Icons.shopping_bag,
    },
    {
      'name': 'Growth Venture Capital',
      'description': 'Early-stage funding for promising local businesses',
      'offering': '\$25,000 - \$100,000 investment opportunities',
      'type': 'Money',
      'logo': Icons.trending_up,
    },
    {
      'name': 'Small Business Association',
      'description': 'Government-backed organization supporting SMBs',
      'offering': 'Business development grants up to \$15,000',
      'type': 'Money',
      'logo': Icons.assignment,
    },
    {
      'name': 'Cloud Hosting Inc',
      'description': 'Cloud infrastructure and hosting services',
      'offering': '6 months free premium hosting package',
      'type': 'Services',
      'logo': Icons.cloud,
    },
  ];

  List<Map<String, dynamic>> get _filteredSponsors {
    return _allSponsors.where((sponsor) {
      final matchesSearch =
          sponsor['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          sponsor['description'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );

      final matchesFilter =
          _selectedFilter == 'All' || sponsor['type'] == _selectedFilter;

      return matchesSearch && matchesFilter;
    }).toList();
  }

  void _showColdEmailDialog(Map<String, dynamic> sponsor) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Email ${sponsor['name']}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subject: Partnership Inquiry regarding ${sponsor['offering']}',
                ),
                const SizedBox(height: 16),
                Text(
                  'This will prepare a cold email template to reach out to ${sponsor['name']} about their ${sponsor['offering']} opportunity.',
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Additional notes (optional)',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Here you would actually send or prepare the email
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Cold email template for ${sponsor['name']} prepared!',
                      ),
                    ),
                  );
                },
                child: const Text('Prepare Email'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Potential Sponsors',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),

          // Search and filter bar
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search sponsors...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedFilter,
                      isExpanded: true,
                      hint: const Text('Filter by'),
                      items:
                          _filterOptions.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedFilter = newValue;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Results count
          Text(
            '${_filteredSponsors.length} sponsor${_filteredSponsors.length != 1 ? 's' : ''} found',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 16),

          // Sponsors grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                    0.65, // Decrease this value to make cards taller
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _filteredSponsors.length,
              itemBuilder: (context, index) {
                final sponsor = _filteredSponsors[index];
                return _buildSponsorCard(sponsor);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSponsorCard(Map<String, dynamic> sponsor) {
    final Color typeColor =
        sponsor['type'] == 'Money'
            ? Colors.green
            : sponsor['type'] == 'Services'
            ? Colors.blue
            : Colors.orange;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    sponsor['logo'],
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    sponsor['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: typeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      sponsor['type'],
                      style: TextStyle(
                        color: typeColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sponsor['description'],
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sponsor['offering'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showColdEmailDialog(sponsor),
                icon: const Icon(Icons.email, size: 16),
                label: const Text('Cold Email'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Statistics Screen
class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool _showYearlyData = false;
  bool _showExtraInfo = false; // New variable to track extra info visibility
  List<String> _positiveKeywords = [];
  List<String> _negativeKeywords = [];
  List<String> _neutralKeywords = [];
  bool _keywordsLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadKeywords();
  }

  // Load keywords and categorize them
  Future<void> _loadKeywords() async {
    try {
      // In a real app, you would load your CSV file
      // For simulation purposes, I'm adding sample keywords based on your CSV
      _positiveKeywords = [
        'clean',
        'friendly',
        'good',
        'best',
        'skilled',
        'professional',
        'love',
        'satisfied',
        'great',
        'amazing',
        'perfect',
        'comfortable',
        'fantastic',
        'excellent',
        'modern',
      ];

      _negativeKeywords = [
        'bad',
        'poor',
        'rushed',
        'dirty',
        'disappointed',
        'long',
        'unhappy',
        'terrible',
        'inappropriate',
        'unprofessional',
        'noisy',
        'upset',
        'broken',
        'disaster',
        'inexperienced',
      ];

      _neutralKeywords = [
        'haircut',
        'barber',
        'beard',
        'hairstyle',
        'service',
        'different',
        'reasonable',
        'regular',
        'new',
        'shop',
        'wait',
        'trim',
        'apology',
      ];

      setState(() {
        _keywordsLoaded = true;
      });
    } catch (e) {
      print('Error loading keywords: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business Statistics',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),

            // Extra Info Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _showExtraInfo = !_showExtraInfo;
                  });
                },
                icon: Icon(
                  _showExtraInfo ? Icons.visibility_off : Icons.visibility,
                ),
                label: Text(_showExtraInfo ? 'Hide Extra Info' : 'Extra Info'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Conditional display of statistics cards
            if (_showExtraInfo) ...[
              _buildStatCard(
                'Monthly Revenue',
                '\$12,500',
                Icons.attach_money,
                context,
              ),
              const SizedBox(height: 16),
              _buildStatCard('New Customers', '42', Icons.person_add, context),
              const SizedBox(height: 16),
              _buildStatCard(
                'Conversion Rate',
                '8.7%',
                Icons.trending_up,
                context,
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                'Average Order',
                '\$95',
                Icons.shopping_cart,
                context,
              ),
              const SizedBox(height: 16),
            ],

            const SizedBox(height: 24),

            // Keyword Analysis Section
            Text(
              'Review Keywords',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),

            // Keywords Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Most Common Keywords in Reviews',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Keywords Cloud
                    _keywordsLoaded
                        ? _buildKeywordTabs(context)
                        : const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Sentiment Analysis Section
            Text(
              'Review Sentiment Trends',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),

            // Chart Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image container for chart
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "asset/linegraph.png",
                        // In a real app, you would use your actual image source
                        // Since this is just a demo, we're using a placeholder
                        // The actual image would be replaced with your chart image
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Text('Sentiment Trend Chart'),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Toggle Button for Details
                    Center(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showYearlyData = !_showYearlyData;
                          });
                        },
                        icon: Icon(
                          _showYearlyData
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        label: Text(
                          _showYearlyData
                              ? 'Hide Details'
                              : 'View Yearly Details',
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),

                    // Yearly Data (Conditional Display)
                    if (_showYearlyData) ...[
                      const SizedBox(height: 16),
                      _buildYearlyDataTable(context),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeywordTabs(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabs: const [
              Tab(text: 'Positive'),
              Tab(text: 'Negative'),
              Tab(text: 'Neutral'),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                _buildKeywordCloud(_positiveKeywords, Colors.green),
                _buildKeywordCloud(_negativeKeywords, Colors.red),
                _buildKeywordCloud(_neutralKeywords, Colors.amber),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeywordCloud(List<String> keywords, Color baseColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children:
            keywords.map((keyword) {
              // Simulate frequency by varying opacity and font size
              final double randomValue = (keyword.hashCode % 100) / 100;
              final double fontSize =
                  12 + (randomValue * 8); // Font size between 12-20
              final double opacity =
                  0.6 + (randomValue * 0.4); // Opacity between 0.6-1.0

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: baseColor.withOpacity(opacity),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  keyword,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    BuildContext context,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYearlyDataTable(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey.shade300,
        width: 1,
        borderRadius: BorderRadius.circular(8),
      ),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      children: [
        // Header Row
        TableRow(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Year',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Positive',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Negative',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Neutral',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // 2023 Data
        TableRow(
          children: [
            const Padding(padding: EdgeInsets.all(8.0), child: Text('2023')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '52.63%',
                style: TextStyle(color: Colors.green.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '44.74%',
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '2.63%',
                style: TextStyle(color: Colors.amber.shade700),
              ),
            ),
          ],
        ),
        // 2024 Data
        TableRow(
          children: [
            const Padding(padding: EdgeInsets.all(8.0), child: Text('2024')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '41.67%',
                style: TextStyle(color: Colors.green.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '55.56%',
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '2.77%',
                style: TextStyle(color: Colors.amber.shade700),
              ),
            ),
          ],
        ),
        // 2025 Data
        TableRow(
          children: [
            const Padding(padding: EdgeInsets.all(8.0), child: Text('2025')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '46.43%',
                style: TextStyle(color: Colors.green.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '42.86%',
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '10.71%',
                style: TextStyle(color: Colors.amber.shade700),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Reviews Screen
class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  // Sentiment counts from CSV analysis
  final int positiveCount = 47;
  final int negativeCount = 48;
  final int neutralCount = 5;
  final int totalReviews = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Reviews',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(height: 0),

          // Sentiment Analysis Card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Analysis',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Positive Sentiment Bar
                  _buildSentimentBar(
                    context: context,
                    label: 'Positive',
                    count: positiveCount,
                    total: totalReviews,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 12),

                  // Neutral Sentiment Bar
                  _buildSentimentBar(
                    context: context,
                    label: 'Neutral',
                    count: 5,
                    total: 100,
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 12),

                  // Negative Sentiment Bar
                  _buildSentimentBar(
                    context: context,
                    label: 'Negative',
                    count: negativeCount,
                    total: totalReviews,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: const [
                ReviewCard(
                  name: 'Noah Wilson',
                  rating: 3,
                  date: '2 days ago',
                  comment: "Good service, but the prices are a bit high.",
                  sentiment: 'Neutral',
                ),
                ReviewCard(
                  name: 'James Rodriguez',
                  rating: 1,
                  date: '1 week ago',
                  comment:
                      "Barber was rushed and didn't pay attention to details.",
                  sentiment: 'Negative',
                ),
                ReviewCard(
                  name: 'Isabella Williams',
                  rating: 5,
                  date: '4 days ago',
                  comment:
                      'Excellent service and friendly staff. Will be back.',
                  sentiment: 'Positive',
                ),
                ReviewCard(
                  name: 'Chloe Garcia',
                  rating: 5,
                  date: '2 weeks ago',
                  comment: "Love my new hairstyle! Thanks, Fresh Cuts!",
                  sentiment: 'Positive',
                ),
                ReviewCard(
                  name: 'Matthew Wilson',
                  rating: 1,
                  date: '2 weeks ago',
                  comment:
                      "The barber was inexperienced and unsure of what to do.!",
                  sentiment: 'Negative',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSentimentBar({
    required BuildContext context,
    required String label,
    required int count,
    required int total,
    required Color color,
  }) {
    final double percentage = (count / total) * 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
            Text(
              '$count ($percentage%)',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Stack(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            FractionallySizedBox(
              widthFactor: count / total,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final int rating;
  final String date;
  final String comment;
  final String sentiment;

  const ReviewCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.date,
    required this.comment,
    required this.sentiment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color:
                            sentiment == 'Positive'
                                ? Colors.green.withOpacity(0.2)
                                : sentiment == 'Neutral'
                                ? Colors.amber.withOpacity(0.2)
                                : Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        sentiment,
                        style: TextStyle(
                          color:
                              sentiment == 'Positive'
                                  ? Colors.green
                                  : sentiment == 'Neutral'
                                  ? Colors.amber.shade800
                                  : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                );
              }),
            ),
            const SizedBox(height: 8),
            Text(comment),
          ],
        ),
      ),
    );
  }
}

// Marketing Screen (Homepage)
// Marketing Screen (Homepage)
// Marketing Screen (Homepage)
class MarketingScreen extends StatelessWidget {
  MarketingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Local Opportunities',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSearchRow(context),
                  const SizedBox(height: 16),
                  _buildQuickActions(context),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => OpportunityCard(
                  title: opportunities[index]['title'],
                  description: opportunities[index]['description'],
                  tag: opportunities[index]['tag'],
                  date: opportunities[index]['date'],
                ),
                childCount: opportunities.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search opportunities...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(Icons.tune, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildActionButton(
            context: context,
            icon: Icons.event,
            label: 'Events',
            color: Colors.blue.shade100,
          ),
          _buildActionButton(
            context: context,
            icon: Icons.group,
            label: 'Networking',
            color: Colors.green.shade100,
          ),
          _buildActionButton(
            context: context,
            icon: Icons.school,
            label: 'Education',
            color: Colors.orange.shade100,
          ),
          _buildActionButton(
            context: context,
            icon: Icons.volunteer_activism,
            label: 'Community',
            color: Colors.purple.shade100,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 28, color: Colors.grey.shade800),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> opportunities = [
    {
      'title': 'Business Networking',
      'description': 'Connect with local entrepreneurs and potential partners',
      'tag': 'Featured',
      'date': 'Mar 30',
    },
    {
      'title': 'School Supplies Drive',
      'description': 'Support local schools with essential supplies',
      'tag': 'Community',
      'date': 'Ongoing',
    },
    {
      'title': 'Summer Festival',
      'description': 'Apply for vendor space at the annual city festival',
      'tag': 'Event',
      'date': 'Apr 15',
    },
    {
      'title': 'Marketing Workshop',
      'description': 'Free digital marketing strategies workshop',
      'tag': 'Education',
      'date': 'Apr 5',
    },
    {
      'title': 'Online Marketplace',
      'description': 'New local business platform launching soon',
      'tag': 'Digital',
      'date': 'Apr 2025',
    },
    {
      'title': 'Mentorship Program',
      'description': 'Connect with experienced business mentors',
      'tag': 'Networking',
      'date': 'Apr 10',
    },
  ];
}

class OpportunityCard extends StatelessWidget {
  final String title;
  final String description;
  final String tag;
  final String date;

  const OpportunityCard({
    Key? key,
    required this.title,
    required this.description,
    required this.tag,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getTagColor(tag),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                description,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: Icon(Icons.info_outline, size: 16),
                label: const Text('View Details'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'featured':
        return Colors.orange.shade600;
      case 'community':
        return Colors.green.shade600;
      case 'event':
        return Colors.blue.shade600;
      case 'education':
        return Colors.purple.shade600;
      case 'digital':
        return Colors.teal.shade600;
      default:
        return Colors.grey.shade600;
    }
  }
}
