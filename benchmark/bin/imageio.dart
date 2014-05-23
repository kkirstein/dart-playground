// imageio.dart
// defines IO operations for images
// works only on DartVM, not in browser-based apps
//
library imageio;

import 'dart:async';
import 'dart:convert';
//import 'dart:html' show ImageData;
import 'dart:io';

import 'rgb.dart';


// write mandelbrot set to file
Future writeImagePGM(String fileName, List<RGB> rgbData, int xSize, int ySize, int colorMax) {
  
  var outFile = new File(fileName);
  var outStream = outFile.openWrite(mode: FileMode.WRITE, encoding: ASCII);
  
  // write header
  outStream.writeln("P3");
  outStream.writeln(xSize);
  outStream.writeln(ySize);
  outStream.writeln(colorMax);
  
  // loop over pixel
//  for (var i=0; i<xSize*ySize; i++) {
//    outStream.writeln(rgbData[i].toString());
//  }
  rgbData.forEach((pix) { outStream.writeln(pix.toString()); });
  
  return outStream.close();
}

/*
Future writeImageDataPGM(String fileName, ImageData img) {

  var outFile = new File(fileName);
  var outStream = outFile.openWrite(mode: FileMode.WRITE, encoding: ASCII);

  // TODO
  
  return outStream.close();  
}
 */

void writeImagePGMSync(String fileName, List<RGB> rgbData, int xSize, int ySize, int colorMax) {
  
  var outFile = new File(fileName);
//  var outStream = outFile.openWrite(mode: FileMode.WRITE, encoding: ASCII);
  
  // write header
  outFile.writeAsStringSync("P3");
  outFile.writeAsStringSync(xSize.toString());
  outFile.writeAsStringSync(ySize.toString());
  outFile.writeAsStringSync(colorMax.toString());
  
  // loop over pixel
  rgbData.forEach((pix) { outFile.writeAsStringSync(pix.toString()); });
  
//  return outFile.close();
}