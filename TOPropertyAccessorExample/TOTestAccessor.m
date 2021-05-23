//
//  TOTestAccessor.m
//  TOPropertyAccessorExample
//
//  Created by Tim Oliver on 16/5/21.
//

#import "TOTestAccessor.h"

@implementation TOTestAccessor

- (id)valueForProperty:(NSString *)propertyName
                  type:(TOPropertyAccessorDataType)type
           objectClass:(Class)objectClass
{
    switch (type) {
        case TOPropertyAccessorDataTypeInt: return @(1);
        case TOPropertyAccessorDataTypeFloat: return @(1.1);
        case TOPropertyAccessorDataTypeBool: return @(YES);
        case TOPropertyAccessorDataTypeDate: return [NSDate dateWithTimeIntervalSince1970:0];
        case TOPropertyAccessorDataTypeString: return @"Hello world!";
        case TOPropertyAccessorDataTypeData: return [@"Data" dataUsingEncoding:NSUTF8StringEncoding];
        case TOPropertyAccessorDataTypeArray: return @[@"Hello", @"World"];
        case TOPropertyAccessorDataTypeDictionary: return @{@"Greeting": @"Hello World"};
        case TOPropertyAccessorDataTypeObject: return [UIColor redColor];
        default: return nil;
    }
}

- (void)setValue:(id)value
     forProperty:(NSString *)propertyName
            type:(TOPropertyAccessorDataType)type
{
    // Print out a log to show what data we received from this event
    NSLog(@"TOTestAccessor: Set value '%@' for property '%@'", value, propertyName);
}

@end
