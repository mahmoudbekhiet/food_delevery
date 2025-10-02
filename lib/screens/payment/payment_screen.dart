import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../providers/cart_provider.dart';
import '../../providers/order_provider.dart';
import '../../widgets/custom_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.payment,
                size: 80,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Processing Payment',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please wait while we process your payment',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Consumer2<CartProvider, OrderProvider>(
              builder: (context, cartProvider, orderProvider, child) {
                return CustomButton(
                  text: 'Confirm Payment',
                  onPressed: () async {
                    // Simulate payment processing
                    await Future.delayed(const Duration(seconds: 1));
                    
                    // Clear cart
                    cartProvider.clearCart();
                    
                    // Navigate to order confirmed
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.orderConfirmed,
                      (route) => false,
                    );
                  },
                  width: double.infinity,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}