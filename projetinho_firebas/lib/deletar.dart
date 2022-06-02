import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projetinho_firebas/firebase_options.dart';
import 'package:projetinho_firebas/main.dart';
import 'package:projetinho_firebas/menu.dart';


class Deletar extends StatelessWidget {
  const Deletar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Deletar',
      home: DelData(),
    );
  }
}
  
class DelData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Deletar Dados"),
      ),   
body: SingleChildScrollView( 
        child: SizedBox(
          width: MediaQuery.of(context).size.width, 
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
 

        FloatingActionButton(
          backgroundColor: Colors.purple[800],
          child: Icon(Icons.delete),
          onPressed: () {
                       FirebaseFirestore.instance.collection('Agenda').get().then((snapshot) {
                for (DocumentSnapshot ds in snapshot.docs){
    ds.reference.delete();
             }
          });
          }
        ),
        ],
        ),
        ),
        ),
      ),
    );
  }
}