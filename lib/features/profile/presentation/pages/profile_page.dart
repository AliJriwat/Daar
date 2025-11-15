import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daar_project/core/common/app_user/app_user_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _logout(BuildContext context) {
    context.read<AppUserCubit>().updateUser(null);
    // Automaticamente tornerà alla LoginPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<AppUserCubit, AppUserState>(
        builder: (context, state) {
          if (state is AppUserLoggedIn) {
            return _buildProfileContent(context, state);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, AppUserLoggedIn state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 👤 Header con Cerchio Nero, Nome e Email
          _buildProfileHeader(state),

          const SizedBox(height: 32),

          // 📝 Lista delle opzioni
          _buildOptionsList(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(AppUserLoggedIn state) {
    return Column(
      children: [
        // Cerchio Nero con icona persona
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            size: 50,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 16),

        // ⭐ USA SOLO EMAIL - non hai fullName
        Text(
          state.user.email,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        // Testo fisso invece di fullName
        Text(
          'Daar Member',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionsList(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          // Edit Profile
          _buildListTile(
            icon: Icons.edit,
            title: 'Edit Profile',
            onTap: () {
              // Navigator.push(...) per edit profile
            },
          ),

          const Divider(height: 1),

          // Add Addresses
          _buildListTile(
            icon: Icons.location_on,
            title: 'Add Addresses',
            onTap: () {
              // Navigator.push(...) per addresses
            },
          ),

          const Divider(height: 1),

          // Settings
          _buildListTile(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              // Navigator.push(...) per settings
            },
          ),

          const Divider(height: 1),

          // About
          _buildListTile(
            icon: Icons.info,
            title: 'About',
            onTap: () {
              // Navigator.push(...) per about
            },
          ),

          const Divider(height: 1),

          // Help Center
          _buildListTile(
            icon: Icons.help_center,
            title: 'Help Center',
            onTap: () {
              // Navigator.push(...) per help
            },
          ),

          const Divider(height: 1),

          // Partner Mode
          _buildListTile(
            icon: Icons.business_center,
            title: 'Partner Mode',
            onTap: () {
              // Navigator.push(...) per partner mode
            },
          ),

          const Divider(height: 1),

          // Logout - Rosso per pericolo
          _buildListTile(
            icon: Icons.logout,
            title: 'Logout',
            color: Colors.red,
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}