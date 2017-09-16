//
//  SecondViewController.m
//  myEmbededApp2
//
//  Created by Mac on 02/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView* leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    UIImageView* leftImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 24, 25)];
    [leftImage1 setImage:[UIImage imageNamed:@"pass.png"]];
    self.userPassTextField.leftView = leftImage1;
    self.userPassTextField.leftViewMode = UITextFieldViewModeAlways;
    [leftImage setImage:[UIImage imageNamed:@"user.png"]];
    self.userTextField.leftView = leftImage;
    self.userTextField.leftViewMode = UITextFieldViewModeAlways;
    [_textLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:17]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SignUp:(id)sender {
    
    [self performSegueWithIdentifier:@"goToSingnUpMessage" sender:self];
}


@end
