[![](https://img.shields.io/badge/Buijs-Software-blue)](https://pub.dev/publishers/buijs.dev/packages)
[![GitHub](https://img.shields.io/github/license/buijs-dev/klutter-cookbook?color=black)](https://github.com/buijs-dev/klutter/blob/main/LICENSE)

<img src="https://github.com/buijs-dev/klutter/blob/develop/.github/assets/metadata/icon/klutter_logo.png?raw=true" alt="buijs software klutter logo" />

Klutter is a framework which interconnects Flutter and Kotlin Multiplatform.
It can be used to create Flutter plugins. 
This cookbook contains examples of both the platform (Kotlin) and ui (Flutter) code.
All recipes are based on Klutter version 2023.3.1.beta.

## Local setup
Before following a recipe locally, you need to setup kradle.

You can download the kradle-wrapper from GitHub. 
The download link is noted under paragraph [installation](https://buijs.dev/kradle-1/).

```shell
./gradlew klutterGetKradle
```

Create a **kradle.env** file with the following content:
```properties
cache={{system.user.home}}/.kradle/cache/
output.path={{project.build}}/klutter
skip.codegen=false
```

Now you're ready to build the app:
```shell
./kradlew build
```

## Recipes
- [Hello World](hello_world)
- [Stateless UI](stateless_ui)

## Migration Guides
Upgrading klutter is not always straightforward, due to its beta status. 
See migration guides for more information.

- [2023.1.1.beta to 2023.3.1.beta](migration/2023.3.1.beta.md)