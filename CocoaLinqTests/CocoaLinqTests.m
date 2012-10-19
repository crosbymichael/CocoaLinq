//
//  CocoaLinqTests.m
//  CocoaLinqTests
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import "CocoaLinqTests.h"
#import "NSArray+Linq.h"

@implementation CocoaLinqTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testOfClass {
    NSArray * array = [[NSArray alloc] initWithObjects:
                       @"New York",
                       @"Chicago",
                       @"Indianapolis",
                       [[NSNumber alloc] initWithInt:2],
                       [[NSNumber alloc] initWithInt:66],
                       [[NSNumber alloc] initWithInt:22],
                       nil];
    
    NSArray * strings = [array ofClass:[NSString class]];
    
    STAssertTrue(strings.count == 3, @"Strings array should contain 3 items");
}

- (void) testWhere {
    NSArray * array = [[NSArray alloc] initWithObjects:
                       @"New York",
                       @"Chicago",
                       @"Indianapolis",
                       @"Center Point",
                       @"Che",
                       nil];
    
    NSArray * onlyCs = [array where:^(NSString * item) {
        return [item characterAtIndex:0] == 'C';
    }];
    
    STAssertTrue(onlyCs.count == 3, @"Only elments that start with C should contain 3 items");
}

- (void) testSelect {
    
}

- (void) testForEach {
    __block int count = 0;
    
    NSArray * array = [[NSArray alloc] initWithObjects:
                       @"New York",
                       @"Chicago",
                       @"Indianapolis",
                       @"Center Point",
                       @"Che",
                       nil];
    
    [array forEach:^(NSString* item) {
        count++;
    }];
    
    STAssertTrue(count == 5, @"Should complete 5 itterations");
}

- (void) testFirst {
    NSArray * array = [[NSArray alloc] initWithObjects:
                       @"New York",
                       @"Chicago",
                       @"Indianapolis",
                       @"Center Point",
                       @"Che",
                       nil];
    
    NSString * firstItem = [array first];
    STAssertTrue([firstItem isEqualToString:@"New York"], @"First element not equal to New York");
}

@end