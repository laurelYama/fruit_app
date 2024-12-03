import 'package:flutter/material.dart';
import 'package:fruit_app/pages/lastePage.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _currentIndex = 0; // Indice de l'image affichée
  int _quantity = 1; // Quantité actuelle
  int _cartItems = 0; // Nombre d'articles dans le panier
  final double _unitPrice = 2.00; // Prix unitaire

  final List<String> images = [
    'images/banane.png',
    'images/banana.png',
    'images/banana2.png',
    'images/banana4.png',
  ];

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) _quantity--;
    });
  }

  void _addToCart() {
    setState(() {
      _cartItems += _quantity;
      _quantity = 1; // Réinitialiser la quantité après ajout au panier
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _quantity * _unitPrice; // Calcul du prix total
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icône retour avec fond blanc
              GestureDetector(
                onTap: () {
                  // Action pour retourner à la page précédente
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
              // Texte au centre
              Text(
                "Product Details",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Icône panier avec fond vert
              Stack(
                children: [
                  GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage()),
    );
  },
  child: Container(
    decoration: BoxDecoration(
      color: Colors.green,
      shape: BoxShape.circle,
    ),
    padding: EdgeInsets.all(10),
    child: Icon(
      Icons.shopping_cart,
      color: Colors.white,
      size: 28,
    ),
  ),
),

                  // Badge jaune
                  if (_cartItems > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "$_cartItems", // Nombre d'articles
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Image principale
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        images[_currentIndex], // Affiche l'image sélectionnée
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Miniatures
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index; // Change l'image affichée
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _currentIndex == index
                                    ? Colors.green
                                    : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              images[index],
                              height: 40, // Réduction de la hauteur
                              width: 40,  // Réduction de la largeur
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Indicateur de défilement
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.green
                                : Colors.grey[300],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Section des détails du produit
              // Ligne de Recommended, Fruit et cœur
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "Recommended",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(width: 8),
                          
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                            "Fruit",
                            style: TextStyle(color: Colors.white),
                          ),
                          ),
                          
                        ],
                      ),
                      // Icône de cœur
                      IconButton(
                        onPressed: () {
                          // Action pour ajouter aux favoris
                        },
                        icon: Icon(
                          Icons.favorite_border, // Icône cœur non rempli
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fresh Banana",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "250G",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  // Section étoiles et avis
    Row(
      children: [
        Row(
          children: List.generate(
            5, // Génère 5 étoiles
            (index) => Icon(
              Icons.star,
              color: Colors.orange,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "5k Reviews",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    ),
    
                  const SizedBox(height: 16),
                  Text(
                    "Bananas are a popular tropical fruit rich in vitamins, particularly Vitamin B6 and Vitamin C. They are known for their high potassium content, which promotes heart health and muscle function.",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  
                  const SizedBox(height: 16),
                ],
              ),
              // Section pour ajouter au panier
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${totalPrice.toStringAsFixed(2)}", // Affichage du prix total
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
    // Sélection de la quantité
    Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _decrementQuantity,
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          "$_quantity",
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          onPressed: _incrementQuantity,
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
const SizedBox(height: 16),
SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Add items to Cart",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
