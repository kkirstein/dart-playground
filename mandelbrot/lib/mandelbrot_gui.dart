library mandelbrot_gui_controller;

import 'package:angular/angular.dart';
import 'dart:html';

import 'mandelbrot.dart';
import 'rgb.dart';

@Controller(
    selector: '[mandelbrot-gui]',
    publishAs: 'ctrl')
class MandelbrotGuiController {

  // public properties
  int width;
  int height;
  double xCenter;
  double yCenter;
  double pixelSize;
  
  // private properties
  ImageData _img;
  CanvasRenderingContext2D _context;

  
  // constructor
  MandelbrotGuiController() {
    _defaultData();
  }
  
  /**
   * generates an updated Mandelbrot set
   */
  void updateSet() {
    
    List<RGB> imgRgb = mandelbrotRgb(width, height, xCenter, yCenter, pixelSize);
    // convert to ImageData:
    //List<int> pixData = new List(4*width*height);
    List<int> pixData = _img.data;
    var counter = 0;
    for (RGB pix in imgRgb) {
      pixData[counter] = pix.r;
      pixData[counter+1] = pix.g;
      pixData[counter+2] = pix.b;
      counter += 4;
    }
    //_img.data = pixData;
    _context.putImageData(_img, width, height);
  }
  
  
  // private methods
  void _defaultData() {
    this.width = 640;
    this.height = 480;
    this.xCenter = 0.0;
    this.yCenter = 0.9;
    this.pixelSize = 4.0;
  }
  
  void _setupCanvas() {
    CanvasElement canvas = document.querySelector("#mandelbrot-image");
    _context = canvas.context2D;
  }
}
