//
//  RPNCalc.m
//  calc
//
//  Created by Mahbub Morshed on 4/12/16.
//  Copyright © 2016 Mahbub Morshed. All rights reserved.
//


/*
 * This is an example implementation of shunting yard algorithm using objective-c
 * http://www.reedbeta.com/blog/2011/12/11/the-shunting-yard-algorithm/
 */

#import "RPNCalc.h"
#import "NSMutableArray+Queue.h"
#import "NSMutableArray+Stack.m"

@implementation RPNCalc

-(void)initialize{
    result = 0;

    outputQueue = [[NSMutableArray alloc] init];
    operatorStack = [[NSMutableArray alloc] init];
}


/*
 * Set the operator precedence
 */
- (void)setPrecedence {
    precedence = @{@"+": @1,
                   @"-": @1,
                   @"x": @2,
                   @"/": @2,
                   @"%": @2};
}


/*
 *  Take the required operand(s) off the stack, apply the operator to them, and return the result
 */
-(void)applyoperator{
    NSString *opr= [operatorStack pop];

    int y = [[outputQueue deQueue] intValue];
    int x = [[outputQueue deQueue] intValue];


    int opResult;

    if ([opr isEqualToString:@"+"]) {

        opResult = x + y;
    }else if ([opr isEqualToString:@"-"]) {

        opResult = x - y;
    }else if ([opr isEqualToString:@"x"]) {

        opResult = x * y;
    }else if ([opr isEqualToString:@"/"]) {

        opResult = x / y;
    }else if ([opr isEqualToString:@"%"]) {

        opResult = x % y;
    }


    [outputQueue enQueue: [NSNumber numberWithInt:opResult]];
}


-(int)calculate:(NSMutableArray *)args{

    [self initialize];
    [self setPrecedence];


    for (NSString *arg in args) {
        if ([arg isEqualToString:@"+"] || [arg isEqualToString:@"-"] || [arg isEqualToString:@"x"] || [arg isEqualToString:@"/"] || [arg isEqualToString:@"%"]) {
            /*While there’s an operator on top of the operator stack of precedence higher than or equal to that of 
             the operator we’re currently processing, pop it off and apply it. (That is, pop the required operand(s)
             off the stack, apply the operator to them, and push the result back on the operand stack.)

             Then, push the current operator on the operator stack
             */
            if ([precedence objectForKey:arg] > [precedence objectForKey:[operatorStack lastObject]]) {
                [operatorStack pushObject:arg];
            }else{

                [self applyoperator];
                [operatorStack pushObject:arg];
            }
        }else {

            [outputQueue enQueue: [NSNumber numberWithInt:[arg intValue]]];
        }
    }
    /*
     When we get to the end of the formula, apply any operators remaining on the stack, 
     from the top down. Then the result is the only item left on the operand stack (assuming well-formed input).
     */
    while (operatorStack.count > 0) {
        [self applyoperator];
    }

    return [[outputQueue deQueue] intValue];
}

@end
