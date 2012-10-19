//
//  LinqEnumerator.h
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IEnumeratorDelegate.h"

typedef enum {
    pending,
    inprogress,
    complete
} enumeration_state;

@interface LinqEnumerator : NSEnumerator {
    NSEnumerator * _enumerator;
    id<IEnumeratorDelegate> _delegate;
    NSUInteger _totalCount;
    NSUInteger _currentCount;
}

- (void) setDelegate: (id<IEnumeratorDelegate>) delegate;
- (BOOL) hasEnumerator;
- (void) setEnumerator: (NSArray *) array;
- (NSMutableArray *) filterArrray: (NSArray *) array;

@end
