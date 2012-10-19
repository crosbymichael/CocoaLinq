//
//  PredicateEnumerator.m
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import "PredicateEnumerator.h"

@interface PredicateEnumerator() {
    linq_predicate _predicate;
}

@end

@implementation PredicateEnumerator

- (id) initWithPredicate: (linq_predicate) predicate {
    self = [super init];
    if (self) {
        _predicate = predicate;
    }
    return self;
}

- (NSMutableArray *) filterArrray:(NSArray *)array {
    NSMutableArray * backing = [[NSMutableArray alloc] initWithCapacity:array.count];
    
    for (id obj in array) {
        if (_predicate(obj)) {
            [backing addObject:obj];
        }
    }
    return backing;
}

- (id) nextObject {
    id current = [_enumerator nextObject];
    int result = 0;
    
    while (current != nil && result == 0) {
        _currentCount++;
        if ((result = _predicate(current)) != 0 && _delegate != nil) {
            [_delegate currentObject:current];
        }
    }
    if (_currentCount == _totalCount && _delegate != nil) {
        [_delegate enumerationComplete];
    }
    return current;
}
@end
