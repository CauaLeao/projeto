import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 225, 124),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
            //
            // ÍCONE
            //
            Icon(
                Icons.auto_stories,
                size: 90,
                color: const Color.fromARGB(255, 142, 96, 23),
              ),
              SizedBox(height: 25),
              Text(
                'BooKollection',
                textAlign: TextAlign.center,
                style: GoogleFonts.alfaSlabOne(
                  fontSize: 20,
                  color:  const Color.fromARGB(255, 64, 40, 2),
                ),
              ),
              SizedBox(height: 40,),
              
              //Textfield E-mail
              TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail: ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Textfield senha
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha: ',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {

                    },

                    //padding: const EdgeInsets.only(right: 15.0), // Ajuste o valor aqui (ex: 12.0, 16.0)
                    icon: Icon(Icons.visibility_off),
                  )
                ),
              ),
              SizedBox(height: 5),

              //Botão Esqueceu a senha
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  onPressed: () {

                    Navigator.pushNamed(
                      context, 
                      'recuperar_senha', 
                    );

                  },
                  child: Text('Esqueceu a senha?'),
                ),
              ),
              SizedBox(height: 100),

              //Botão entrar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 60), // Largura: 200, Altura: 50
                ),
                onPressed: () {}, 
                child: 
                Text(
                  'Entrar', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30,),


              // Botão Cadastre-se
              TextButton(
                onPressed: () {

                  Navigator.pushNamed(
                    context, 
                    'cadastro_usuario', 
                  );
                    
                },
                child: 
                Text(
                  'Ainda não tem conta? Cadastre-se',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ),


            ]
          ),
        ),
      ),
    );
  }
}
