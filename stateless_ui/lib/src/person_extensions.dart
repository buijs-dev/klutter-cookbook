// Copyright (c) 2021 - 2023 Buijs Software
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'package:squint_json/squint_json.dart';
import 'person_dataclass.dart';
import 'planet_dataclass.dart';
import 'planet_extensions.dart';
import 'pizza_dataclass.dart';
import 'pizza_extensions.dart';

/// Autogenerated JSON (de)serialization methods by Squint.
extension PersonJsonBuilder on Person {
  JsonObject get toJsonObject => JsonObject.fromNodes(nodes: [
        JsonString(key: "name", data: name),
        JsonIntegerNumber(key: "age", data: age),
        JsonObject.fromTypedMap<Pizza>(
            keyToString: (Pizza entry) => entry.name,
            key: "favoritePizzas",
            data: favoritePizzas),
        JsonArrayOrNull<dynamic>(key: "friends", data: friends),
        JsonBooleanOrNull(key: "isHuman", data: isHuman),
        encodePlanet(bornOnPlanet),
      ]);

  String get toJson => toJsonObject.stringify;
}

extension PersonJsonString2Class on String {
  Person get toPerson => jsonDecode.toPerson;
}

extension PersonJsonObject2Class on JsonObject {
  Person get toPerson => Person(
        name: string("name"),
        age: integer("age"),
        bornOnPlanet: decodePlanet(stringNode("bornOnPlanet")),
        favoritePizzas: typedObject<Pizza, double>(
            key: "favoritePizzas",
            toTypedKey: (String entry) => Pizza.values.firstWhere(
                (value) => value == entry,
                orElse: () => Pizza.NONE)),
        friends: arrayOrNull<Person>("friends",
            decoder: (dynamic value) =>
                JsonObject.fromMap(data: value as Map<String, dynamic>)
                    .toPerson),
        isHuman: booleanOrNull("isHuman"),
      );
}