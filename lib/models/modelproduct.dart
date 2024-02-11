import 'package:flutter/material.dart';

class Film {
  final String id;
  final String name;
  final String description;
  final String rating;
  final double price;
  final String image;

  Film({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.image,
  });
}

class FilmStore extends ChangeNotifier{
  final List<Film> _film=[
    Film(
      id: "1",
      name: "Infinix INFINIX ",
      price: 359.00,
      description: "Restez jusqu'au boutLa stratégie exclusive du marathon de puissance ",
      image: "assets/movies/the-tank.jpeg",
      rating: "22.5",
    ),
    Film(
      id: "2",
      name: "Infinix INFINIX ",
      price: 359.00,
      description: "Restez jusqu'au boutLa stratégie exclusive du marathon de puissance ",
      image: "assets/movies/the-tank.jpeg",
      rating: "22.5",
    ),
     Film(
      id: "2",
      name: "Infinix INFINIX ",
      price: 359.00,
      description: "Restez jusqu'au boutLa stratégie exclusive du marathon de puissance ",
      image: "assets/movies/the-tank.jpeg",
      rating: "22.5",
    ),
     Film(
      id: "2",
      name: "Infinix INFINIX ",
      price: 359.00,
      description: "Restez jusqu'au boutLa stratégie exclusive du marathon de puissance ",
      image: "assets/movies/the-tank.jpeg",
      rating: "22.5",
    ),
  ];

  List<Film> _cart = [];

  List<Film> get film => _film;

  List<Film> get cart => _cart;

  void addToCart(Film item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Film item) {
    _cart.remove(item);
    notifyListeners();
  }
}
