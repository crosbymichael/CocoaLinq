//
//  SelectorEnumerator.m
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import "SelectorEnumerator.h"

@interface SelectorEnumerator() {
    linq_selector _selector;
}

@end

@implementation SelectorEnumerator

- (id) initWithSelector: (linq_selector) selector {
    self = [super init];
    if (self) {
        _selector = selector;
    }
    return self;
}

- (NSMutableArray *) filterArrray:(NSArray *)array {
    NSMutableArray * backing = [[NSMutableArray alloc] initWithCapacity:array.count];
    id selection = nil;
    for (id obj in array) {
        if ((selection = _selector(obj)) != nil) {
            [backing addObject:selection];
        }
    }
    return backing;
}

- (id) nextObject {
    id current = [_enumerator nextObject];
    id selection = nil;
    
    if (!current) {
        return current;
    }
    
    while (selection == nil) {
        _currentCount++;
        if ((selection = _selector(current)) != nil && _delegate != nil) {
            [_delegate currentObject:selection];
        }
    }
    if (_currentCount == _totalCount && _delegate != nil) {
        [_delegate enumerationComplete];
    }
    return selection;
}

@end
