library mandelbrot_gui_controller;

import 'package:angular/angular.dart';
import 'dart:html';

@Controller(
    selector: '[mandelbrot-gui]',
    publishAs: 'ctrl')
class MandelbrotGuiController {

  ImageData img;
  
  int width;
  int height;
  double xCenter;
  double yCenter;
  double pixelSize;
  
  // constructor
  MandelbrotGuiController() {
    _defaultData();
  }
  
  void _defaultData() {
    this.width = 640;
    this.height = 480;
    this.xCenter = 0.0;
    this.yCenter = 0.9;
    this.pixelSize = 4.0;
  }
}
