buildscript {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
        mavenLocal()
        maven { url = uri("https://repsy.io/mvn/buijs-dev/klutter") }
    }
    dependencies {
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.6.10")
        classpath("com.android.tools.build:gradle:7.0.4")
        classpath(platform("dev.buijs.klutter:bom:2023.1.1.beta"))
        classpath("dev.buijs.klutter:gradle")
    }
}
