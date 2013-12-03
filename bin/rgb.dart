// rgb.dart
// RGB class to hold pixel values
//
class RGB {
  int r, g, b;
  
  RGB(this.r, this.g, this.b);
  RGB.fromIntList(List<int> rgb) : r = rgb[0], g = rgb[1], b = rgb[2];
  RGB.fromStringList(List<String> rgb) :
    r = int.parse(rgb[0]),
    g = int.parse(rgb[1]),
    b = int.parse(rgb[2]);
  
  factory RGB.fromString(String rgb) {
    return new RGB.fromStringList(rgb.split(new RegExp(r'[ ,]')));
  }
  
  String toString([String sep]) {
    if (sep == null) return "${r.toString()} ${g.toString()} ${b.toString()}";
    return [r.toString(), g.toString(), b.toString()].join(sep);
  }
}
