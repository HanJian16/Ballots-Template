import 'package:ballots_template_flutter/db/CRUD/get.dart';
import 'package:ballots_template_flutter/models/product_model.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getDataDB();
  }

  getDataDB() async {
    final productsDB = await getProducts();
    setState(() {
      products = productsDB;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Buscar producto',
      children: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Buscar producto',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_scanner),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: Get.height * 0.65,
              child: products.isEmpty
                  ? const Center(child: Text('No hay productos'))
                  : ListView.separated(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        var item = products[index];
                        var productName = item.productName;
                        var productValue = item.productValue;
                        // Aquí puedes personalizar cómo mostrar cada producto
                        return Card(
                          color: AppColors.cardColorSecondary,
                          elevation: 10,
                          child: ListTile(
                            onTap: () {
                              // Get.dialog(Dialog(
                              //   child: Text(productName),
                              // ));
                            },
                            title: Text(productName),
                            subtitle: Text('Valor: ${productValue.toString()}'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 12);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
