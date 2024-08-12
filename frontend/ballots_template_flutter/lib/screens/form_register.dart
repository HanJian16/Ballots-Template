import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/widgets/screenContainer.dart';

class FormRegisterScreen extends StatelessWidget {
  const FormRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            Text("Form Register"),
          ],
        ),
      ),
    );
  }
}
