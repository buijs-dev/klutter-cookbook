import dev.buijs.klutter.gradle.dsl.embedded
import org.jetbrains.kotlin.gradle.plugin.mpp.apple.XCFramework

plugins {
    id("com.android.library")
    id("dev.buijs.klutter")
    kotlin("multiplatform")
    kotlin("plugin.serialization") version "1.6.10"
}

version = "1.0"

klutter {
    root = rootProject.rootDir

    plugin {
       name = "stateless_ui"
    }

    include("bill-of-materials")
}

kotlin {

    jvmToolchain(17)
    android()

    val xcfName = "Platform"
    val xcFramework = XCFramework(xcfName)

    ios {
       binaries.framework {
            baseName = xcfName
            xcFramework.add(this)
            export("dev.buijs.klutter:flutter-engine:2023.1.1.beta")
        }
    }

    iosSimulatorArm64 {
        binaries.framework {
            baseName = xcfName
            xcFramework.add(this)
            export("dev.buijs.klutter:flutter-engine-iosSimulatorArm64:2023.1.1.beta")
        }
    }

    sourceSets {

        val commonMain by getting {
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.5.0")
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4")
            }
        }

        val commonTest by getting {
            dependencies {
                implementation(kotlin("test-common"))
                implementation(kotlin("test-annotations-common"))
                implementation(kotlin("test-junit"))
                implementation("junit:junit:4.13.2")
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.6.4")
            }
        }

        val androidMain by getting {
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.6.4")
                embedded("dev.buijs.klutter:flutter-engine-kmp-android:2023.1.1.beta")
            }
        }

        val androidTest by getting {
            dependencies {
                implementation(kotlin("test-junit"))
                implementation("junit:junit:4.13.2")
            }
        }

        val iosMain by getting {
            dependencies {
                api("dev.buijs.klutter:flutter-engine:2023.1.1.beta")
            }
        }

        val iosSimulatorArm64Main by getting {
           dependsOn(iosMain)
           dependencies {
             api("dev.buijs.klutter:flutter-engine-iosSimulatorArm64:2023.1.1.beta")
           }
        }

        val iosTest by getting
        val iosSimulatorArm64Test by getting {
           dependsOn(iosTest)
        }
    }
}

android {
    namespace = "dev.buijs.klutter.cookbook.examples.stateless_ui.person.platform"
    sourceSets["main"].kotlin { srcDirs("src/androidMain/kotlin") }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        minSdk = 24
        compileSdk = 33
    }
}

tasks.build.get()
    .setFinalizedBy(listOf(
        tasks.getByName("assemblePlatformReleaseXCFramework"),
        tasks.getByName("klutterCopyAarFile")))

tasks.getByName("assemblePlatformReleaseXCFramework")
    .setFinalizedBy(listOf(tasks.getByName("klutterCopyFramework")))