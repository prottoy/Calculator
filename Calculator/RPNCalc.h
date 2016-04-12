//
//  RPNCalc.h
//  calc
//
//  Created by Mahbub Morshed on 4/12/16.
//  Copyright © 2016 Mahbub Morshed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPNCalc : NSObject{
    int result;
    
    NSMutableArray *outputQueue;
    NSMutableArray *operatorStack;
    
    NSDictionary *precedence;
}

-(int)calculate:(NSMutableArray *)args;
@end
