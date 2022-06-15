import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projetinho_firebas/firebase_options.dart';
import 'package:projetinho_firebas/inserir.dart';
import 'package:projetinho_firebas/deletar.dart';
import 'package:projetinho_firebas/main.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 57, 24, 83),
        child: ListView(
          children: <Widget>[
            cabecalho(
              nome: "King Agendamentos",
              email: "k.agenda@gmail.com",
              imagem:
                  "https://dm2305files.storage.live.com/y4m7cTd9D3axWgzhwTsTyx9GcENKP2XFmxNd9rmyqR8wYk5nsgrSZSABYgV9OO4rA0IKhbjl7H60GsHM-hBUIbZQNK01sqr873ktoYmhpqYC39ZsLXcfFtH5LhvXSnPkNXC7MXAZIcZ2zDrlt8v2RGSPAPL0jCl_PkJ2Kjt0DwQWFoNc4oHD14_c9dm1XqyUGmW?width=500&height=500&cropmode=none",
            ),
            const SizedBox(
              height: 15,
            ),
            menuItem(
              nome: "Agendamentos",
              icone: Icons.calendar_month,
              tocar: () => selecaoItem(context, 1),
            ),
            menuItem(
              nome: "Inserir",
              icone: Icons.add,
              tocar: () => selecaoItem(context, 0),
            ),
            menuItem(
              nome: "Deletar",
              icone: Icons.delete,
              tocar: () => selecaoItem(context, 2),
            ),
          ],
        ),
      ),
    );
  }
}

menuItem({required String nome, required IconData icone, VoidCallback? tocar}) {
  return ListTile(
    leading: Icon(icone, color: Colors.black),
    title: Text(
      nome,
      style: TextStyle(color: Colors.black),
    ),
    hoverColor: Colors.white38,
    onTap: tocar,
  );
}

cabecalho(
        {required String nome,
        required String email,
        required String imagem}) =>
    InkWell(
        child: Row(
      // ignore: duplicate_ignore
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imagem),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              nome,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ],
        ),
      ],
    ));

selecaoItem(BuildContext context, int i) {
  Navigator.of(context).pop();

  switch (i) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Inserir()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyApp()));
      break;
    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Deletar()));
      break;
  }
}
