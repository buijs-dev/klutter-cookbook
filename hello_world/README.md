[![](https://img.shields.io/badge/Buijs-Software-blue)](https://pub.dev/publishers/buijs.dev/packages)
[![GitHub](https://img.shields.io/github/license/buijs-dev/klutter-cookbook?color=black)](https://github.com/buijs-dev/klutter/blob/main/LICENSE)

<img src="https://github.com/buijs-dev/klutter/blob/develop/.github/assets/metadata/icon/klutter_logo.png?raw=true" alt="buijs software logo" />

# Hello World
A klutter example project using a Simple Controller to send and retrieve data.
This example uses statefull widgets to update UI. 
For a stateless UI which stores state on the platform-side, see [Hello World Stateless](../hello_world_stateless_ui).

## Getting Started
The platform module must be built before running the app locally.

In the root **and** root/android folder add local.properties with the following content:
```properties
sdk.dir=/Users/your-username/Library/Android/sdk
flutter.sdk=/path-to-your-flutter-dist
```

In the root folder run:

```shell
./gradlew build -p "platform"
```

Then start the app from root/example/lib/main.dart.