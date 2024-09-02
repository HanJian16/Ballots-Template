import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class BackupOptions extends StatelessWidget {
  const BackupOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      color: AppColors.whiteColor,
      child: const Column(
        children: [
          BackupRow(
            text: "Realizar copia de seguridad",
            icon: Icons.cloud_upload,
          ),
          BackupRow(
            text: "Restaurar copia de seguridad",
            icon: Icons.cloud_upload_outlined,
          ),
        ],
      ),
    );
  }
}
