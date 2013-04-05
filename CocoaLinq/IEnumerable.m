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
    ArrayFilter * _filter;
}

@end

@implementation IEnumerable

- (id) initWithArrayAndFilter:(NSArray *)parent: (ArrayFilter *) filter {
    self = [super init];
    if (self) {
        _filter = filter;
        _parent = parent;
    }
    return self;
}

- (NSArray *) getResults {
    return [_filter filterArray:_parent];
}

- (NSUInteger) count {
    return [self getResults].count;
}

- (id) objectAtIndex:(NSUInteger)index {
    return [[self getResults] objectAtIndex:index];
}

- (id) objectAtIndexedSubscript:(NSUInteger)idx {
    return [[self getResults] objectAtIndexedSubscript:idx];
}

- (void) enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void (^)(id, NSUInteger, BOOL *))block {
    [[self getResults] enumerateObjectsAtIndexes:s options:opts usingBlock:block];
}

- (void) enumerateObjectsUsingBlock:(void (^)(id, NSUInteger, BOOL *))block {
    [[self getResults] enumerateObjectsUsingBlock:block];
}

- (void) enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id, NSUInteger, BOOL *))block {
    [[self getResults] enumerateObjectsWithOptions:opts usingBlock:block];
}

@end
