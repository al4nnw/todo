import "package:flutter/material.dart";

/// Most important
LinearGradient p0 = _makeGradient([
  const Color.fromRGBO(22, 25, 35, 0.95),
  const Color.fromRGBO(22, 25, 35, 0.6),
]);

LinearGradient p1 = _makeGradient([
  const Color.fromRGBO(35, 57, 91, 0.95),
  const Color.fromRGBO(35, 57, 91, 0.6),
]);

LinearGradient p2 = _makeGradient([
  const Color.fromRGBO(64, 110, 142, 0.95),
  const Color.fromRGBO(64, 110, 142, 0.6),
]);

LinearGradient p3 = _makeGradient([
  const Color.fromRGBO(142, 168, 195, 0.95),
  const Color.fromRGBO(142, 168, 195, 0.6),
]);

LinearGradient free = _makeGradient([
  const Color.fromARGB(241, 122, 241, 213),
  const Color.fromRGBO(122, 241, 213, 0.6),
]);

LinearGradient _makeGradient(List<Color> colors) {
  return LinearGradient(
    colors: colors,
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
