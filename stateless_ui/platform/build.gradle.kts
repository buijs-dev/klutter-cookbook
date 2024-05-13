import dev.buijs.klutter.gradle.dsl.embedded
import org.jetbrains.kotlin.gradle.plugin.mpp.apple.XCFramework
import dev.buijs.klutter.gradle.tasks.*

plugins {
    id("com.android.library")
    id("dev.buijs.klutter")
    kotlin("multiplatform")
    kotlin("plugin.serialization") version "1.9.0"
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
    androidTarget()

    val xcfName = "Platform"
    val xcFramework = XCFramework(xcfName)

    ios {
       binaries.framework {
            baseName = xcfName
            xcFramework.add(this)
            export("dev.buijs.klutter:flutter-engine:2024.1.1.beta")
        }
    }

    iosSimulatorArm64 {
        binaries.framework {
            baseName = xcfName
            xcFramework.add(this)
            export("dev.buijs.klutter:flutter-engine-iosSimulatorArm64:2024.1.1.beta")
        }
    }

    sourceSets {

        val commonMain by getting {
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.3")
                implementation("org.jetbrains.kotlinx:kotlinx-serialization-protobuf:1.6.3")
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
            }
        }

        val commonTest by getting {
            dependencies {
                implementation(kotlin("test-common"))
                implementation(kotlin("test-annotations-common"))
                implementation(kotlin("test-junit"))
                implementation("junit:junit:4.13.2")
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3")
            }
        }

        val androidMain by getting {
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
                embedded("dev.buijs.klutter:flutter-engine-kmp-android:2024.1.1.beta")
            }
        }

        val androidUnitTest by getting {
            dependencies {
                implementation(kotlin("test-junit"))
                implementation("junit:junit:4.13.2")
            }
        }

        val iosMain by getting {
            dependencies {
                api("dev.buijs.klutter:flutter-engine:2024.1.1.beta")
            }
        }

        val iosSimulatorArm64Main by getting {
           dependsOn(iosMain)
           dependencies {
             api("dev.buijs.klutter:flutter-engine-iosSimulatorArm64:2024.1.1.beta")
           }
        }

        val iosTest by getting
        val iosSimulatorArm64Test by getting {
           dependsOn(iosTest)
        }
    }
}

android {
    namespace = "dev.buijs.klutter.cookbook.examples.stateless_ui.platform"
    sourceSets["main"].kotlin { srcDirs("src/androidMain/kotlin") }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        compileSdk = 33
        minSdk = 24
    }

    publishing {
       singleVariant("release") {
            withSourcesJar()
            withJavadocJar()
        }

        singleVariant("debug") {
            withSourcesJar()
            withJavadocJar()
        }
    }
}

val gradleBuildInstanceClassLoader: ClassLoader = this::class.java.classLoader
tasks.register<GenerateProtoSchemasGradleTask>(GenerateProtoSchemasGradleTask.taskName) {
    classLoader = gradleBuildInstanceClassLoader
}

tasks.configureEach {
    if (name.startsWith("compile")) {
        mustRunAfter(tasks.named("kspCommonMainKotlinMetadata"))
    }
}
