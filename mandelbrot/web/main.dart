library mandelbrot_gui;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:mandelbrot_gui/mandelbrot_gui.dart';

class MandelbrotModule extends Module {
  // constructor
  MandelbrotModule() {
    bind(MandelbrotGuiController);
  }
}

void main() {
  applicationFactory()
    .addModule(new MandelbrotModule())
    .run();
}
