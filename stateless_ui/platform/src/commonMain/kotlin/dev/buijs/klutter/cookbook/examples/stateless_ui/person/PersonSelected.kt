package dev.buijs.klutter.cookbook.examples.stateless_ui.person

import dev.buijs.klutter.annotations.Controller
import dev.buijs.klutter.annotations.Event
import dev.buijs.klutter.kompose.Publisher

internal var person: Person? = PersonDatabase.persons[0]

@Controller
class PersonSelected: Publisher<Person>() {

    private var state: Person? = null

    @Event(name = "selectNextPerson")
    suspend fun selectNextPerson() {
        val currentId = state?.id ?: -1
        val nextId = currentId+1
        person = PersonDatabase.getByIdOrNull(nextId) ?: PersonDatabase.getByIdOrNull(0)
        publish()
    }

    @Event(name = "personId")
    suspend fun selectPersonById(id: Int) {
        person = PersonDatabase.getByIdOrNull(id)
        publish()
    }

    @Event
    suspend fun selectPersonByName(name: String) {
        person = PersonDatabase.getByNameOrNull(name)
        publish()
    }

    @Event
    suspend fun updateSelectedPersonIsHuman(isHuman: Boolean) {
        person = person?.copy(isHuman = isHuman)
        publish()
    }

    @Event
    suspend fun updateSelectedPersonIsHumanRandom(isHuman: List<Boolean>) {
        updateSelectedPersonIsHuman(isHuman = isHuman.random())
    }

    @Event
    suspend fun selectPersonByFriendsDouble(hasFriends: List<Double>) {
        selectPersonByFriends(hasFriends.map { it.toInt() })
    }

    @Event
    suspend fun selectPersonByFriendsLong(hasFriends: List<Long>) {
        selectPersonByFriends(hasFriends.map { it.toInt() })
    }

    @Event
    suspend fun selectPersonByFriends(hasFriends: List<Int>) {
        person = PersonDatabase.getContainingFriends(hasFriends).first()
        publish()
    }

    @Event
    suspend fun selectPersonByLoveForPizza(pizzaLove: PizzaLove) {
        person = PersonDatabase.persons
            .firstOrNull { it.favoritePizzas[pizzaLove.pizza]!! >= pizzaLove.love }
        publish()
    }

    @Event
    suspend fun selectPersonByPizzaAddictionLevelLong(addictionLevel: Long) {
        selectPersonByPizzaAddictionLevel(addictionLevel.toDouble())
    }

    @Event
    suspend fun selectPersonByPizzaAddictionLevel(addictionLevel: Double) {
        person = PersonDatabase.persons
            .firstOrNull { it.favoritePizzas.any { fav -> fav.value >= addictionLevel } }
        publish()
    }

    @Event
    fun countPersonsByPizza(pizza: Pizza): Int = PersonDatabase.persons.count { it.favoritePizzas.containsKey(pizza) }

    @Event
    fun selectedPersonOrNull(): Person? = state

    override suspend fun publish() {
        when {
            person == null -> {
                state = null
            }

            state == null -> {
                state = person
                emit(state!!)
            }

            person != state -> {
                state = person
                emit(state!!)
            }

            else -> {
                // Nothing
            }
        }
    }

}