//
//  main.m
//  Calculator
//
//  Created by Mahbub Morshed on 4/11/16.
//  Copyright © 2016 Mahbub Morshed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPNCalc.h"

int main(int argc, const char **argv) {
    @autoreleasepool {
        NSMutableArray *args = [NSMutableArray new];
        
        for (int i = 1; i < argc; i++){
            [args addObject:@(argv[i])];
        }
        
        RPNCalc *calc = [[RPNCalc alloc]init];
        NSLog(@"%d", [calc calculate:args]);
    }
    return 0;
}