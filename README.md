IMGA SDK for iOS is library for iOS providing a powerful high-level webview abstractions to interact with the IMGA web app. 

## Installation
IMGA SDK supports multiple methods for installing the library in a project.

## Installation with CocoaPods

To integrate IMGA SDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'IMGASDK', :git => 'git@github.com:2CodersStudio/2CodersFrameworkPod.git', :tag => '0.1'
```

## Requirements
IMGA SDK requires iOS 12 and xCode 12.4



## Usage



#### Creating an instance

```swift
 let imga = IMGASDK(logLevel: .debug)
```
### Initialiasing de SDK (launch)
##### Launching the SDK with raw data
```swift
let eventCentreData:IMGAData = [
            "operator": "sgd-light",
            "sport": "golf",
            "targetModule": "full",
            "eventId": "269",
            "language": "en",
            "version": "latest",
            "initialContext" : [
                "view": "GroupDetail",
                "roundNo": "1",
                "groupNo": "37"],
            "targetElementSelector": "#img-arena-event-centre",
            "options":["videoPlaybackEnabled": "false"]
        ]
//Launch with the event centre data
try? imga.launch(with: eventCentreData) { imgaView in
    if let newView = imgaView {
        //Do something with the imgaView
    }
}
```

##### Launching the SDK with IMGAEventCentreParams object
```swift

let initialContex:IMGAData = [
            "view": "GroupDetail",
            "roundNo": "1",
            "groupNo": "37"]
        
let eventCentreDataParams = IMGAEventCentreParams(operatorName: "operatorName",
                                         sport: "sport",
                                         version: "version",
                                         eventId: "eventId",
                                         language: "language",
                                         theme: "theme",
                                         targetModule: "targetModule",
                                         initialContext: initialContex,
                                         options: nil,
                                         targetElementSelector: "targetElementSelector")

//Launch with the event centre data
try? imga.launch(with: eventCentreDataParams) { imgaView in
    if let newView = imgaView {
        //Do something with the imgaView
    }
}
```
##### Launching the SDK and append the IMGA View to a container
```swift

let initialContex:IMGAData = [
"view": "GroupDetail",
"roundNo": "1",
"groupNo": "37"]

let eventCentreDataParams = IMGAEventCentreParams(operatorName: "operatorName",
                        sport: "sport",
                        version: "version",
                        eventId: "eventId",
                        language: "language",
                        theme: "theme",
                        targetModule: "targetModule",
                        initialContext: initialContex,
                        options: nil,
                        targetElementSelector: "targetElementSelector")

//Container where to add the IMGA view
let myContainer = UIView()

//Launch with the event centre data
try? imga.launch(andAddTo: myContainer, with: eventTest1)
```

##### Subscribing to status changes

```swift
//Instance the sdk
let imga = IMGASDK(logLevel: .debug)
//Subscribe to the sdk status changes
imga.onStatusChange = {status, error in
    print("Status:\(status)")
    if let e = error {
        print("Error on status:\(e)")
    }
}
```
##### Subscribing to new messages

There are several types of messages/topics
- `CONTEXT_UPDATE`: Topic for covering general UI state updates, for example navigation changes or the user selecting a player in the UI.
- `HANDSHAKE_FAILED`:  Topic to signify the handshake between Event Centre and your site failed to complete.

```swift
//Instance the sdk
let imga = IMGASDK(logLevel: .debug)
imga.onNewMessage = {name, message, error in
    print("New Message:\(name)-\(message)")
    if let e = error {
        print("Error on message:\(e.description)")
    }
}
```

##### Stop the sdk
```swift
//Instance the sdk
let imga = IMGASDK(logLevel: .debug)
//Stop the instance
imga.stop()
```

## Credits

IMGA SDK is owned and maintained by the [IMGA Development team](https://www.imgarena.com/).

## License
IMG Media Limited
