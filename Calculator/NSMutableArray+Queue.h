//
//  NSMutableArray+Queue.h
//  Calculator
//
//  Created by Mahbub Morshed on 4/11/16.
//  Copyright © 2016 Mahbub Morshed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)

- (void)enQueue:(id)object;

- (id)deQueue;

@end
