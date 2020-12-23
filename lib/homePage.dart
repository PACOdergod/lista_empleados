import 'package:empleados_app/empleado.dart';
import 'package:empleados_app/empleadoBloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmpleadoBloc _empleadoBloc = EmpleadoBloc();

  @override
  void dispose() {
    super.dispose();
    _empleadoBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Empleados')),
        body: Container(
          child: StreamBuilder(
            stream: _empleadoBloc.empleadosListaStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Empleado>> snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 5.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${snapshot.data[index].id}',
                              style: TextStyle(fontSize: 30.0),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data[index].nombre.toString(),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    snapshot.data[index].salario.toString(),
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: IconButton(
                                  icon: Icon(Icons.thumb_up),
                                  color: Colors.green,
                                  onPressed: () {
                                    _empleadoBloc.empleadoSalararioIncrement
                                        .add(snapshot.data[index]);
                                  }),
                            ),
                            Container(
                              child: IconButton(
                                  icon: Icon(Icons.thumb_down),
                                  color: Colors.red,
                                  onPressed: () {
                                    _empleadoBloc.empleadoSalararioDecrement
                                        .add(snapshot.data[index]);
                                  }),
                            )
                          ],
                        ));
                  });
            },
          ),
        ));
  }
}
