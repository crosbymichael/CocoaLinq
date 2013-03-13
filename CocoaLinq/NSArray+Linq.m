//
//  NSArray+Linq.m
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import "NSArray+Linq.h"
#import "ArrayFilter.h"
#import "IEnumerable.h"

@implementation NSArray (Linq)

- (IEnumerable *) _wrapWithPredicate: (linq_predicate) predicate {
    return [[IEnumerable alloc] initWithArrayAndFilter:self :
            [[ArrayFilter alloc] initWithPredicate:predicate]];
}

- (IEnumerable *) _wrapWithSelector: (linq_selector) selector {
    return [[IEnumerable alloc] initWithArrayAndFilter:self :
            [[ArrayFilter alloc] initWithSelector:selector]];}

- (id) first {
    id obj = [self objectAtIndex:0];
    if (obj == nil) {
        [NSException raise:@"First element is nil" format:nil];
    }
    return obj;
}

- (id) last {
    id obj = [self lastObject];
    if (obj == nil) {
        [NSException raise:@"Last element is nil" format:nil];
    }
    return obj;
}

- (id) firstOrDefault:(linq_predicate)predicate {
    for (id item in self) {
        if (predicate(item)) {
            return item;
        }
    }
    return nil;
}

- (id) firstOrDefault {
    return [self objectAtIndex:0];
}

- (id) lastOrDefault {
    return [self lastObject];
}

- (id) lastOrDefault:(linq_predicate)predicate {
    return [[self where:predicate] lastOrDefault];
}

- (BOOL) any {
    return (self.count > 0) ? YES : NO;
}

- (BOOL) any:(linq_predicate)predicate {
    for (id item in self) {
        if (predicate(item)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL) all:(linq_predicate) predicate {
    if (self.count == 0) {
        [NSException raise:@"Unable to determine result" format:nil];
    }
    
    int isTrue = 0;
    BOOL result = YES;
    
    for (id item in self) {
        if ((isTrue = predicate(item)) == 0) {
            result = NO;
            break;
        }
    }
    return result;
}

- (NSArray *) where:(linq_predicate)predicate {
    return [self _wrapWithPredicate:predicate];
}

- (NSArray *) select: (linq_selector) selector {
    return [self _wrapWithSelector:selector];
}

- (void) forEach: (void(^)(id)) action {
    for (id item in self) {
        action(item);
    }
}

- (NSArray *) ofClass: (Class) class {
    return [self where:^(id item){
        return ([item isKindOfClass:class]) ? 1 : 0;
    }];
}


@end
