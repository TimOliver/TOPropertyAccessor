# TOPropertyAccessor

[![CI](https://github.com/TimOliver/TOPropertyAccessor/actions/workflows/ci.yml/badge.svg)](https://github.com/TimOliver/TOPropertyAccessor/actions/workflows/ci.yml)
[![Version](https://img.shields.io/cocoapods/v/TOPropertyAccessor.svg?style=flat)](http://cocoadocs.org/docsets/TOPropertyAccessor)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/TimOliver/TOPropertyAccessor/main/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/TOPropertyAccessor.svg?style=flat)](http://cocoadocs.org/docsets/TOPropertyAccessor)

`TOPropertyAccessor` is an open source, Objective-C abstract class. Similar to [Realm](https://github.com/realm/realm-cocoa)'s Cocoa API, it uses the dynamic nature of the Objective-C runtime to access the properties of any of its subclasses, and routes calling them through overridable access points.

The goal behind this library is to make it trivial to set up custom classes with properties that dynamically map to any kind of backing store. This includes things like [`NSUserDefaults`](https://developer.apple.com/documentation/foundation/nsuserdefaults) or straight to files.

## Features

* Dynamically swizzles properties in any subclass and exposes them through a single dynamic access point that can be used to custom store and retrieve values.
* Supports all of the major primitive data types and the most common object types.
* Also supports classes that conform to `NSCoding`.
* Properties may be manually marked as ignored and will behave as normal.

## Usage

Using `TOPropertyAccessor` is very easy. All you need to do is subclass it, and put all of your logic in the subclass.

### Header

```objc
// Define a subclass with a property.
@interface MyCustomClass: TOPropertyAccessor

@property (nonatomic, assign) NSInteger myInt;

@end 
```

### Implementation

```objc
@implementation MyCustomClass

- (id)valueForProperty:(NSString *)propertyName
                  type:(TOPropertyAccessorDataType)type
{
	// `propertyName` will be "myInt" and type will be `.integer`
	
	// Retrieve and return the value you saved for "myInt"
	return @(1);
}

- (void)setValue:(id)value
     forProperty:(NSString *)propertyName
            type:(TOPropertyAccessorDataType)type
{
	// Value will be the new value to set, 
	// and propertyName will be "myInt"
  
  NSLog("Saved %@ for %@", value, propertyName);
}    

@end

```

## Requirements

* Xcode 12
* iOS 9.0 and up

## Installation

To install `TOPropertyAccessor` manually, simply download this repo, and copy the  `TOPropertyAccessor` folder to your Xcode project.

### CocoaPods

Add the following to your Podfile.

```
pod 'TOPropertyAccessor'
```

## Why build this?

I originally wrote this library as a part of [`TOAppSettings`](https://github.com/TimOliver/TOAppSettings) where it is exclusively used for mapping the properties in a class to an app's `NSUserDefaults`. However, I've since discovered that this sort of mechanism can be easily reused for any number of different backing stores, and so I made the decision to detach it from `TOAppSettings` and make it a standalone library.

I originally wrote this library before Swift property wrappers became a thing, and admittedly, the goals of both of these mechanisms are really similar.

But that being said, this library seems to be enable some extra capabilities that wouldn't be easy to do with property wrappers. For example, it's not easy to do dependency injection with property wrappers, and so the idea of using wrappers to work on third party properties (such as a file URL) seems rather tricky.

(If I'm wrong, feel free to correct me!)

### Credits

`TOPropertyAccessor` was created by [Tim Oliver](http://twitter.com/TimOliverAU) as a component of [iComics](http://icomics.co).

### License

`TOPropertyWrapper` is licensed under the MIT License, please see the [LICENSE](LICENSE) file. 
