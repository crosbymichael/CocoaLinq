//
//  NSArray+Linq.h
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"

@interface NSArray (Linq)

- (id) first;
- (id) last;

- (id) firstOrDefault: (linq_predicate) predicate;
- (id) firstOrDefault;

- (id) lastOrDefault;
- (id) lastOrDefault: (linq_predicate) predicate;

- (BOOL) any;
- (BOOL) any:(linq_predicate) predicate;
- (BOOL) all:(linq_predicate) predicate;

- (NSArray *) ofClass: (Class) class;
- (NSArray *) where: (linq_predicate) predicate;
- (NSArray *) select: (linq_selector) selector;
- (NSArray *) skip: (linq_selector) selector;

- (void) forEach: (void(^)(id)) action;

@end
