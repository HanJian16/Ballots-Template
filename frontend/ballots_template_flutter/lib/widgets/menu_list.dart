import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.list,
  });

  final List<Map<String, dynamic>> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        String title = item['title'] ?? '';
        String subtitle = item['subtitle'] ?? '';
        return ListTile(
          onTap: item['onTap'],
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(width: 1, color: AppColors.greyColor),
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
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
    );
  }
}
