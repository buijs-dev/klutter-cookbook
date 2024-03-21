buildscript {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
        mavenLocal()
        maven { url = uri("https://repsy.io/mvn/buijs-dev/klutter") }
    }
    dependencies {
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.20")
        classpath("com.android.tools.build:gradle:8.0.2")
        classpath(platform("dev.buijs.klutter:bom:2023.3.1.beta"))
        classpath("dev.buijs.klutter:gradle")
    }
}
