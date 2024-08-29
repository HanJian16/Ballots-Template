import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'title': 'Recibo del producto',
        'subtitle': 'Crear recibo del producto',
        'icon': Icons.receipt_rounded,
        'onTap': () {
          print('Harry potter');
        }
      },
      {
        'title': 'Recibo del servicio',
        'subtitle': 'Crear recibo del servicio',
        'icon': Icons.receipt_outlined,
        'onTap': () {
          print('Harry potter2');
        }
      }
    ];
    final TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
      appBarChildren: const Text('Recibo'),
      children: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Crear recibos de productos o servicios',
              style: theme.titleLarge,
            ),
            Container(
              height: 200,
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index) {
                  final item = list[index];
                  String title = item['title'] ?? '';
                    String subtitle = item['subtitle'] ?? '';
                  return GestureDetector(
                    onTap: item['onTap'],
                    child:  ListTile(
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side:
                              BorderSide(width: 1, color: AppColors.greyColor),
                        ),
                        tileColor: AppColors.cardColorSecondary,
                        title: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          subtitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                        leading: Icon(item['icon']),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 12);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
