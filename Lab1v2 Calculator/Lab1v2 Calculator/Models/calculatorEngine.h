//
//  calculatorEngine.h
//  Lab1v2 Calculator
//
//  Created by Teddy Stephenson on 2/19/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

@interface calculatorEngine : NSObject

@property (nonatomic) NSString* currentDisplayNumber;
@property (nonatomic) double leftOperand;
@property (nonatomic) double rightOperand;
@property (nonatomic) int operatorType;
@property (nonatomic) double memStore;
@property (nonatomic) BOOL finishedCalc;
@property (nonatomic) BOOL resetDisplay;
@property (nonatomic) BOOL continueOp;


- (double) doCalc;
- (void) clear;
- (void) add;
- (void) subtract;
- (void) multiply;
- (void) divide;
- (double) squareRoot:(double) input;
- (double) oneOverX:(double) input;
- (double) flipSign: (double) input;
- (double) tan:(double) input;
- (double) cos:(double) input;
- (double) sin:(double) input;


@end
