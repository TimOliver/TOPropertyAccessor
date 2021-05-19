//
//  TOTestAccessor.h
//  TOPropertyAccessorExample
//
//  Created by Tim Oliver on 16/5/21.
//

#import "TOPropertyAccessor.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Make a subclass of TOPropertyAccessor and provide
// a property of each type we support.

@interface TOTestAccessor : TOPropertyAccessor

@property (nonatomic, assign) NSInteger integerValue;
@property (nonatomic, assign) CGFloat floatValue;
@property (nonatomic, assign) double doubleValue;
@property (nonatomic, assign) BOOL boolValue;
@property (nonatomic, strong) NSDate *dateValue;
@property (nonatomic, copy) NSString *stringValue;
@property (nonatomic, strong) NSData *dataValue;
@property (nonatomic, strong) NSArray *arrayValue;
@property (nonatomic, strong) NSDictionary *dictionaryValue;
@property (nonatomic, strong) UIColor *objectValue;

// NSCache doesn't conform to NSCoding, so it will be ignored
@property (nonatomic, strong) NSCache *nonCodingObject;

@end

NS_ASSUME_NONNULL_END
