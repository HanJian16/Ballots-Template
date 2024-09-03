import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final String category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  List<Service> services = [];

  @override
  void initState() {
    super.initState();
    getDataDB();
  }

  getDataDB() async {
    if (widget.category == 'Servicios') {
      final servicesDB = await getServices();
      setState(() {
        services = servicesDB;
      });
    } else {
      final productsDB = await getProducts();
      setState(() {
        products = productsDB;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final listItems = widget.category == 'Servicios' ? services : products;
    return ScreenContainer(
      title: widget.category == 'Servicios'
          ? 'Lista de servicios'
          : 'Lista de productos',
      floatingActionButton: AddItemBtn(
        onPress: () {},
      ),
      children: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: widget.category == 'Servicios'
                      ? 'Buscar servicio'
                      : 'Buscar producto',
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
              child: listItems.isEmpty
                  ? Center(
                      child: Text(widget.category == 'Servicios'
                          ? 'No hay servicios'
                          : 'No hay productos'),
                    )
                  : ListView.separated(
                      itemCount: listItems.length,
                      itemBuilder: (context, index) {
                        if (widget.category == 'Servicios') {
                          var item = services[index];
                          var serviceDescription = item.description;
                          var serviceValue = item.value;
                          var id = item.id;
                          return ItemCard(
                            category: widget.category,
                            id: id,
                            title: serviceDescription,
                            subtitle: serviceValue.toString(),
                            onPress: () {
                              print('Service121221');
                            },
                          );
                        } else {
                          var item = products[index];
                          var productName = item.productName;
                          var productValue = item.productValue;
                          var id = item.id;
                          return ItemCard(
                            id: id,
                            title: productName,
                            subtitle: productValue.toString(),
                            category: widget.category,
                            onPress: () {
                              print('Product12121');
                            },
                          );
                        }
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
    required this.category,
    this.onPress,
  });
  final int id;
  final String category;
  final VoidCallback? onPress;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Product? _product;
  Service? _service;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    if (widget.category == 'Servicios') {
      final serviceDb = await getServiceById(widget.id);
      setState(() {
        _service = serviceDb;
      });
    } else {
      final productDb = await getProductById(widget.id);
      setState(() {
        _product = productDb;
      });
    }
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
              if (_product != null || _service != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: DetailFields(
                    category: widget.category,
                    product: _product,
                    service: _service,
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
                        WarningDialogHelper.show(
                          message: '¿Quieres borrar este producto?',
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
                                  onPressed: () {
                                    if (widget.onPress != null) {
                                      widget.onPress!();
                                    } else {
                                      print('hola toy vacio muiajajaj');
                                    }
                                  },
                                ),
                              )
                            ],
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
