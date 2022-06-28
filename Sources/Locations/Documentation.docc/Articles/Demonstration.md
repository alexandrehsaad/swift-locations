# Demonstration

A demonstrating on how to use this package.

## Overview

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

## Using this package

The Swift Package Manager is a tool for managing the distribution of Swift code and is integrated into the swift compiler.

1. Initiate the manager with your desired accuracy.

	```swift
	let locater: Locater = .init(accuracy: .tenMetres)
	```

2. Request the user’s permission to use location services and do something with the asynchronous value you receive. You can not show to the user an authorization dialog twice, but you can show the steps to change the permission from Settings.

	```swift
	do {
        let status: AuthorizationStatus = try await locater.requestAlwaysAuthorization()
        // Do something with the status.
        print(status)
	} catch let error {
        // Do something with the error.
        print(error)
	}
	```

3. Subscribe to the locater and do something with the asynchronous stream of values you receive. The return type is `Point`, which conforms to a new protocol `PlottableInTwoDimensions`.

    ```swift
    do {
        let stream: AsyncStream<Point> = try locater.subscribe()
        for await data in stream {
            // Do something with the data.
            print(data)
        }
	} catch let error {
        // Do something with the error.
        print(error)
	}
	```

4. Unsubscribe from the locater.

	```swift
    locater.unsubscribe()
	```

### Troubleshooting common errors

Your app must include usage description keys in its `Info.plist` file for the types of data it needs. Failure to include these keys cause the app to crash. To access location data specifically, it must include either `NSLocationWhenInUseUsageDescription` or `NSLocationAlwaysAndWhenInUseUsageDescription`.
