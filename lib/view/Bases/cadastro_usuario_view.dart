import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastroUsuarioView extends StatefulWidget {
  const CadastroUsuarioView({super.key});

  @override
  State<CadastroUsuarioView> createState() => _CadastroUsuarioViewState();
}

class _CadastroUsuarioViewState extends State<CadastroUsuarioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255,248, 225, 124),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              //
              // ICONE
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

              //TextField Nome Completo
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome completo: ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              //TextField Nome Usuario
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome usuário: ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              //TextField E-mail
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


            ]),
        ),
      ),
    );
  }
}
