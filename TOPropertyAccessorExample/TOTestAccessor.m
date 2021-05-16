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
{
    if (type == TOPropertyAccessorDataTypeInt) {
        return @(9001);
    }

    return (NSString *)@"Hello World!";
}

- (void)setValue:(id)value
     forProperty:(NSString *)propertyName
            type:(TOPropertyAccessorDataType)type
{
    NSLog(@"Tried to set value '%@' for property '%@'", value, propertyName);
}

@end
