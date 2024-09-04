import 'package:ballots_template_flutter/db/index.dart';
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
      child: Column(
        children: [
          BackupRow(
            text: "Realizar copia de seguridad",
            icon: Icons.cloud_upload,
            onTap: () async {
              try {
                await backupDb();
                NotificationHelper.show(
                  title: 'Copia de seguridad realizada',
                  message: 'Copia de seguridad realizada con éxito',
                  isError: false,
                );
              } catch (e) {
                NotificationHelper.show(
                  title: 'Error',
                  message: '$e',
                  isError: true,
                );
              }
            },
          ),
          BackupRow(
            text: "Restaurar copia de seguridad",
            icon: Icons.cloud_upload_outlined,
            onTap: () async {
              try {
                await restoreDb();
                NotificationHelper.show(
                  title: 'Restauración realizada',
                  message: 'Restauración realizada con éxito',
                  isError: false,
                );
              } catch (e) {
                NotificationHelper.show(
                  title: 'Error',
                  message: '$e',
                  isError: true,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
