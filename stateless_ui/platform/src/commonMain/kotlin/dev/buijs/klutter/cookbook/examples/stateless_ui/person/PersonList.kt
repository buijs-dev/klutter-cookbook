package dev.buijs.klutter.cookbook.examples.stateless_ui.person

import dev.buijs.klutter.annotations.Controller
import dev.buijs.klutter.annotations.Event
import dev.buijs.klutter.kompose.Publisher

@Controller
class PersonList: Publisher<PersonDatabaseSnapshot>() {

    @Event
    suspend fun emitPersonsFromDatabase() {
        publish()
    }

    override suspend fun publish() {
        emit(PersonDatabaseSnapshot(PersonDatabase.persons))
    }

}