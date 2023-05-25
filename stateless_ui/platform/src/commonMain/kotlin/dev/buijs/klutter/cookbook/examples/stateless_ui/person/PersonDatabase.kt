package dev.buijs.klutter.cookbook.examples.stateless_ui.person

import dev.buijs.klutter.annotations.JSON
import dev.buijs.klutter.annotations.Response
import kotlinx.serialization.Serializable

@Response
@Serializable
data class PersonDatabaseSnapshot(val persons: Map<Int, Person>): JSON<PersonDatabaseSnapshot>() {
    override fun data(): PersonDatabaseSnapshot = this

    override fun strategy() = serializer()
}

object PersonDatabase {

    val persons = mapOf(
        1 to person1.copy(friends = listOf(person2, person4)),
        2 to person2.copy(friends = listOf(person1, person4)),
        3 to person3.copy(friends = listOf(person4)),
        4 to person4.copy(friends = listOf(person1, person3)))

    fun getByNameOrNull(name: String) =
        persons.values.firstOrNull { it.name == name }

    fun getByIdOrNull(id: Int) =
        persons[id]

    fun getContainingFriends(id: List<Int>) =
       persons.values.filter { person ->
           person.friends?.any { friend ->
               id.map { friendId -> getByIdOrNull(friendId) }.contains(friend) } ?: false }
}

private val personNamesById = getPersonNames()

private val person1 = Person(
    name = personNamesById[1]!!,
    age =  25,
    bornOnPlanet = Planet.EARTH,
    isHuman = true,
    friends = mutableListOf(),
    favoritePizzas = mapOf(Pizza.IS_THERE_EVER_ENOUGH_CHEESE to 10.0))

private val person2 = Person(
    name = personNamesById[2]!!,
    age =  155,
    bornOnPlanet = Planet.EGO,
    isHuman = false,
    friends = mutableListOf(),
    favoritePizzas = mapOf(Pizza.FOUR_CHEESE to 9.2))

private val person3 = Person(
    name = personNamesById[3]!!,
    age =  64,
    bornOnPlanet = Planet.JUPITER,
    isHuman = true,
    friends = mutableListOf(),
    favoritePizzas = mapOf(Pizza.FIVE_CHEESE to 10.0, Pizza.SIX_CHEESE to 9.8))

private val person4 = Person(
    name = personNamesById[4]!!,
    age =  13,
    bornOnPlanet = Planet.MARS,
    isHuman = false,
    friends = mutableListOf(),
    favoritePizzas = mapOf(Pizza.SIX_CHEESE to 8.9))