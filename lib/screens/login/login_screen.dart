import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __) {
                return ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (value) => !emailValid(value)
                          ? 'E-mail inválido' : null,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: senhaController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (value) => (value.isEmpty || value.length < 6)
                          ? 'Senha inválida' : null,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {},
                        child: const Text(
                            'Esqueci minha senha'
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: userManager.loading ? null : () {
                          if (formKey.currentState.validate()) {
                            userManager.signIn(
                                user: User(
                                    emailController.text,
                                    senhaController.text
                                ),
                                onSuccess: () {
                                  // TODO: fechar tela de Login
                                },
                                onFail: (String error) => scaffoldKey
                                    .currentState
                                    .showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(error),
                                    )
                                )
                            );
                          }
                        },
                        color: primaryColor,
                        disabledColor: primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        child: userManager.loading
                          ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                          : const Text('Entrar',),
                      ),
                    ),
                  ],
                );
              },
            )
          ),
        ),
      ),
    );
  }
}
