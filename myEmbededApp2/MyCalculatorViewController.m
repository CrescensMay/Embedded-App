//
//  MyCalculatorViewController.m
//  myEmbededApp2
//
//  Created by Mac on 03/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "MyCalculatorViewController.h"

@interface MyCalculatorViewController ()

@end

@implementation MyCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      self.calculTextField.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)Reset:(UIButton *)sender {
    
    if([sender.currentTitle isEqualToString:@"AC"]){
        
        self.calculTextField.text = @"0";
    }
    else if([sender.currentTitle isEqualToString:@"."]){
        if(0 == [_calculTextField.text rangeOfString:@"."].length){
            _calculTextField.text = [_calculTextField.text stringByAppendingString:@"."];
        }
    }
}
- (IBAction)numberTapped:(UIButton*)sender {
    
    NSString* number = sender.currentTitle;
    
    if(_isTyping){
        
        self.calculTextField.text = [self.calculTextField.text stringByAppendingString:number];
    }
    else{
        
        self.calculTextField.text = number;
        _isTyping = YES;
    }
    
}
- (IBAction)CalculationPressed:(UIButton *)sender {
    
    _isTyping = NO;
    _firstNumber = [_calculTextField.text intValue];
    _operation = [sender currentTitle];
}
- (IBAction)EqualTapped:(UIButton *)sender {
    
    
    _isTyping = NO;
    _secondNumber = [_calculTextField.text intValue];
    
        int result = 0;
    
        if ([_operation isEqualToString:@"+"])
        {
            result = _firstNumber + _secondNumber;
        }
        else if ([_operation isEqualToString:@"-"])
        {
            result = _firstNumber - _secondNumber;
        }
        else if ([_operation isEqualToString:@"/"])
        {
            result = _firstNumber / _secondNumber;
        }
        else if ([_operation isEqualToString:@"x"])
        {
            result = _firstNumber * _secondNumber;
        }
        else if ([_operation isEqualToString:@"%"])
        {
            result = _firstNumber % _secondNumber;
        }
        
        self.calculTextField.text = [NSString stringWithFormat:@"%d", result];
}
@end
