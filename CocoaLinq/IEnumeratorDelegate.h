//
//  IEnumeratorDelegate.h
//  CocoaLinq
//
//  Created by Michael Crosby on 10/19/12.
//  Copyright (c) 2012 Michael Crosby. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IEnumeratorDelegate <NSObject>

- (void) currentObject: (id) obj;
- (void) enumerationComplete;

@end
