//
//  MyCalculatorViewController.h
//  myEmbededApp2
//
//  Created by Mac on 03/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *calculTextField;
@property (nonatomic)int firstNumber;
@property (nonatomic)int secondNumber;
@property (nonatomic,copy)NSString*
operation;
@property (nonatomic)BOOL isTyping;
@end
