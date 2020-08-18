import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nome completo',
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'E-mail'
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Senha'
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Confirmação de senha'
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  onPressed: () {},
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
    );
  }
}
