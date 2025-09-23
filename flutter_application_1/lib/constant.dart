
import 'package:flutter/material.dart';

var myDefaultColor = Colors.grey[200];

var myAppBar = AppBar(
  backgroundColor: Colors.black,
  title: Text('My Responsive App', 
  style: TextStyle(
    color: Colors.white
  ),),
);

Drawer buildMyDrawer(Function(String) onItemTap) {
  return Drawer(
    backgroundColor: Colors.grey[500],
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: Icon(Icons.favorite, size: 48, color: Colors.white),
        ),
        ListTile(
          leading: const Icon(Icons.home, color: Colors.white),
          title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
          onTap: () => onItemTap('dashboard'),
        ),
        ListTile(
          leading: const Icon(Icons.chat, color: Colors.white),
          title: const Text('Message', style: TextStyle(color: Colors.white)),
          onTap: () => onItemTap('messages'),
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.white),
          title: const Text('Settings', style: TextStyle(color: Colors.white)),
          onTap: () => onItemTap('settings'),
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.white),
          title: const Text('Logout', style: TextStyle(color: Colors.white)),
          onTap: () => onItemTap('logout'),
        ),
      ],
    ),
  );
}

