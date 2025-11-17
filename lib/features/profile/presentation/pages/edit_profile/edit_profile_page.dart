import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit_profile'.tr()),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Edit Profile Page Content Here"),
      ),
    );
  }
}
