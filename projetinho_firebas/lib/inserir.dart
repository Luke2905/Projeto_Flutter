import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projetinho_firebas/firebase_options.dart';
import 'package:projetinho_firebas/main.dart';
import 'package:projetinho_firebas/menu.dart';


class Inserir extends StatelessWidget {
  const Inserir({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Inserir',
      home: AddData(),
    );
  }
}
  
class AddData extends StatelessWidget {

  String nome='';
  String telefone='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Inserir Dados"),
      ),   
body: SingleChildScrollView( 
        child: SizedBox(
          width: MediaQuery.of(context).size.width, 
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
 
                TextField(  
                  onChanged: (text){ 
                   nome = text;
                  },
                  keyboardType: TextInputType.text, 
                  decoration: InputDecoration(
                    labelText: 'nome',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 10,),

                TextField(
                  onChanged: (text){ 
                   telefone = text;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'telefone',
                    border: OutlineInputBorder(),
                  ),
                ),

                 const SizedBox(height: 10.0),

        FloatingActionButton(
          backgroundColor: Colors.purple[800],
          child: Icon(Icons.add),
          onPressed: () {
            if(nome.isEmpty
                  || telefone.isEmpty){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MyApp()));
                      }else{
                         FirebaseFirestore.instance.collection('Etec').add({'nome': nome,'telefone': telefone});
                      }
          },
        ),
        ],
        ),
        ),
        ),
      ),
    );
  }
}