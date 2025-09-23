// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/create_user_page.dart';
import 'package:flutter_application_1/responsive/user_list_page.dart';
import 'package:flutter_application_1/responsive/login_page.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String _selectedPage = "dashboard";

  Widget _getPage() {
    switch (_selectedPage) {
      case "dashboard":
        return const DashboardPage();
      case "messages":
        return const MessagesPage();
      case "settings":
        return const SettingsPage();
      case "logout":
        return const LogoutPage();
      default:
        return const DashboardPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedPage[0].toUpperCase() + _selectedPage.substring(1),
        ),
        backgroundColor: Colors.grey[200],
      ),
      drawer: _buildDrawer(),
      body: _getPage(),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.grey[850],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.blueGrey],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text("Admin Panel"),
            accountEmail: Text("adminbasid@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.admin_panel_settings,
                  size: 40, color: Colors.blueAccent),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.white),
            title:
                const Text('Dashboard', style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() => _selectedPage = "dashboard");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat, color: Colors.white),
            title: const Text('Messages', style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() => _selectedPage = "messages");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() => _selectedPage = "settings");
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.white54),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Logout',
                style: TextStyle(color: Colors.redAccent)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void _handleCardTap(BuildContext context, String action) {
    if (action == "Create User") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateUserPage()),
      );
    } else if (action == "Read User") {
      print('Navigating to UsersListPage...');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UsersListPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$action tapped')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 50,
          mainAxisSpacing: 50,
          childAspectRatio: 1,
        ),
        children: [
          _buildDashboardCard(
            context,
            "Create User",
            Icons.person_add,
            Colors.green,
          ),
          _buildDashboardCard(
            context,
            "Read User",
            Icons.person_search,
            Colors.blue,
          ),
          _buildDashboardCard(
            context,
            "Reports",
            Icons.bar_chart,
            Colors.orange,
          ),
          _buildDashboardCard(
            context,
            "Notifications",
            Icons.notifications,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return GestureDetector(
      onTap: () => _handleCardTap(context, title),
      child: Card(
        elevation: 6,
        color: color.withOpacity(0.15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Messages Page", style: TextStyle(fontSize: 24)));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Settings Page", style: TextStyle(fontSize: 24)));
  }
}

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Logged out (dummy page)", style: TextStyle(fontSize: 24)),
    );
  }
}
