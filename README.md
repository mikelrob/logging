# LoggingKit

LoggingKit gives us an interface to use throughout the app for logging messages and errors to various backends.

## Installation

### SPM

Either:

1. In your Package.swift:

```
.package(name: "LoggingKit", url: "https://github.com/mikelrob/Logging", from: "0.1.0"),

```

2. Add to Xcode project via Project settings.

## Usage

### Logging to the console

```
import LoggingKit
...

func setUpLog() {
    Log.register(logger: ConsoleLogger.instance)
}

func logAMessage() {
    Log.debug("Hello, World!")
}

```
