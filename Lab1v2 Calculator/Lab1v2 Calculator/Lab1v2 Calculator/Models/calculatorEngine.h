//
//  calculatorEngine.h
//  Lab1v2 Calculator
//
//  Created by Teddy Stephenson on 2/19/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calculatorEngine : NSObject

@property (nonatomic) double currentTotal;
@property (nonatomic) double operand;
@property (nonatomic) int operatorType;
@property (nonatomic) double memStore;




- (void) clear;

- (void) add:(double)value;
//- (void) subtract:(double)value;







@end
