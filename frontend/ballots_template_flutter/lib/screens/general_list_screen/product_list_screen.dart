import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:google_fonts/google_fonts.dart';

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
    setState(() {
      products = productsDB;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Lista de Productos',
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
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        var item = products[index];
                        var productName = item.productName;
                        var productValue = item.productValue;
                        var id = item.id;
                        // Aquí puedes personalizar cómo mostrar cada producto
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(
                                () => DetailScreen(
                                  id: id,
                                ),
                              );
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

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Product? _product;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final product = await getProductById(widget.id);
    setState(() {
      _product = product; // Asignas el producto a la variable de estado
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ScreenContainer(
      title: 'Detalles',
      children: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              if (_product != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        enabled: false,
                        // controller: field['controller'],
                        decoration: InputDecoration(
                            hintText: _product?.productName, counterText: ''),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        enabled: false,
                        // controller: field['controller'],
                        decoration: InputDecoration(
                            hintText: _product?.productDescription,
                            counterText: ''),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        enabled: false,
                        // controller: field['controller'],
                        decoration: InputDecoration(
                            hintText: '${_product?.productValue}',
                            counterText: ''),
                      ),
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomBtn(
                      customColor: Colors.red,
                      text: 'Borrar',
                      onPressed: () {
                        Get.defaultDialog(
                          title: '',
                          titleStyle: GoogleFonts.onest(
                            fontSize: 1,
                          ),
                          content: WarningDialog(
                            title: '¿Quieres borrar este producto?',
                            titleBtn: "Borrar",
                            actionsBtn: Row(
                              children: [
                                Expanded(
                                  child: CustomBtn(
                                    customColor: Colors.red,
                                    status: 1,
                                    text: 'Cancelar',
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomBtn(
                                    status: 1,
                                    text: 'Borrar',
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                            onPress: () {
                              Get.back();
                              // deleteProduct(_product?.id);
                            },
                          ),
                        );
                      },
                      status: 1,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: CustomBtn(
                      text: 'Editar',
                      status: 1,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
