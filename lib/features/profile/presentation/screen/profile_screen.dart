import 'package:day_i/features/profile/presentation/widget/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(userName: 'userName', userEmail: 'userEmail'),
          ],
        ),
      ),
    );
  }
}