import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../List/drawer_page.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  ProfilePageState createState() => ProfilePageState();
}
class ProfilePageState extends State<ProfilePage> {
  Future<Profile> fetchProfile() async {
    final response = await http.get(Uri.parse(
        'https://backend-little-haze-120.fly.dev/api/advisors/21058'));

    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined, size: 30),
            onPressed: () {},
          )
        ],
      ),
      drawer: const DrawerPage(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xfffacf74),
                  Color(0xffe8ba5c),
                ],
              ),
            ),
          ),
          FutureBuilder<Profile>(
            future: fetchProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                Profile profile = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/face.png'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        profile.userName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            InfoRow(label: 'userName', value: profile.userName),
                            InfoRow(
                                label: 'Age', value: profile.age.toString()),
                            InfoRow(label: 'id', value: profile.id.toString()),
                            InfoRow(label: 'address', value: profile.address),
                            InfoRow(
                                label: 'phoneNumber',
                                value: profile.phoneNumber),
                            InfoRow(label: 'gender', value: profile.gender),
                            InfoRow(label: 'email', value: profile.email),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({super.key, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFD2F1FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          '$label: $value',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// Model

class Profile {
  final String userName;
  final int age;
  final int id;
  final String address;
  final String phoneNumber;
  final String gender;
  final String email;
  Profile({
    required this.userName,
    required this.age,
    required this.id,
    required this.address,
    required this.phoneNumber,
    required this.gender,
    required this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      userName: json['userName'],
      age: int.tryParse(json['age'].toString()) ?? 0, // Convert age to int
      id: int.tryParse(json['id'].toString()) ?? 0, // Convert id to int
      address: json['address'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
