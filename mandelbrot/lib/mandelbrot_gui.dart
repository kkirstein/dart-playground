library mandelbrot_gui;

import 'package:angular/angular.dart';
import 'dart:html';

import 'mandelbrot.dart';
import 'rgb.dart';

@Controller(
    selector: '[mandelbrot-gui]',
    publishAs: 'ctrl')
class MandelbrotGuiController {

  // public properties
  String width;
  String height;
  String xCenter;
  String yCenter;
  String pixelSize;
  
  // private properties
  ImageData _img;
  CanvasRenderingContext2D _context;
  
  int _width;
  int _height;
  double _xCenter;
  double _yCenter;
  double _pixelSize;

  
  // constructor
  MandelbrotGuiController() {
    _defaultData();
    //_setupCanvas();
    validateParams();
  }
  
  /**
   * generates an updated Mandelbrot set
   */
  void updateSet() {
    
    List<RGB> imgRgb = mandelbrotRgb(_width, _height, _xCenter, _yCenter, _pixelSize);
    // convert to ImageData:
    //List<int> pixData = new List(4*width*height);
    ImageData img = _getImageData();
    List<int> pixData = img.data;
    var counter = 0;
    for (RGB pix in imgRgb) {
      pixData[counter] = pix.r;
      pixData[counter+1] = pix.g;
      pixData[counter+2] = pix.b;
      counter += 4;
    }
    //_img.data = pixData;
    _setImageData(img);
    //_context.putImageData(_img, _width, _height);
  }
  
  /**
   * checks whether input parameters are valid
   */
  void validateParams() {

    _width = int.parse(width);
    _height = int.parse(height);
    _xCenter = double.parse(xCenter);
    _yCenter = double.parse(yCenter);
    _pixelSize = double.parse(pixelSize);
  }
  
  // private methods
  void _defaultData() {
    this.width = "640";
    this.height = "480";
    this.xCenter = "0.0";
    this.yCenter = "0.9";
    this.pixelSize = "4.0";
  }
  
  void _setupCanvas() {
    CanvasElement canvas = document.querySelector("#mandelbrot-image");
    _context = canvas.context2D;
    _img = _context.getImageData(0, 0, canvas.width, canvas.height);
  }
  
  void _setImageData(ImageData img) {
    CanvasElement canvas = document.querySelector("#mandelbrot-image");
    CanvasRenderingContext2D context = canvas.context2D;
    context.putImageData(img, 0, 0);
  }

  ImageData _getImageData() {
    CanvasElement canvas = document.querySelector("#mandelbrot-image");
    CanvasRenderingContext2D context = canvas.context2D;
    return context.getImageData(0, 0, canvas.width, canvas.height);
  }
}
