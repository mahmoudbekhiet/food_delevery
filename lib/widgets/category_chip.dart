import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/category_model.dart';

class CategoryChip extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.category,
    required this.onTap,
  });

  Color _getCategoryColor() {
    switch (category.name.toLowerCase()) {
      case 'snacks':
        return AppColors.categorySnacks;
      case 'meal':
        return AppColors.categoryMeal;
      case 'vegan':
        return AppColors.categoryVegan;
      case 'dessert':
        return AppColors.categoryDessert;
      case 'drinks':
        return AppColors.categoryDrinks;
      default:
        return AppColors.categorySnacks;
    }
  }

  IconData _getCategoryIcon() {
    switch (category.name.toLowerCase()) {
      case 'snacks':
        return Icons.cookie;
      case 'meal':
        return Icons.restaurant;
      case 'vegan':
        return Icons.eco;
      case 'dessert':
        return Icons.cake;
      case 'drinks':
        return Icons.local_drink;
      default:
        return Icons.fastfood;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: _getCategoryColor(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              _getCategoryIcon(),
              color: AppColors.primary,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}