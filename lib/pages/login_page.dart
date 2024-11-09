import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tienda/providers/obscure_text_provider.dart';
import 'package:prueba_tienda/providers/remember_me_provider.dart';
import 'package:prueba_tienda/widgets/primary_button.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final formKeyLogin = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rememberMe = ref.watch(rememberMeProvider);
    final obscureText = ref.watch(obscureTextProvider);

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'assets/store_icon.png',
            // fit: BoxFit.contain,
            height: screenSize.height * .4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: const Color.fromRGBO(125, 83, 233, 1),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Form(
                  key: formKeyLogin,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Usuario',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        controller: usuarioController,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Constraseña',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              ref.read(obscureTextProvider.notifier).toggle();
                            },
                          ),
                        ),
                        obscureText: obscureText,
                        controller: contrasenaController,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(color: Colors.white),
                              value: rememberMe,
                              onChanged: (value) {
                                ref
                                    .read(rememberMeProvider.notifier)
                                    .setRememberMe(value!);
                              }),
                          const Text(
                            'Recuerdame',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(height: 28),
                      PrimaryButton(
                          onClick: () {
                            Navigator.pushNamed(context, 'home_products');
                          },
                          label: 'Iniciar Sesión'),
                      const SizedBox(height: 40),
                      const Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
