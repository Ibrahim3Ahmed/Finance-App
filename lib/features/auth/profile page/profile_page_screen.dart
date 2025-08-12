import 'package:flutter/material.dart';
import 'package:new_learn/core/styling/app_styles.dart';
import 'package:new_learn/core/styling/app_colors.dart';

import 'package:new_learn/core/widgets/custom_text_filed.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  final TextEditingController nameController =
      TextEditingController(text: "Ibrahim Ahmed");
  final TextEditingController emailController =
      TextEditingController(text: "IbrahimAhmed@gmail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "+1 3712 3789");
  final TextEditingController addressController =
      TextEditingController(text: "Mansoura, Egypt");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "My Profile",
            style: AppStyles.black18boldStyles.copyWith(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                isEditing ? Icons.check : Icons.edit,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                  if (!isEditing) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated')),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // صورة البروفايل
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                if (isEditing)
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                  ),
              ],
            ),
            const SizedBox(height: 32),

            // عناصر البروفايل
            buildProfileItem("Full Name", nameController),
            buildProfileItem("Email", emailController),
            buildProfileItem("Phone Number", phoneController),
            buildProfileItem("Address", addressController),
          ],
        ),
      ),
    );
  }

  Widget buildProfileItem(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
        const SizedBox(height: 8),
        isEditing
            ? CustomTextFiled(
                controller: controller,
                hintText: title,
              )
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xffF7F8F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xffE8ECF4)),
                ),
                child: Text(
                  controller.text,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
        const SizedBox(height: 20),
      ],
    );
  }
}






