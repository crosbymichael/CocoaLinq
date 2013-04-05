//
//  ArrayFilter.m
//  CocoaLinq
//
//  Created by Michael Crosby on 3/13/13.
//  Copyright (c) 2013 Michael Crosby. All rights reserved.
//

#import "ArrayFilter.h"

@interface ArrayFilter() {
    linq_predicate _predicate;
    linq_selector _selector;
}

@end

@implementation ArrayFilter

- (id) initWithPredicate: (linq_predicate) predicate {
    self = [super init];
    if (self) {
        _predicate = predicate;
    }
    return self;
}

- (id) initWithSelector:(linq_selector)selctor {
    self = [super init];
    if (self) {
        _selector = selctor;
    }
    return self;
}

- (NSArray *) filterArray:(NSArray *)array {
    NSMutableArray * backing = [[NSMutableArray alloc] initWithCapacity:array.count];
    id result = nil;
    for (id obj in array) {
        if ((result = [self getObjectToAdd:obj]) != nil) {
            [backing addObject:obj];
        }
    }
    return backing;
}

- (id) getObjectToAdd:(id) obj {
    if (_predicate != nil) {
        if (_predicate(obj)) {
            return obj;
        }
    }
    else if (_selector != nil) {
        id selection = nil;
        if ((selection = _selector(obj))!= nil) {
            return selection;
        }
    }
    else {
        [NSException raise:@"No predicate or selector" format:nil];
    }
    return nil;
}

@end
