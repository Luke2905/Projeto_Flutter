import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projetinho_firebas/firebase_options.dart';
import 'package:projetinho_firebas/inserir.dart';
import 'package:projetinho_firebas/menu.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,); /*Inicializando o firebase*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'King Agendamentos',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Agendamentos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Stream<QuerySnapshot> usersStream = 
        FirebaseFirestore.instance.collection("Agenda").snapshots(); /*objeto para gerar a conexão com o banco Firebase dentro do usersStream */

  TimeOfDay _time = TimeOfDay.now();
    TimeOfDay picked;
    
    Future<Null> selectTime(BuildContext context) async {
      picked = await showTimePicker(
        context: context,
        initialTime: _time,
      );
      setState(() {
        _time = picked;
    
        print(picked);
      });
    }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
      drawer: Menu(),
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: usersStream, /*variavel em que esta o banco */
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot ) /*gerar um contexto para puxar as informações */
      {
        if(snapshot.hasError){
          return Center(
            child: Text('Algo deu Errado'),
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return  Container(
              color: Colors.yellow[600],
            child:  Card(

        return ListView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 80,
                icon: Icon(
                  Icons.alarm,
                  size: 80,
                ),
                onPressed: () {
                  selectTime(context);
                },
              ),
              SizedBox(
                height: 60,
              ),
              Text('$_time', style: TextStyle(fontSize: 40)),
            ],
          ), 
      ); 
    }
  }

       child: ListTile(
              title: Text(data['nome'].toString()),
              subtitle: Text(data['data'].toString()),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                print(data['nome']);
              },
            ),),
            ); 
          }).toList(),  
        ); 
      } 
      
      ), 
    );
  }
}

