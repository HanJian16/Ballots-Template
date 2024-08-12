import 'package:ballots_template_flutter/widgets/backup_row.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/widgets/screenContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class FormRegisterScreen extends StatelessWidget {
  const FormRegisterScreen({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.12, // Ajusta la altura según tus necesidades
          color: Colors.white,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ajustes',
                  style: GoogleFonts.onest(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.cloud_upload_sharp,
                        color: Colors.black,
                        size: 25,
                      ),
                      onPressed: () => _showBottomSheet(context),
                    ),
                  ),
                ),
              ],
            ),
            // Agrega más widgets aquí
          ],
        ),
      ),
    );
  }
}
