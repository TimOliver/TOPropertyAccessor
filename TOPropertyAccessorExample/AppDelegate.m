//
//  AppDelegate.m
//  TOPropertyAccessorExample
//
//  Created by Tim Oliver on 13/5/21.
//

#import "AppDelegate.h"
#import "TOTestAccessor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)testPropertyAccessor
{
    // Make an instance of our test subclass
    TOTestAccessor *test = [[TOTestAccessor alloc] init];

    // Make an NSCache object reference, and test that the same
    // instance is returned (eg, the property is properly retaining as normal)]
    NSCache *testCache = [[NSCache alloc] init];
    test.nonCodingObject = testCache;

    // Try accessing the value of each of the properties in this object.
    // They will be the static values we set in `valueForProperty:`
    NSLog(@"TOTestAccessor: Int %ld", (long)test.integerValue);
    NSLog(@"TOTestAccessor: Float %f", test.floatValue);
    NSLog(@"TOTestAccessor: Double %f", test.doubleValue);
    NSLog(@"TOTestAccessor: Bool %d", test.boolValue);
    NSLog(@"TOTestAccessor: Date %@", test.dateValue);
    NSLog(@"TOTestAccessor: String %@", test.stringValue);
    NSLog(@"TOTestAccessor: Array %@", test.arrayValue);
    NSLog(@"TOTestAccessor: Dictionary %@", test.dictionaryValue);
    NSLog(@"TOTestAccessor: Object %@", test.objectValue);
    NSLog(@"TOTestAccessor: Non-coding %@", test.nonCodingObject);

    NSLog(@"-----------------------------------");

    // Try setting the value on each of our properties.
    // The custom implementation will print out the value we set.
    test.integerValue = 2;
    test.floatValue = 2.0f;
    test.doubleValue = 2.0;
    test.boolValue = @(NO);
    test.dateValue = [NSDate date];
    test.stringValue = @"Hello yourself!";
    test.arrayValue = @[@"Hello", @"Yourself"];
    test.dictionaryValue = @{@"message": @"Hello yourself!"};
    test.objectValue = [UIColor redColor];

    NSLog(@"TOTestAccessor: Non-coding object: %@ %@", testCache, test.nonCodingObject);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[UIViewController alloc] init];
    self.window.rootViewController.view.backgroundColor = [UIColor systemBackgroundColor];
    [self.window makeKeyAndVisible];

    [self testPropertyAccessor];

    return YES;
}

@end
