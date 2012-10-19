//
//  SelectorEnumerator.h
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import "LinqEnumerator.h"
#import "Structs.h"

@interface SelectorEnumerator : LinqEnumerator

- (id) initWithSelector: (linq_selector) selector;

@end
