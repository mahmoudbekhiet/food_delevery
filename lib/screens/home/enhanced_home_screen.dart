import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/routes/app_routes.dart';
import '../../providers/product_provider.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/animated_product_card.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/loading_widget.dart';

class EnhancedHomeScreen extends StatefulWidget {
  const EnhancedHomeScreen({super.key});

  @override
  State<EnhancedHomeScreen> createState() => _EnhancedHomeScreenState();
}

class _EnhancedHomeScreenState extends State<EnhancedHomeScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationController.forward();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    await Future.wait([
      productProvider.fetchProducts(),
      productProvider.fetchCategories(),
    ]);
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    final locale = AppLocalizations.of(context);
    
    if (hour < 12) {
      return locale!.goodMorning;
    } else if (hour < 17) {
      return locale!.goodAfternoon;
    } else {
      return locale!.goodEvening;
    }
  }

  String _getTimeMessage() {
    final hour = DateTime.now().hour;
    final locale = AppLocalizations.of(context);
    
    if (hour < 12) {
      return locale!.breakfastTime;
    } else if (hour < 17) {
      return locale!.lunchTime;
    } else {
      return locale!.dinnerTime;
    }
  }

  void _handleSearch(String query) {
    setState(() {
      _searchQuery = query;
    });
    
    if (query.isNotEmpty) {
      // Debounce search
      Future.delayed(const Duration(milliseconds: 300), () {
        if (_searchQuery == query) {
          final productProvider = Provider.of<ProductProvider>(context, listen: false);
          productProvider.searchProducts(query);
        }
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final locale = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? AppColors.headerGradientDark : AppColors.headerGradientLight,
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context, isDark, locale),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: RefreshIndicator(
                    onRefresh: _loadData,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: AnimationLimiter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 375),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(child: widget),
                            ),
                            children: [
                              const SizedBox(height: 20),
                              _buildCategories(context, isDark, locale),
                              const SizedBox(height: 24),
                              _buildBestSellers(context, isDark, locale),
                              const SizedBox(height: 24),
                              _buildPromoBanner(context, isDark, locale),
                              const SizedBox(height: 24),
                              _buildRecommendations(context, isDark, locale),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark, AppLocalizations locale) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Hero(
                  tag: 'search_bar',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: _handleSearch,
                        decoration: InputDecoration(
                          hintText: locale.searchHint,
                          hintStyle: TextStyle(color: AppColors.textSecondaryLight),
                          prefixIcon: Icon(Icons.search, color: AppColors.textSecondaryLight),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          suffixIcon: _searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchController.clear();
                                    _handleSearch('');
                                  },
                                )
                              : Container(
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.tune, color: Colors.white, size: 20),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.cart),
                    child: badges.Badge(
                      badgeContent: Text(
                        '${cartProvider.itemCount}',
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      showBadge: cartProvider.itemCount > 0,
                      badgeAnimation: const badges.BadgeAnimation.scale(),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.notifications),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getGreeting(),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _getTimeMessage(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context, bool isDark, AppLocalizations locale) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        if (productProvider.isLoading) {
          return const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (productProvider.categories.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: productProvider.categories.length,
            itemBuilder: (context, index) {
              final category = productProvider.categories[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CategoryChip(
                  category: category,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.category,
                      arguments: {'category': category},
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBestSellers(BuildContext context, bool isDark, AppLocalizations locale) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        if (productProvider.isLoading) {
          return SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: ProductCardShimmer(),
                );
              },
            ),
          );
        }

        if (productProvider.bestSellers.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    locale.bestSeller,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to all best sellers
                      Navigator.pushNamed(context, AppRoutes.category, arguments: {
                        'category': productProvider.categories.first,
                        'title': locale.bestSeller,
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          locale.viewAll,
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: productProvider.bestSellers.length,
                itemBuilder: (context, index) {
                  final product = productProvider.bestSellers[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: AnimatedProductCard(
                      product: product,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.productDetail,
                          arguments: {'product': product},
                        );
                      },
                      onFavorite: () {
                        productProvider.toggleFavorite(product.id);
                      },
                      onAddToCart: () {
                        final cartProvider = Provider.of<CartProvider>(context, listen: false);
                        cartProvider.addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart'),
                            duration: const Duration(seconds: 1),
                            backgroundColor: AppColors.success,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPromoBanner(BuildContext context, bool isDark, AppLocalizations locale) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          // Navigate to promo details
        },
        child: Hero(
          tag: 'promo_banner',
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: isDark ? AppColors.primaryGradientDark : AppColors.primaryGradientLight,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: (isDark ? AppColors.primaryDark : AppColors.primaryLight).withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  top: -20,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        locale.promoTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        locale.promoDiscount,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendations(BuildContext context, bool isDark, AppLocalizations locale) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        if (productProvider.isLoading) {
          return Column(
            children: List.generate(
              2,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: ListItemShimmer(),
              ),
            ),
          );
        }

        if (productProvider.recommendations.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                locale.recommend,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: productProvider.recommendations.length,
                itemBuilder: (context, index) {
                  final product = productProvider.recommendations[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: AnimatedProductCard(
                      product: product,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.productDetail,
                          arguments: {'product': product},
                        );
                      },
                      onFavorite: () {
                        productProvider.toggleFavorite(product.id);
                      },
                      onAddToCart: () {
                        final cartProvider = Provider.of<CartProvider>(context, listen: false);
                        cartProvider.addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart'),
                            duration: const Duration(seconds: 1),
                            backgroundColor: AppColors.success,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}