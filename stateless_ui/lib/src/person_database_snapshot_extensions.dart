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
import 'person_database_snapshot_dataclass.dart';
import 'person_dataclass.dart';
import 'person_extensions.dart';

/// Autogenerated JSON (de)serialization methods by Squint.
extension PersonDatabaseSnapshotJsonBuilder on PersonDatabaseSnapshot {
  JsonObject get toJsonObject => JsonObject.fromNodes(nodes: [
        JsonArray<dynamic>(key: "persons", data: persons),
      ]);

  String get toJson => toJsonObject.stringify;
}

extension PersonDatabaseSnapshotJsonString2Class on String {
  PersonDatabaseSnapshot get toPersonDatabaseSnapshot =>
      jsonDecode.toPersonDatabaseSnapshot;
}

extension PersonDatabaseSnapshotJsonObject2Class on JsonObject {
  PersonDatabaseSnapshot get toPersonDatabaseSnapshot => PersonDatabaseSnapshot(
        persons: array<Person>("persons",
            decoder: (dynamic value) =>
                JsonObject.fromMap(data: value as Map<String, dynamic>)
                    .toPerson),
      );
}
