import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class HelpFaqsScreen extends StatelessWidget {
  const HelpFaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {'q': 'How do I place an order?', 'a': 'Browse our menu, add items to cart, and proceed to checkout.'},
      {'q': 'What payment methods do you accept?', 'a': 'We accept credit cards, debit cards, and digital wallets.'},
      {'q': 'How long does delivery take?', 'a': 'Delivery typically takes 30-45 minutes depending on your location.'},
      {'q': 'Can I track my order?', 'a': 'Yes, you can track your order in real-time from the My Orders section.'},
      {'q': 'What is your refund policy?', 'a': 'We offer full refunds for cancelled orders and quality issues.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & FAQs'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
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
            child: ExpansionTile(
              title: Text(
                faqs[index]['q']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    faqs[index]['a']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}