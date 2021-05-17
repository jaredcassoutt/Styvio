# Styvio

![Pod Version](https://img.shields.io/badge/pod-v0.0.3-blue)
![Pod Platform](https://img.shields.io/badge/platform-iOS-black)
![Pod License](https://img.shields.io/badge/license-MIT-inactive)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-brightgreen.svg?style=flat)](https://cocoapods.org)

`Styvio` is a package for using the Styvio stock market web api


## Installation

### From CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift, which automates and simplifies the process of using 3rd-party libraries like `Styvio` in your projects. First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'Styvio'
```

Second, install `Styvio` into your project:

```ruby
pod install
```

## Usage

Using `Styvio` in your app will usually look as simple as this:


First, add `Styvio` to your file imports
```Swift
import Styvio
```

In order to make a call to the API to access stock data, the following function should be used:
```Swift
StyvioAPI().fetchStockInformation(stockName: ticker) { (stockInfo) in
    //success connecting to api
} failure: { (error) in
    //failure connecting to api
}
```

Similarly in order to make a call to the API to access sentiment data, the following function should be used:
```Swift
StyvioAPI().fetchSentimentInformation(stockName: self.ticker) { (sentimentInfo) in
    //success connecting to api
} failure: { (error) in
    //failure connecting to api
}
```

Every endpoint available on the `Styvio` API is also available within the `stockInfo` or `sentimentInfo` that is provided in the closures.
