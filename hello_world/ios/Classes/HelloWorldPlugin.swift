import Flutter
import UIKit
import Platform

public class HelloWorldPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {

    static let mcs: [String] = [
      "dev.buijs.klutter.cookbook.examples.hello_world/channel/hello_world", 
    ]

    static let ecs: [String] = [
    ]

    var methodChannels: Set<FlutterMethodChannel> = []
    var eventChannels: Set<FlutterEventChannel> = []


    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let instance = HelloWorldPlugin()
        
        for name in mcs {
           let channel = FlutterMethodChannel(name: name, binaryMessenger: messenger)
            instance.methodChannels.insert(channel)
            registrar.addMethodCallDelegate(instance, channel: channel)
        }
        
        for name in ecs {
            let channel = FlutterEventChannel(name: name, binaryMessenger: messenger)
            channel.setStreamHandler(instance)
        }
    }     
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let data = call.arguments
        switch call.method {
        case "whereAmI":
            self.whereAmI(data: data, result: result)
        case "welcomeMessage":
            self.welcomeMessage(data: data, result: result)
         default:
            result(FlutterMethodNotImplemented)
         }
     }

    func whereAmI(data: Any?, result: @escaping FlutterResult) {
       let value = HelloWorld().askWhereAmI()
        result(value)
    }
    
    func welcomeMessage(data: Any?, result: @escaping FlutterResult) {
        let dataOrNull = TypeHandlerKt.stringOrNull(data: data)
        if(dataOrNull == nil) {
           result(FlutterError(code: "ERROR_CODE",
                           message: "Unexpected data type: \(dataOrNull)",
                           details: nil))
        } else {
           result(HelloWorld().sayWelcomeUser(username: (dataOrNull as! String)))
         }
     }
    public func onListen(withArguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
        let topic = withArguments ?? "none"
        switch "\(topic)" {          case "none":
           eventSink(FlutterError(code: "ERROR_CODE",
                                         message: "Topic not provided!",
                                         details: ""))
        default:
           eventSink(FlutterError(code: "ERROR_CODE",
                               message: "Unknown topic",
                               details: "\(topic)"))
        }
        return nil
     }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        for channel in eventChannels {
            channel.setStreamHandler(nil)
        }
        return nil
    }

}