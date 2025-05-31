import 'package:flutter/material.dart';
import 'package:freely/Featuer/Profile/presentation/view/widget/profile_item.dart';
import 'package:freely/core/widget/appare_widget.dart';

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'صفحة البروفايل',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppareWidget(title: 'Profile', automaticallyImplyLeading: true),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/image/boy.png'),
                backgroundColor: Color.fromARGB(255, 125, 124, 124),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              ' Mohamad issa',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          const ProfileInfoItem(
            icon: Icons.phone,
            title: 'رقم الهاتف',
            value: '+963 988776622',
          ),
          const ProfileInfoItem(
            icon: Icons.email,
            title: 'البريد الإلكتروني',
            value: 'ahmad@example.com',
          ),
          const ProfileInfoItem(
            icon: Icons.location_on,
            title: 'العنوان',
            value: 'دمشق',
          ),
        ],
      ),
    );
  }
}
