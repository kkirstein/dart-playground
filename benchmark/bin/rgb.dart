// rgb.dart
// RGB class(es) to hold pixel values
//

/**
 * RGB holds red, green, blue pixel values
 */
class RGB {
  int r, g, b;

  RGB(this.r, this.g, this.b);
  RGB.fromIntList(List<int> rgb)
      : r = rgb[0],
        g = rgb[1],
        b = rgb[2];
  RGB.fromStringList(List<String> rgb)
      : r = int.parse(rgb[0]),
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

/**
 * RGBA holds red, green, blue & alpha channel values for a single pixel
 */
class RGBA {
  int r, g, b, a;

  RGBA(this.r, this.g, this.b, this.a);
  RGBA.fromIntList(List<int> rgba)
      : r = rgba[0],
        g = rgba[1],
        b = rgba[2],
        a = rgba[3];
  RGBA.fromStringList(List<String> rgba)
      : r = int.parse(rgba[0]),
        g = int.parse(rgba[1]),
        b = int.parse(rgba[2]),
        a = int.parse(rgba[3]);

  String toString([String sep]) {
    if (sep ==
        null) return "${r.toString()} ${g.toString()} ${b.toString()} ${a.toString()}";
    return [r.toString(), g.toString(), b.toString(), a.toString()].join(sep);
  }
}
