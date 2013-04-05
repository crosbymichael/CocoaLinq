//
//  IEnumerable.h
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"
#import "ArrayFilter.h"

@interface IEnumerable : NSArray

- (id) initWithArrayAndFilter:(NSArray *)parent: (ArrayFilter *) filter;

@end
