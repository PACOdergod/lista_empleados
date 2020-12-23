import 'dart:async';

import 'package:empleados_app/empleado.dart';

class EmpleadoBloc {
  List<Empleado> _empleados = [
    Empleado(1, 'empleado 1', 100.0),
    Empleado(2, 'empleado 2', 200.0),
    Empleado(3, 'empleado 3', 300.0),
    Empleado(4, 'empleado 4', 400.0),
    Empleado(5, 'empleado 5', 500.0),
  ];

  //Streams controllers
  final _empleadoListaStream = StreamController<List<Empleado>>();

  final _empleadoSalarioIncrement = StreamController<Empleado>();
  final _empleadoSalarioDecrement = StreamController<Empleado>();

  //Getters: streams y sinks
  Stream<List<Empleado>> get empleadosListaStream =>
      _empleadoListaStream.stream;
  StreamSink<List<Empleado>> get empleadosListaSink =>
      _empleadoListaStream.sink;

  StreamSink<Empleado> get empleadoSalararioIncrement =>
      _empleadoSalarioIncrement.sink;

  StreamSink<Empleado> get empleadoSalararioDecrement =>
      _empleadoSalarioDecrement.sink;

  //Contructor
  EmpleadoBloc() {
    _empleadoListaStream.add(_empleados);
    _empleadoSalarioIncrement.stream.listen(_incrementSalario);
    _empleadoSalarioDecrement.stream.listen(_decrementSalario);
  }

  //Funciones principales
  _incrementSalario(Empleado empleado) {
    double salarioActual = empleado.salario;
    double incremento = 10.0;

    _empleados[empleado.id - 1].salarios = salarioActual + incremento;
    empleadosListaSink.add(_empleados);
  }

  _decrementSalario(Empleado empleado) {
    double salarioActual = empleado.salario;
    double incremento = 10.0;

    _empleados[empleado.id - 1].salarios = salarioActual - incremento;
    empleadosListaSink.add(_empleados);
  }

  void dispose() {
    _empleadoListaStream.close();
    _empleadoSalarioDecrement.close();
    _empleadoSalarioIncrement.close();
  }
}
