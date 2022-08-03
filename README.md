![](Assets/GitHubBanner.png)

# swift-locations

A wrapper on the CoreLocation framework replacing the delegate pattern with Swift concurrency.

## Overview

CoreLocation reports a device's location, altitude and orientation from on-device components.

## Availability

- iOS 13.0+
- iPadOS 13.0+
- macCatalyst 15.0+
- macOS 10.15+
- watchOS 6.0+

## Installation

The Swift Package Manager is a tool for managing the distribution of Swift code and is integrated into the swift compiler.

1. Add the package to the dependencies in your `Package.swift` file.

    ```swift
    let package: Package = .init(
        ...
        dependencies: [
            .package(url: "https://github.com/alexandrehsaad/swift-locations.git", branch: "main")
        ],
        ...
    )
    ```

2. Add the package as a dependency on your target in your `Package.swift` file.

    ```swift
    let package: Package = .init(
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

1. Initiate the locater with your desired accuracy.

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
        let stream: AsyncStream<CLLocation> = try locater.subscribe()
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

## Documentation

You can read more about this package by visiting the [documentation page].

## Contribution

Contributions are what makes the open source community such an amazing place to learn, inspire, and create. If you wish to contribute and be part of this project, please fork the repository and create a [pull request].

1. Fork the repository
2. Create your feature branch `git checkout -b feature/NewFeature`
3. Commit your changes `git commit -m 'Added a new feature'`
4. Push to your branch `git push origin feature/NewFeature`
5. Open a pull request

### Reporting a bug

If you find a bug, please create an [issue].

### Contacting the maintainers

If you want to share your thoughts on how to improve this repository, you can contact the code owner. See the `CODEOWNERS.txt` file for more information.

### Supporting this repository

If this repository has been useful to you in some way, show your support by starring it.

## Code of Conduct

To be a truly great community, we welcome developers from all walks of life, with different backgrounds, and with a wide range of experience. A diverse and friendly community will have more great ideas, more unique perspectives, and produce more great code. We will work diligently to make this community welcoming to everyone. See the `CODEOFCONDUCT.md` file for more information.

## License

Distributed under Apache License v2.0 with Runtime Library Exception. See the `LICENSE.md` file for more information.

[documentation page]: https://alexandrehsaad.github.io/swift-locations/documentation/locations
[pull request]: https://github.com/alexandrehsaad/swift-locations/pulls
[issue]: https://github.com/alexandrehsaad/swift-locations/issues
