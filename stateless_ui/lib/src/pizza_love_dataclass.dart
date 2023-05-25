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
import 'pizza_dataclass.dart';
import 'pizza_extensions.dart';

/// Autogenerated data class by Squint.
@squint
class PizzaLove {
  const PizzaLove({
    required this.pizza,
    required this.love,
  });

  @JsonEncode(using: encodePizza)
  @JsonDecode<Pizza, JsonString>(using: decodePizza)
  @JsonValue("pizza")
  final Pizza pizza;

  @JsonValue("love")
  final double love;
}

JsonString encodePizza(Pizza object) {
  switch (object) {
    case Pizza.FOUR_CHEESE:
      return const JsonString(key: "pizza", data: "4 cheese");

    case Pizza.FIVE_CHEESE:
      return const JsonString(key: "pizza", data: "5 cheese");

    case Pizza.SIX_CHEESE:
      return const JsonString(key: "pizza", data: "6 cheese!?");

    case Pizza.IS_THERE_EVER_ENOUGH_CHEESE:
      return const JsonString(
          key: "pizza", data: "Is there ever enough cheese? No ;-)");

    default:
      return const JsonString(key: "pizza", data: "");
  }
}

Pizza decodePizza(JsonString value) {
  switch (value.data) {
    case "4 cheese":
      return Pizza.FOUR_CHEESE;

    case "5 cheese":
      return Pizza.FIVE_CHEESE;

    case "6 cheese!?":
      return Pizza.SIX_CHEESE;

    case "Is there ever enough cheese? No ;-)":
      return Pizza.IS_THERE_EVER_ENOUGH_CHEESE;

    default:
      return Pizza.NONE;
  }
}
