import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/routes/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSettingItem(
            context,
            icon: Icons.notifications,
            title: 'Notification Settings',
            onTap: () => Navigator.pushNamed(context, AppRoutes.notificationSettings),
          ),
          _buildSettingItem(
            context,
            icon: Icons.lock,
            title: 'Password Settings',
            onTap: () {},
          ),
          _buildSettingItem(
            context,
            icon: Icons.language,
            title: 'Language',
            trailing: const Text('English', style: TextStyle(color: AppColors.textSecondary)),
            onTap: () {},
          ),
          _buildSettingItem(
            context,
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            trailing: Switch(
              value: false,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
            onTap: null,
          ),
          _buildSettingItem(
            context,
            icon: Icons.info,
            title: 'About',
            onTap: () {},
          ),
          _buildSettingItem(
            context,
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          _buildSettingItem(
            context,
            icon: Icons.description,
            title: 'Terms & Conditions',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
      ),
    );
  }
}