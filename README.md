# xcodeproj-modify

This microtool, despite its very generic name, currently only performs one very specific task: adds a Run Script phase to an Xcode project. 

The use case is when you have an ephemeral Xcode project that is regenerated by Swift Package Manager and you want to add a Run Script phase to integrate SwiftLint. 

## Usage

```shell
$ xcodeproj-modify MyProject.xcodeproj add-run-script-phase MyTarget swiftlint
```

This will edit your Xcode project `MyProject.xcodeproj` and add a Run Script phase to the `MyTarget` target that runs swiftlint.  Since you specify the script as a command line parameter to the tool, it gets unwieldy if it's a lot of code, so in that case I'd recommend putting it in a script and pass _that_ as the code to add-run-script-phase.


## Installation

Using [Mint](https://github.com/yonaskolb/Mint): 

```shell
$ mint install skagedal/xcodeproj-modify
```

You may also add the tool as a SPM dependency in your Package.swift and then run it with `swift run xcodeproj-modify`.  As an example, see how this is done in my tool ([generate-xcodeproj.sh](https://github.com/skagedal/appicon-generator/blob/master/generate-xcodeproj.sh), [Package.swift](https://github.com/skagedal/appicon-generator/blob/master/Package.swift)).