library mandelbrot_gui;

import 'package:angular/angular.dart';
import 'package:mandelbrot_gui/mandelbrot_gui.dart';

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(targets: const ['mandelbrot_gui_controller'], override: '*')
import 'dart:mirrors';

class MandelbrotModule extends Module {
  // constructor
  MandelbrotModule() {
    type(MandelbrotGuiController);
  }
}

void main() {
  ngBootstrap(module: new MandelbrotModule());
}
