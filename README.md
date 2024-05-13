[![](https://img.shields.io/badge/Buijs-Software-blue)](https://pub.dev/publishers/buijs.dev/packages)
[![GitHub](https://img.shields.io/github/license/buijs-dev/klutter-cookbook?color=black)](https://github.com/buijs-dev/klutter/blob/main/LICENSE)

<img src="https://github.com/buijs-dev/klutter/blob/develop/.github/assets/metadata/icon/klutter_logo.png?raw=true" alt="buijs software klutter logo" />

Klutter is a framework which interconnects Flutter and Kotlin Multiplatform.
It can be used to create Flutter plugins. 
This cookbook contains examples of both the platform (Kotlin) and ui (Flutter) code.
All recipes are based on Klutter version 2024.1.2.beta.

## Local setup
Before following a recipe locally, you need to set up [kradle](https://buijs.dev/kradle-1/) 
by running the following command in the example:

```shell
./gradlew klutterGetKradle
```

Create a kradle.env file in the example root directory with the following content:

```properties
cache={{system.user.home}}/.kradle/cache/
output.path={{project.build}}/klutter
skip.codegen=false
protoc.url=https://github.com/protocolbuffers/protobuf/releases/download/v25.3/protoc-25.3-osx-universal_binary.zip
```

In the root **and** root/android folder add local.properties with the following content:
```properties
sdk.dir=/path-to-your-android-sdk
flutter.sdk=/path-to-your-flutter-dist
```

You can then build the project simply by running:

```shell
./kradle build
```

The example app can be started from root/example/lib/main.dart.

## Recipes
- [Hello World](hello_world)
- [Stateless UI](stateless_ui)

## Migration Guides
Upgrading klutter is not always straightforward, due to its beta status. 
See migration guides for more information.

- [2023.1.1.beta to 2023.3.1.beta](migration/2023.3.1.beta.md)
- [2023.3.1.beta to 2024.1.2.beta](migration/2024.1.2.beta.md)