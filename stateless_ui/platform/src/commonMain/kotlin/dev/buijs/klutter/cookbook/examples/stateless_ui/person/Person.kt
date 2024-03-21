package dev.buijs.klutter.cookbook.examples.stateless_ui.person

import dev.buijs.klutter.annotations.Response
import dev.buijs.klutter.annotations.JSON
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Response
@Serializable
data class Person(
    val id: Int,
    val name: String,
    val age: Int,
    val bornOnPlanet: Planet,
    val isHuman: Boolean?,
    val friends: List<Person>?,
    val favoritePizzas: Map<Pizza, Double>
): JSON<Person>() {
    override fun data() = this

    override fun strategy() = serializer()
}

@Response
@Serializable
enum class Planet {
    EARTH,
    MARS,
    JUPITER,
    EGO
}

@Response
@Serializable
enum class Pizza {
    @SerialName("4 cheese")
    FOUR_CHEESE,

    @SerialName("5 cheese")
    FIVE_CHEESE,

    @SerialName("6 cheese!?")
    SIX_CHEESE,

    @SerialName("Is there ever enough cheese? No ;-)")
    IS_THERE_EVER_ENOUGH_CHEESE
}

@Response
@Serializable
data class PizzaLove(
    val pizza: Pizza,
    val love: Double,
): JSON<PizzaLove>() {
    override fun data() = this

    override fun strategy() = serializer()
}