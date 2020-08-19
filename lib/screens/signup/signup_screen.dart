import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';

class SignUpScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final User user = User();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nome completo',
                  ),
                  validator: (value) {
                    if (value.trim().isEmpty) return 'Campo obrigatório';

                    return null;
                  },
                  onSaved: (value) => user.name = value,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'E-mail'
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) return 'Campo obrigatório';
                    if (!emailValid(value)) return 'E-mail inválido';

                    return null;
                  },
                  onSaved: (value) => user.email = value,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Senha'
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) return 'Campo obrigatório';

                    if (value.length < 6) {
                      return 'Senha deve ter pelo menos 6 caracteres';
                    }

                    return null;
                  },
                  onSaved: (value) => user.password = value,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Confirmação de senha'
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) return 'Campo obrigatório';

                    if (value.length < 6) {
                      return 'Senha deve ter pelo menos 6 caracteres';
                    }

                    return null;
                  },
                  onSaved: (value) => user.confirmPassword = value,
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (!user.isConfirmedPassword()) {
                          scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: const Text('Senhas não coincidem'),
                              )
                          );
                          return;
                        }

                        // usermanager
                      }
                    },
                    color: primaryColor,
                    disabledColor: primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    child: const Text('Criar conta',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
