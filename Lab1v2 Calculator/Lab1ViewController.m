//
//  Lab1ViewController.m
//  Lab1v2 Calculator
//
//  Created by Teddy Stephenson on 2/19/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import "Lab1ViewController.h"
#import "calculatorEngine.h"

@interface Lab1ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mainOutput;
@property (weak, nonatomic) IBOutlet UILabel *runningOutput;
@property (nonatomic) calculatorEngine* cEngine;
- (IBAction)NumberButton:(UIButton *)sender;
- (IBAction)OperatorButton:(UIButton *)sender;
- (IBAction)FunctionButton:(UIButton *)sender;
@end

@implementation Lab1ViewController

- (calculatorEngine *)cEngine {
    
    if (!_cEngine) {
        _cEngine = [[calculatorEngine alloc]init];
    }
    return _cEngine;
}

- (IBAction)NumberButton:(UIButton *)sender {
    
    self.cEngine.continueOp = false;
    NSString* number = [NSString stringWithFormat:@"%d", sender.tag];
    
    if (self.cEngine.resetDisplay == true||[self.mainOutput.text isEqualToString:@"0"] ){
        self.mainOutput.text = @"";
        self.cEngine.resetDisplay = false;
    }
    
    if (self.mainOutput.text.length == 11) {
        return;
    }
    
    self.cEngine.currentDisplayNumber = [self.mainOutput.text stringByAppendingString:number];
    //self.mainOutput.text = [self.mainOutput.text stringByAppendingString:number];
    self.mainOutput.text = self.cEngine.currentDisplayNumber;
}

- (IBAction)OperatorButton:(UIButton *)sender {
    
    UIButton *button = (UIButton *)[self.view viewWithTag:self.cEngine.operatorType];
    button.alpha = 1;
    
    int operation = sender.tag;
    double result;
    
    
    if (self.cEngine.continueOp == true){
        self.cEngine.operatorType = operation;
        sender.alpha = 0.5;
        return;
    }
    
    if (operation == 20) {
        
        if (self.cEngine.finishedCalc == true) {
             result = [self.cEngine doCalc];
        }
        else {
        self.cEngine.rightOperand = [self.mainOutput.text doubleValue];
            result = [self.cEngine doCalc];
        }
        
        self.mainOutput.text = [NSString stringWithFormat:@"%g",result];
        self.cEngine.finishedCalc=true;
        self.cEngine.resetDisplay =true;
        self.cEngine.continueOp = false;
        
    }
    else {

        if (self.cEngine.finishedCalc == false) {

            self.cEngine.rightOperand = [self.mainOutput.text doubleValue];
            double result = [self.cEngine doCalc];
                        self.cEngine.operatorType = operation;
            self.mainOutput.text = [NSString stringWithFormat:@"%g",result];
            self.cEngine.resetDisplay = true;
        }

        else {
            self.cEngine.finishedCalc = false;
            self.cEngine.leftOperand = [self.mainOutput.text doubleValue];
            self.cEngine.operatorType = operation;
            self.cEngine.resetDisplay = true;
            
        }
        self.cEngine.continueOp = true;
        sender.alpha = 0.5;
    }
}

- (IBAction)FunctionButton:(UIButton *)sender {
   
    int operation = sender.tag;
    UIButton *button;
    
    switch (operation) {
    
        case 30: //clear
        [self.cEngine clear];
        self.mainOutput.text = [NSString stringWithFormat:@"0"];
            button = (UIButton *)[self.view viewWithTag:self.cEngine.operatorType];
        button.alpha = 1;
        self.cEngine.finishedCalc = true;
            break;
            
        case 10: //decimal
            
            if (self.cEngine.continueOp == true) {
                self.mainOutput.text = @"0";
            }
            
            if ([self.mainOutput.text rangeOfString:@"."].length >0)
                return;
            else{
                self.mainOutput.text = [self.mainOutput.text stringByAppendingString:@"."];
                self.cEngine.resetDisplay = false;
            }
            break;
        case 11: //plus minus
            
            if ([self.mainOutput.text isEqualToString:@"0"])
                break;
           // self.mainOutput.text = [NSString stringWithFormat:@"%g" , -([self.mainOutput.text doubleValue])];
            self.mainOutput.text = [NSString stringWithFormat:@"%g" , [self.cEngine flipSign:[self.mainOutput.text doubleValue]]];
            break;
        case 31: // 1/x
           
            if ([self.mainOutput.text isEqualToString:@"0"])
                break;
            //self.mainOutput.text = [NSString stringWithFormat:@"%g" , 1/([self.mainOutput.text doubleValue])];
            self.mainOutput.text = [NSString stringWithFormat:@"%g" , [self.cEngine oneOverX:[self.mainOutput.text doubleValue]]];
            break;
        case 32: //sqr
            if ([self.mainOutput.text isEqualToString:@"0"])
                break;
             self.mainOutput.text = [NSString stringWithFormat:@"%g" , [self.cEngine squareRoot:[self.mainOutput.text doubleValue]]];
            break;
        case 33: // mem stor
            self.cEngine.memStore = [self.mainOutput.text doubleValue];
            self.runningOutput.text = [NSString stringWithFormat:@"Memory: %g", self.cEngine.memStore];

            break;
        case 34: //mem recall
            self.cEngine.continueOp = false;
            self.mainOutput.text = [NSString stringWithFormat:@"%g" , self.cEngine.memStore];
            break;
        case 35: //mem clear
            self.runningOutput.text = @"";
            self.cEngine.memStore = 0;
            break;
            
        case 36: //tan
            self.mainOutput.text = [NSString stringWithFormat:@"%g" , [self.cEngine tan:[self.mainOutput.text doubleValue]]];
            break;
            
        case 37: //cos
            self.mainOutput.text = [NSString stringWithFormat:@"%g" , [self.cEngine cos:[self.mainOutput.text doubleValue]]];
            break;
        case 38: //sin
            self.mainOutput.text = [NSString stringWithFormat:@"%g" , [self.cEngine sin:[self.mainOutput.text doubleValue]]];
            break;
    }
    
}


@end
