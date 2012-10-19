//
//  IEnumerable.m
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import "IEnumerable.h"

@interface IEnumerable() {
    NSArray * _parent;
    LinqEnumerator * _enumerator;
    NSMutableArray * _cache;
    enumeration_state _state;
}

@end

@implementation IEnumerable

- (void) _populateCache {
    if (_state != complete || _state != inprogress) {
        _state = inprogress;
        _cache = [_enumerator filterArrray:_parent];
        _state = complete;
    }
}

- (id) initWithArrayAndEnumerator:(NSArray *)array: (LinqEnumerator *) enumerator {
    self = [super init];
    if (self) {
        _enumerator = enumerator;
        [_enumerator setDelegate:self];
        _parent = array;
        _state = pending;
    }
    return self;
}

- (void) currentObject:(id)obj {
    if (_state == inprogress) {
        [_cache addObject:obj];
    }
}

- (void) enumerationComplete {
    _state = complete;
}

- (NSUInteger) count {
    if (_state != complete) {
        [self _populateCache];
    }
    return _cache.count;
}

- (id) objectAtIndex:(NSUInteger)index {
    if (_state != complete) {
        [self _populateCache];
    }
    return [_cache objectAtIndex:index];
}

- (NSEnumerator*) objectEnumerator {
    NSEnumerator * enumerator = nil;
    if (_state == complete) {
        enumerator = [_cache objectEnumerator];
    } else {
        if (![_enumerator hasEnumerator]) {
            [_enumerator setEnumerator:_parent];
        }
        _state = inprogress;
        
        // Initalize the cache so that it is ready to be populated
        _cache = [[NSMutableArray alloc] initWithCapacity:_parent.count];
        enumerator = _enumerator;
    }
    return  enumerator;
}

@end
