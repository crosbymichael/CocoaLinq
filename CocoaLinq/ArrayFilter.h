//
//  ArrayFilter.h
//  CocoaLinq
//
//  Created by Michael Crosby on 3/13/13.
//  Copyright (c) 2013 Michael Crosby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"

@interface ArrayFilter : NSObject

- (id) initWithPredicate: (linq_predicate) predicate;
- (id) initWithSelector: (linq_selector) selctor;

- (NSArray*) filterArray:(NSArray *)array;

@end
