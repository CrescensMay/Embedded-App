//
//  FirstViewController.m
//  myEmbededApp2
//
//  Created by Mac on 02/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView* leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    UIImageView* leftImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 24, 25)];
    [leftImage1 setImage:[UIImage imageNamed:@"pass.png"]];
    self.userPassTextField.leftView = leftImage1;
    self.userPassTextField.leftViewMode = UITextFieldViewModeAlways;
    [leftImage setImage:[UIImage imageNamed:@"user.png"]];
    self.usernameTextField.leftView = leftImage;
    self.usernameTextField.leftViewMode = UITextFieldViewModeAlways;
    
     [_textLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:17]];
    
    self.username = @"crescens";
    self.password = @"crescens";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
- (IBAction)signIn:(id)sender {
    
    BOOL isUserEqual = [self.username isEqualToString:self.usernameTextField.text];
    BOOL isPassEqual = [self.password isEqualToString:self.userPassTextField.text];
    
    BOOL isUserEmpty = [self.usernameTextField.text isEqualToString:@""];
    BOOL isPassEmpty = [self.userPassTextField.text isEqualToString:@""];
    NSString* message = @"Sorry fields cannot remain empty !";
    NSString* title = @"Wrong input";
    if(isUserEqual && isPassEqual){
        
        [self performSegueWithIdentifier:@"goToSignInMessage" sender:self];
    }
    else if(isUserEmpty && isPassEmpty){
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if(isPassEmpty){
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Wrong input" message:@"Password required !" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if(isUserEmpty){
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Wrong input" message:@"Username required !"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if(isUserEqual && isPassEqual){
        
        [self performSegueWithIdentifier:@"goToTomCat" sender:self];
        self.userPassTextField.text = @"";
        self.usernameTextField.text = @"";
    }
    else{
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Wrong input" message:@"Sorry wrong Username or Password !"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
