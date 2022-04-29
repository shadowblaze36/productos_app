import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:productos_app/widgets/card_container.dart';
import 'package:productos_app/widgets/widgets.dart';

import '../ui/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 180,
          ),
          CardContainer(
            child: Column(children: const [SizedBox(height: 10), _LoginForm()]),
          ),
          const SizedBox(height: 50),
          const Text(
            '¿Tiene problemas para ingresar?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 180),
        ]),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //TODO: Mantener la referencia al key
        //key: ,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'nombre.apellido',
                  labelText: 'Usuario',
                  prefixIcon: Icons.person_outline),
              validator: (value) {
                String pattern = '[a-zA-Z]+\.[a-zA-Z]+';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Usuario no valido';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '******',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              validator: (value) {
                if (value != null && value.length >= 4) return null;
                return 'La contraseña debe tener almenos 4 caracteres';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromRGBO(133, 46, 44, 1),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  //TODO: Login
                }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
