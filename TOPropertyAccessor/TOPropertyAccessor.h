//
//  TOPropertyAccessor.h
//
//  Copyright 2018-2021 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// All of the supported data types that can be read and written from properties
typedef NS_ENUM (NSInteger, TOPropertyAccessorDataType) {
    TOPropertyAccessorDataTypeUnknown,
    TOPropertyAccessorDataTypeInt,
    TOPropertyAccessorDataTypeFloat,
    TOPropertyAccessorDataTypeDouble,
    TOPropertyAccessorDataTypeBool,
    TOPropertyAccessorDataTypeDate,
    TOPropertyAccessorDataTypeString,
    TOPropertyAccessorDataTypeData,
    TOPropertyAccessorDataTypeArray,
    TOPropertyAccessorDataTypeDictionary,
    TOPropertyAccessorDataTypeObject
};

NS_SWIFT_NAME(PropertyAccessor)
@interface TOPropertyAccessor : NSObject

/// Override this to load and return the value currently
/// associated with the provided property.
/// @param propertyName The name of the property to retrieve
/// @param type The expected data type of the property
- (nullable id)valueForProperty:(NSString *)propertyName
                           type:(TOPropertyAccessorDataType)type;

/// Override this method to set new values to the backing
/// store for a property.
/// @param value The new value to write
/// @param propertyName The name of the property
/// @param type The data type of the provided value
- (void)setValue:(_Nullable id)value
     forProperty:(NSString *)propertyName
            type:(TOPropertyAccessorDataType)type;

/// Override this method with an array of any property names
/// that should be opted out of being dynamically accessed.
+ (nullable NSArray<NSString *> *)ignoredProperties;

/// Override this method with a dictionary of default values.
/// These will be applied the first time of execution when it
/// is detected that `NSUserDefaults` does not contain entries
/// for these keys.
+ (nullable NSDictionary<NSString *, id> *)defaultPropertyValues;

/// :nodoc:
/// These method defines enable subscripting, where property
/// values can be set like an `NSDictionary`.
- (id)objectForKeyedSubscript:(NSString *)key;
- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
