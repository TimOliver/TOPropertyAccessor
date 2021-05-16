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
    // Make a test subclass object
    TOTestAccessor *test = [[TOTestAccessor alloc] init];

    // Set a value (These won't be saved, but they'll be printed to console)
    test.string = @"Test";
    test.integer = 1;

    // Try getting the values
    NSLog(@"Provided integer was %ld", (long)test.integer);
    NSLog(@"Provided string was %@", test.string);
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
