package dev.buijs.klutter.cookbook.examples.hello_world.platform

import dev.buijs.klutter.annotations.Controller
import dev.buijs.klutter.annotations.Event

@Controller
class HelloWorld {

    private val platform =
        Platform().platform

    @Event(name = "whereAmI")
    fun askWhereAmI(): String {
        return platform
    }

    @Event(name = "welcomeMessage")
    fun sayWelcomeUser(username: String? = null): String {
        return if(username != null) {
            "Welcome to $platform, $username!"
        } else {
            "Welcome to $platform! What's your name?"
        }
    }

}