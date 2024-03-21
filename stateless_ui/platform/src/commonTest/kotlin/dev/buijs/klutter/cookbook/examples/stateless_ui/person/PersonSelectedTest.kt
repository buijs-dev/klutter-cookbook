package dev.buijs.klutter.cookbook.examples.stateless_ui.person

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import kotlin.test.Test
import kotlin.test.assertTrue

@OptIn(ExperimentalCoroutinesApi::class)
class PersonSelectedTest {

    init {
        Dispatchers.setMain(StandardTestDispatcher())
    }

    private val sut = PersonSelected()

    @Test
    fun selectNextPersonTest() = runTest {
        assertTrue { sut.selectedPersonOrNull() == null }
        sut.selectNextPerson()
        assertTrue { sut.selectedPersonOrNull() != null }
    }

}