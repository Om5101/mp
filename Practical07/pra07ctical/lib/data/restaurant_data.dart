import 'package:flutter/material.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final String deliveryTime;
  final String deliveryFee;
  final List<FoodItem> menu;
  final bool isFavorite;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.menu,
    this.isFavorite = false,
  });
}

class FoodItem {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final List<String> categories;
  final bool isFavorite;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.categories,
    this.isFavorite = false,
  });
}

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [
    Restaurant(
      id: '1',
      name: 'Burger King',
      description: 'Home of the Whopper',
      imageUrl: 'https://images.unsplash.com/photo-1551782450-17144efb9c50?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww',
      rating: 4.5,
      deliveryTime: '20-30 min',
      deliveryFee: '\$2.99',
      menu: [
        FoodItem(
          id: '1',
          name: 'Whopper',
          description: 'Flame-grilled beef patty with fresh toppings',
          imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww',
          price: 5.99,
          categories: ['Burgers', 'Fast Food'],
        ),
        FoodItem(
          id: '2',
          name: 'Chicken Fries',
          description: 'Crispy chicken strips in fry shape',
          imageUrl: 'https://images.unsplash.com/photo-1562967914-608f82629710?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2hpY2tlbiUyMGZyaWVzfGVufDB8fDB8fHww',
          price: 3.99,
          categories: ['Chicken', 'Fast Food'],
        ),
      ],
    ),
    Restaurant(
      id: '2',
      name: 'Pizza Hut',
      description: 'World\'s Favorite Pizza',
      imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D',
      rating: 4.3,
      deliveryTime: '25-35 min',
      deliveryFee: '\$1.99',
      menu: [
        FoodItem(
          id: '3',
          name: 'Pepperoni Pizza',
          description: 'Classic pepperoni pizza with extra cheese',
          imageUrl: 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVwcGVyb25pJTIwcGl6emF8ZW58MHx8MHx8fDA%3D',
          price: 12.99,
          categories: ['Pizza', 'Italian'],
        ),
        FoodItem(
          id: '4',
          name: 'Garlic Bread',
          description: 'Freshly baked bread with garlic butter',
          imageUrl: 'https://images.unsplash.com/photo-1608190003443-86a5a8720c12?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z2FybGljJTIwYnJlYWR8ZW58MHx8MHx8fDA%3D',
          price: 4.99,
          categories: ['Appetizers', 'Italian'],
        ),
      ],
    ),
    Restaurant(
      id: '3',
      name: 'Sushi Master',
      description: 'Authentic Japanese Cuisine',
      imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3VzaGl8ZW58MHx8MHx8fDA%3D',
      rating: 4.8,
      deliveryTime: '30-40 min',
      deliveryFee: '\$3.99',
      menu: [
        FoodItem(
          id: '5',
          name: 'California Roll',
          description: 'Crab, avocado, and cucumber roll',
          imageUrl: 'https://images.unsplash.com/photo-1617196701537-380a6f112d7e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FsaWZvcm5pYSUyMHJvbGx8ZW58MHx8MHx8fDA%3D',
          price: 8.99,
          categories: ['Sushi', 'Japanese'],
        ),
        FoodItem(
          id: '6',
          name: 'Miso Soup',
          description: 'Traditional Japanese soup with tofu',
          imageUrl: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWlzbyUyMHNvdXB8ZW58MHx8MHx8fDA%3D',
          price: 3.99,
          categories: ['Soup', 'Japanese'],
        ),
      ],
    ),
  ];

  List<Restaurant> get restaurants => _restaurants;

  List<Restaurant> get favoriteRestaurants =>
      _restaurants.where((restaurant) => restaurant.isFavorite).toList();

  void toggleFavorite(String restaurantId) {
    final index = _restaurants.indexWhere((r) => r.id == restaurantId);
    if (index != -1) {
      _restaurants[index] = Restaurant(
        id: _restaurants[index].id,
        name: _restaurants[index].name,
        description: _restaurants[index].description,
        imageUrl: _restaurants[index].imageUrl,
        rating: _restaurants[index].rating,
        deliveryTime: _restaurants[index].deliveryTime,
        deliveryFee: _restaurants[index].deliveryFee,
        menu: _restaurants[index].menu,
        isFavorite: !_restaurants[index].isFavorite,
      );
      notifyListeners();
    }
  }

  List<FoodItem> getAllFoodItems() {
    return _restaurants.expand((restaurant) => restaurant.menu).toList();
  }

  List<FoodItem> getFavoriteFoodItems() {
    return getAllFoodItems().where((item) => item.isFavorite).toList();
  }

  void toggleFoodItemFavorite(String foodItemId) {
    for (var restaurant in _restaurants) {
      final index = restaurant.menu.indexWhere((item) => item.id == foodItemId);
      if (index != -1) {
        final updatedMenu = List<FoodItem>.from(restaurant.menu);
        updatedMenu[index] = FoodItem(
          id: updatedMenu[index].id,
          name: updatedMenu[index].name,
          description: updatedMenu[index].description,
          imageUrl: updatedMenu[index].imageUrl,
          price: updatedMenu[index].price,
          categories: updatedMenu[index].categories,
          isFavorite: !updatedMenu[index].isFavorite,
        );
        _restaurants[_restaurants.indexOf(restaurant)] = Restaurant(
          id: restaurant.id,
          name: restaurant.name,
          description: restaurant.description,
          imageUrl: restaurant.imageUrl,
          rating: restaurant.rating,
          deliveryTime: restaurant.deliveryTime,
          deliveryFee: restaurant.deliveryFee,
          menu: updatedMenu,
          isFavorite: restaurant.isFavorite,
        );
        notifyListeners();
        break;
      }
    }
  }
} 