//
//  TOPropertyAccessorTests.m
//  TOPropertyAccessorTests
//
//  Created by Tim Oliver on 19/5/21.
//

#import <XCTest/XCTest.h>
#import "TOTestAccessor.h"

@interface TOPropertyAccessorTests : XCTestCase

@end

@implementation TOPropertyAccessorTests

// Test the hardcoded values we set in the test accessor properly return here
- (void)testGettingData {
    TOTestAccessor *test = [[TOTestAccessor alloc] init];

    XCTAssertEqual(test.integerValue, 1);
    XCTAssertEqual(test.floatValue, 1.1);
    XCTAssertEqual(test.doubleValue, 1.1);
    XCTAssertEqual(test.boolValue, YES);
    XCTAssertEqual(test.dateValue, [NSDate dateWithTimeIntervalSince1970:0]);
    XCTAssertEqual(test.stringValue, @"Hello world!");
    XCTAssertTrue([test.dataValue isEqual:([@"Data" dataUsingEncoding:NSUTF8StringEncoding])]);
    XCTAssertTrue([test.arrayValue isEqual:(@[@"Hello", @"World"])]);
    XCTAssertTrue([test.dictionaryValue isEqual:(@{@"Greeting": @"Hello World"})]);
    XCTAssertEqual(test.objectValue, [UIColor redColor]);
}

// There's not a lot to test the data; mainly make sure it doesn't crash
- (void)testSettingData {
    TOTestAccessor *test = [[TOTestAccessor alloc] init];
    test.integerValue = 2;
    test.floatValue = 2.0f;
    test.doubleValue = 2.0;
    test.boolValue = @(NO);
    test.dateValue = [NSDate date];
    test.stringValue = @"Hello yourself!";
    test.arrayValue = @[@"Hello", @"Yourself"];
    test.dictionaryValue = @{@"message": @"Hello yourself!"};
    test.objectValue = [UIColor redColor];
}

@end
