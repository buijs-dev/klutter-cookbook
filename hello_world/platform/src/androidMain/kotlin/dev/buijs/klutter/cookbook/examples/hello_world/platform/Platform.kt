package dev.buijs.klutter.cookbook.examples.hello_world.platform

actual class Platform actual constructor() {
    actual val platform: String = "Android ${android.os.Build.VERSION.SDK_INT}"
}
      