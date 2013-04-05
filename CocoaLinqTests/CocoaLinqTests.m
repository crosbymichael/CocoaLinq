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
    
    for (NSString* item in onlyCs) {
        STAssertTrue([item characterAtIndex:0] == 'C', @"Char at index 0 not equal to C");
    }
    
    STAssertTrue(onlyCs.count == 3, @"Only elments that start with C should contain 3 items");
}

- (void) testSelect {
    NSArray * array = [[NSArray alloc] initWithObjects:
                       @"New York",
                       @"Chicago",
                       @"Indianapolis",
                       @"Center Point",
                       @"Che",
                       nil];

    NSRange range = NSMakeRange(0, 2);
    NSArray * results = [array select:^NSString *(NSString * item){
        return [item substringWithRange:range];
    }];
    
    NSInteger length = 2;
    for (NSString* s in results) {
        STAssertTrue(s.length == length, @"Should only be two chars long %d", s.length);
    }
    
    STAssertTrue(results.count == 5, @"Should only have 5 objects");
}

- (void) testChain {
    NSArray * array = [[NSArray alloc] initWithObjects:
                       @"New York",
                       @"Chicago",
                       @"Indianapolis",
                       [[NSNumber alloc] initWithInt:2],
                       [[NSNumber alloc] initWithInt:66],
                       [[NSNumber alloc] initWithInt:22],
                       nil];
    
    NSArray * strings = [array ofClass:[NSString class]];
    strings = [strings where:^(NSString * item) {
        return [item characterAtIndex:0] == 'C';
    }];
    
    STAssertTrue(strings.count == 1, @"Should only have 5 objects");
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
    
    STAssertTrue(count == 5, @"Should complete 5 iterations");
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
