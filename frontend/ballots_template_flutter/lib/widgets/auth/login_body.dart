import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/auth/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool crearCuenta = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: Get.width * 0.8,
          height: Get.height * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: !crearCuenta
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  !crearCuenta
                      ? const Text('')
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              crearCuenta = false;
                            });
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                  Text(
                    !crearCuenta ? 'Inicio de Sesión' : 'Crear cuenta',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(placeHolder: 'Nombre de la tienda'),
              const SizedBox(height: 20),
              const CustomTextFormField(placeHolder: 'Contraseña'),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.offNamed(AppRoutes.home);
                },
                child: const Text('Iniciar sesión'),
              ),
              const SizedBox(height: 20),
              !crearCuenta
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          crearCuenta = true;
                        });
                      },
                      child: const Text(
                        'Crear cuenta',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    )
                  : const Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
