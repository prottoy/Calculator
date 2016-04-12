//
//  NSMutableArray+Stack.m
//  Calculator
//
//  Created by Mahbub Morshed on 4/11/16.
//  Copyright © 2016 Mahbub Morshed. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)


-(void)pushObject:(id)object {
    [self addObject:object];
    
    NSLog(@"%@", self);
}


-(id)pop {
    id lastObject;
    
    if (self.count > 0) {
        lastObject = [self lastObject];
        [self removeObject:lastObject];
    }
    return lastObject;
}


-(id)peek {
    
    id lastObject = [self lastObject];
    return lastObject;
}
@end
