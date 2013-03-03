//
//  calculatorEngine.m
//  Lab1v2 Calculator
//
//  Created by Teddy Stephenson on 2/19/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import "calculatorEngine.h"

@implementation calculatorEngine

- (id) init {
    
    self = [super init];
    if (self) {
        self.currentTotal = 0;
        self.operand = 0;
        self.operatorType = 0;
        self.memStore = 0;
    }
    return self;
}

- (void) clear {
    
}

- (void)add:(double)value {
    
}


@end
