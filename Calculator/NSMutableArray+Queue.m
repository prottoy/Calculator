//
//  NSMutableArray+Queue.m
//  Calculator
//
//  Created by Mahbub Morshed on 4/11/16.
//  Copyright © 2016 Mahbub Morshed. All rights reserved.
//

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)

- (void)enQueue:(id)object {
    [self insertObject:object atIndex:0];
}

- (id)deQueue {
    id result;
    
    if (self.count > 0) {
        result = [self objectAtIndex:0];
        [self removeObjectAtIndex:0];
    }
    return result;
}
@end
