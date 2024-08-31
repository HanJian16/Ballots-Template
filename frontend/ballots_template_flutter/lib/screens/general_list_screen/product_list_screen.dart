import 'package:ballots_template_flutter/db/CRUD/get.dart';
import 'package:ballots_template_flutter/models/product_model.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/add_item_btn.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getDataDB();
  }

  getDataDB() async {
    final productsDB = await getProducts();
    var dataConverted =
        productsDB.map((product) => Product.fromMap(product)).toList();
    setState(() {
      products = dataConverted;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
        appBarChildren: Text(
          'Lista de Productos',
          style: theme.headlineLarge?.copyWith(color: AppColors.whiteColor),
        ),
        floatingActionButton: AddItemBtn(
          onPress: () {},
        ),
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
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.height * 0.65,
                child: products.isEmpty
                    ? const Center(child: Text('No hay productos'))
                    : ListView.separated(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var item = products[index];
                          var productName = item.productName;
                          var productValue = item.productValue;
                          // Aquí puedes personalizar cómo mostrar cada producto
                          return Card(
                            color: AppColors.cardColorSecondary,
                            elevation: 5,
                            child: ListTile(
                              title: Text(productName),
                              subtitle: Text('Valor: ${productValue.toString()}'),
                              trailing:const  Icon(Icons.arrow_forward_ios),
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
        ));
  }
}
