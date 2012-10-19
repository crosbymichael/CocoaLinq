//
//  IEnumerable.h
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IEnumeratorDelegate.h"
#import "LinqEnumerator.h"
#import "Structs.h"

@interface IEnumerable : NSArray <IEnumeratorDelegate>

- (id) initWithArrayAndEnumerator:(NSArray *)array: (LinqEnumerator *) enumerator;

@end
