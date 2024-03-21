import 'package:flutter/material.dart';
import 'package:stateless_ui/stateless_ui.dart';

extension PersonDecorator on Person {
  Color get backgroundColor {
    switch (this.bornOnPlanet) {
      case Planet.EARTH:
        return Colors.white.withOpacity(0.1);
      case Planet.MARS:
        return Colors.white.withOpacity(0.2);
      case Planet.JUPITER:
        return Colors.white.withOpacity(0.3);
      case Planet.EGO:
        return Colors.white.withOpacity(0.4);
      case Planet.NONE:
        return Colors.white.withOpacity(0.5);
    }
  }

  Image get image {
    switch (this.bornOnPlanet) {
      case Planet.EARTH:
        return Image.asset('assets/symbol_earth.png',
            color: Colors.pinkAccent.withOpacity(0.7));
      case Planet.MARS:
        return Image.asset('assets/symbol_mars.png', color: Colors.pinkAccent);
      case Planet.JUPITER:
        return Image.asset('assets/symbol_jupiter.png',
            color: Colors.pinkAccent);
      case Planet.EGO:
        return Image.asset('assets/symbol_uranus.png',
            color: Colors.pinkAccent);
      case Planet.NONE:
        return Image.asset('assets/symbol_earth.png', color: Colors.pinkAccent);
    }
  }
}
