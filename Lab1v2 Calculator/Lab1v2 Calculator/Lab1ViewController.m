//
//  Lab1ViewController.m
//  Lab1v2 Calculator
//
//  Created by Teddy Stephenson on 2/19/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import "Lab1ViewController.h"

@interface Lab1ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mainOutput;
@property (weak, nonatomic) IBOutlet UILabel *runningOutput;
- (IBAction)NumberButton:(UIButton *)sender;
- (IBAction)OperatorButton:(UIButton *)sender;
- (IBAction)FunctionButton:(UIButton *)sender;

@end

@implementation Lab1ViewController

- (calculatorEngine *)engine {
    
    
}



- (IBAction)NumberButton:(UIButton *)sender {
    
    NSString* number = [NSString stringWithFormat:@"%d", sender.tag];
    
    if ([self.mainOutput.text isEqual: @"0"]) {
        self.mainOutput.text = @"";
        self.runningOutput.text = @"";
    }
    
    if (self.mainOutput.text.length == 10) {
        number = @"";
    }
    
    self.mainOutput.text = [self.mainOutput.text stringByAppendingString:number];

    self.runningOutput.text = [self.runningOutput.text stringByAppendingString:number];
    
}

- (IBAction)OperatorButton:(UIButton *)sender {
}

- (IBAction)FunctionButton:(UIButton *)sender {
}






@end
