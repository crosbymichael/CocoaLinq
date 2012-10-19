//
//  LinqEnumerator.m
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import "LinqEnumerator.h"

@implementation LinqEnumerator

- (BOOL) hasEnumerator {
    return _enumerator != nil;
}

- (NSMutableArray *) filterArrray:(NSArray *)array {
    [NSException raise:@"Not supported" format:nil];
}

- (void) setDelegate: (id<IEnumeratorDelegate>) delegate {
    _delegate = delegate;
}

- (void) setEnumerator: (NSArray *) array {
    if (!array) {
        [NSException raise:@"Parent enumerator cannot be nil" format:nil];
    }
    _totalCount = array.count;
    _enumerator = [array objectEnumerator];
}

@end
