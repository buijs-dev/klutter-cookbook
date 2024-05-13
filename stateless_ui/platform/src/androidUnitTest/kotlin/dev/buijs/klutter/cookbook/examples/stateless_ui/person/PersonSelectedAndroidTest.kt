package dev.buijs.klutter.cookbook.examples.stateless_ui.person

import dev.buijs.klutter.cookbook.examples.stateless_ui.person.PersonSelected
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import kotlin.test.Test
import kotlin.test.assertTrue

@OptIn(ExperimentalCoroutinesApi::class)
class PersonSelectedAndroidTest {

    init {
        Dispatchers.setMain(StandardTestDispatcher())
    }

    private val sut = PersonSelected()

    @Test
    fun selectNextPersonTest() = runTest {
        assertTrue { sut.selectedPersonOrNull()!!.name == "Anne" }
        sut.selectNextPerson()
        assertTrue { sut.selectedPersonOrNull()!!.name == "Andre" }
        sut.selectNextPerson()
        assertTrue { sut.selectedPersonOrNull()!!.name == "Alberto" }
        sut.selectNextPerson()
        assertTrue { sut.selectedPersonOrNull()!!.name == "Alain" }
        sut.selectNextPerson()
        assertTrue { sut.selectedPersonOrNull()!!.name == "Anne" }
        assertTrue { sut.selectedPersonOrNull()!!.id == 0 }
    }

}