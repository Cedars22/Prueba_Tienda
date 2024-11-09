import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tienda/providers/products_provider.dart';

class HomeProductsPage extends ConsumerWidget {
  const HomeProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final productsAsyncValue = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          textAlign: TextAlign.center,
          'Clothing Store',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(125, 83, 233, 1),
      ),
      body: productsAsyncValue.when(
        data: (products) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.3,
                            child: FadeInImage(
                              fit: BoxFit.contain,
                              placeholder:
                                  const AssetImage('assets/no-image.png'),
                              image: NetworkImage(products[index].image),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                products[index].description,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10.0),
                              Text(products[index].category),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    products[index].rating.rate.toString(),
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Text(
                                    '\$${products[index].price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          const Center(child: Text('Error al cargar los productos productos'));
          return null;
        },
      ),
    );
  }
}
