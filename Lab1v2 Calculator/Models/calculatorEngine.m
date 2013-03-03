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
        _leftOperand = 0;
        _rightOperand = 0;
        //_operatorType = 0;
        _memStore = 0;
        _finishedCalc = true;
        _resetDisplay = true;
        _continueOp = false;
        _currentDisplayNumber = @"";
    }
    return self;
}

- (double) doCalc {
    
    
    
    switch (self.operatorType) {
        case 21:
            [self add];
            break;
        case 22:
            [self subtract];
            break;
        case 23:
            [self multiply];
            break;
        case 24:
            [self divide];
            break;
            
        default:
            break;
    }
    
    
   
    
    return self.leftOperand;
}

- (void) clear {
    self.leftOperand = 0;
    self.rightOperand = 0;
    self.currentDisplayNumber = @"";
    
}

- (void) add {
    self.leftOperand = self.leftOperand + self.rightOperand;
}

- (void) subtract {
    self.leftOperand = self.leftOperand - self.rightOperand;
}

- (void) multiply {
    self.leftOperand = self.leftOperand * self.rightOperand;
}

- (void) divide {
    self.leftOperand = self.leftOperand / self.rightOperand;
}

- (double) squareRoot:(double)input {
    
    return sqrt(input);
    
}

- (double) oneOverX:(double)input {
    
    return 1/input;
    
}

- (double) flipSign:(double)input {
    
    return -(input);
}
- (double) tan:(double) input {
    
    return tan(input);
}
- (double) cos:(double) input {
    
    return cos(input);
}
- (double) sin:(double) input {
    
    return sin(input);
}

@end
