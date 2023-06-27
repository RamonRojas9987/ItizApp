import 'package:flutter/material.dart';
import 'package:itizapp/components/custom_buttons.dart';
import 'package:itizapp/screens/home_screen/home_screen.dart';

import '../../constants.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // validar formulario
  final _formKey = GlobalKey<FormState>();

  //cambia el estado actual
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_itiz.png',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¡Bienvenido!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding / 6,
                ),
                Text('Ingresa para continuar',
                    style: Theme.of(context).textTheme.titleSmall)
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding * 3),
                topRight: Radius.circular(kDefaultPadding * 3),
              ),
              color: kOtherColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        sizedBox,
                        EmailField(),
                        sizedBox,
                        PasswordField(),
                        DefaultButton(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeScreen.routeName, (route) => false);
                            }
                          },
                          title: 'Iniciar Sesión',
                          iconData: Icons.arrow_forward_outlined,
                        ),
                        sizedBox,
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Olvidaste tu contraseña?',
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 15.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  TextFormField EmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: const InputDecoration(
        labelText: 'Correo Institucional',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Introduce tu Correo Institucional';
        } else if (!regExp.hasMatch(value)) {
          return 'Por favor introduce un Correo válido';
        }
      },
    );
  }

  TextFormField PasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
          labelText: 'Contraseña',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            icon: Icon(_passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined),
            iconSize: kDefaultPadding,
          )),
      validator: (value) {
        if (value!.length < 8) {
          return 'Debe de contener más de 8 caracteres';
        }
      },
    );
  }
}
