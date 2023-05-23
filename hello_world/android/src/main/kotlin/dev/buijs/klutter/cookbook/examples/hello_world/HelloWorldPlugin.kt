package dev.buijs.klutter.cookbook.examples.hello_world

import android.app.Activity
import android.content.Context
import dev.buijs.klutter.*
import dev.buijs.klutter.EventChannelFacade
import dev.buijs.klutter.MethodChannelFacade
import dev.buijs.klutter.registerEventSink
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import dev.buijs.klutter.cookbook.examples.hello_world.platform.*

private val methodChannelNames = setOf(
        "dev.buijs.klutter.cookbook.examples.hello_world/channel/hello_world",
)

private val eventChannelNames = emptySet<String>()


class HelloWorldPlugin: FlutterPlugin, MethodCallHandler, StreamHandler, ActivityAware {

    private val mainScope = CoroutineScope(Dispatchers.Main)
    private lateinit var activity: Activity
    private lateinit var mcFacade: MethodChannelFacade
    private lateinit var ecFacade: EventChannelFacade

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        this.mcFacade = MethodChannelFacade(this, binding.binaryMessenger, methodChannelNames)
        this.ecFacade = EventChannelFacade(this, binding.binaryMessenger, eventChannelNames)
    }        

    override fun onMethodCall(call: MethodCall, result: Result) {
        mainScope.launch {
            onEvent(
                event = call.method,
                data = call.arguments,
                result = result
            )
        }
    }


    override fun onListen(arguments: Any?, eventSink: EventChannel.EventSink) {
        when (arguments) {
            else -> {
                eventSink.error("Unknown topic", "$arguments", null)
            }
        }
    }

    override fun onCancel(arguments: Any?) {
    }

    override fun onDetachedFromEngine(
        binding: FlutterPlugin.FlutterPluginBinding
    ) {
    }

    override fun onAttachedToActivity(
        binding: ActivityPluginBinding
    ) {
        activity = binding.activity
    }

    override fun onReattachedToActivityForConfigChanges(
        binding: ActivityPluginBinding
    ) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        // nothing
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // nothing
    }

    suspend fun <T> onEvent(event: String, data: T?, result: Result) { 
           try {
               when(event) {
                "welcomeMessage" ->
                    result.success(HelloWorld().sayWelcomeUser(data as String?))
                "whereAmI" ->
                    result.success(HelloWorld().askWhereAmI())
                   else -> result.notImplemented()
               }
           } catch(e: Exception) {
               result.error("10101", e.message, e.stackTrace)
           }
       }
}
