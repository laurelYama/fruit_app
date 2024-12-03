import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartScreen(),
    );
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Exemple de données de panier
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Fresh Banana",
      "category": "Fruit",
      "weight": "250 G",
      "price": 4.00,
      "quantity": 2,
      "image": "images/banane.png" 
    },
    {
      "name": "Red Apples",
      "category": "Fruit",
      "weight": "250 G",
      "price": 6.00,
      "quantity": 1,
      "image": "images/pomme.png"
    },
    {
      "name": "Avocado",
      "category": "Fruit",
      "weight": "250 G",
      "price": 9.00,
      "quantity": 1,
      "image": "images/avocado.png"
    },
    {
      "name": "Carrots",
      "category": "Vegetables",
      "weight": "250 G",
      "price": 5.00,
      "quantity": 1,
      "image": "images/carrots.png"
    },
  ];

  double get subtotal =>
      cartItems.fold(0, (total, item) => total + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf3f5f7),
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white, // Fond blanc pour l'icône
            shape: BoxShape.circle, // Cercle
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              // Action pour revenir en arrière
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.white),
              onPressed: () {
                // Action pour les options
              },
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFf3f5f7),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  title: Text(item['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${item['category']}"),
                      Text("${item['weight']}"),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (item['quantity'] > 1) {
                                  item['quantity']--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove, size: 16),
                          ),
                          Text("${item['quantity']}"),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                item['quantity']++;
                              });
                            },
                            icon: Icon(Icons.add, size: 16),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cartItems.removeAt(index); // Supprimer l'élément
                              });
                            },
                            icon: Icon(Icons.delete, size: 16, color: Colors.red),
                          ),
                        ],
                      ),
                      // Affichage du prix total
                      
                       Expanded(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Text(
      "\$${(item['price'] * item['quantity']).toStringAsFixed(2)}",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 7,  // Taille du texte agrandie
        letterSpacing: 1.5,  // Espacement des lettres
      ),
      overflow: TextOverflow.ellipsis,  // Gérer le débordement si nécessaire
    ),
  ),
)



                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text("\$${subtotal.toStringAsFixed(2)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Fee"),
                    Text("Free"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount"),
                    Text("-\$4.00"),
                  ],
                ),
                Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24, // Taille du texte augmentée
                      ),
                    ),
                    Text(
                      "\$${(subtotal - 4).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24, // Taille du texte augmentée
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    // Action pour "Promo Code"
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.green,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Promo Code",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Action pour "Checkout"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Checkout For \$${(subtotal - 4).toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
