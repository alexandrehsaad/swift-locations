# swift-locations

A wrapper of the CoreLocation framework replacing the delegate pattern with Swift concurrency.

## Installation

1. Add the package to the dependencies in your `Package.swift` file.

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/alexandrehsaad/swift-locations.git", branch: "main")
    ],
    ...
)
```

2. Add the package as a dependency on your target in your `Package.swift` file.

```swift
let package = Package(
    ...
    targets: [
        .target(name: "MyTarget", dependencies: [
            .product(name: "Locations", package: "swift-locations")
        ]),
    ],
    ...
)
```

3. Import the package in your source code.

```swift
import Locations
```

## Demonstration

4. Initiate the manager with your desired accuracy.

```swift
let manager: LocationManager = .init(accuracy: .tenMetres)
```

5. Request the user’s permission to use location services and do something with the asynchronous value you receive. You can not show to the user an authorization dialog twice, but you can show the steps to change the permission from Settings.

```swift
do {
    let status: AuthorizationStatus = try await manager.requestAlwaysAuthorization()
    // Do something with the status.
    print(status)
} catch let error {
    // Do something with the error.
    print(error)
}
```

6. Subscribe to the locater and do something with the asynchronous stream of values you receive. The return type is `CLLocation` from the CoreLocation framework.

```swift
do {
    let stream: AsyncStream<CLLocation> = try manager.subscribeToLocater()
    for await data in stream {
        // Do something with the data.
        print(data)
    }
} catch let error {
    // Do something with the error.
    print(error)
}
```

7. Unsubscribe from the sensor.

```swift
manager.unsubscribeFromLocater()
```

## Troubleshooting

Your app must include usage description keys in its `Info.plist` file for the types of data it needs. Failure to include these keys cause the app to crash. To access location data specifically, it must include either `NSLocationWhenInUseUsageDescription` or `NSLocationAlwaysAndWhenInUseUsageDescription`.

## Roadmap

You can use this framework to track large or small changes in the user's current location with a configurable degree of accuracy. It could be extended to support region monitoring, beacon ranging and compass headings.

## Contribution

### Reporting a bug

If you find a bug, please create an issue.

### Contacting the maintainers

The current code owner of this repository is Alexandre H. Saad ([@alexandrehsaad](https://github.com/alexandrehsaad)). You can contact him by writing an email to alexandresaad at icloud dot com.

## Support

If you like my work, show your support by staring this repository.
 
## Feedback

I would love to hear your thoughts or feedback on how Swift Locations could be improved!
