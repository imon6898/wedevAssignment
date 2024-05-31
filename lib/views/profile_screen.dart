import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/controllers/profile_controller.dart';


class ProfileScreen extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 20),
            Obx(() {
              return _profileController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  _profileController.updateProfile(
                    _firstNameController.text,
                    _lastNameController.text,
                  );
                },
                child: Text('Update Profile'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
