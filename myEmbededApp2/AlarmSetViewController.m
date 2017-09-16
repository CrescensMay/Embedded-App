//
//  AlarmSetViewController.m
//  myEmbededApp2
//
//  Created by Mac on 05/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "AlarmSetViewController.h"

@interface AlarmSetViewController ()<UITextFieldDelegate>

@end

@implementation AlarmSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(_isDetail){
        
        self.eventTextField.text = self.eventContent;
        self.eventTextField.userInteractionEnabled = YES;
        self.dataPicker.userInteractionEnabled = YES;
        self.addEventBtn.alpha = 1;
       
        [self performSelector:@selector(setDatePickerValueWithAnimation) withObject:nil afterDelay:0.5];
    }
    else{
        
    }
    self.addEventBtn.userInteractionEnabled = NO;
    self.dataPicker.minimumDate = [NSDate date];
    [self.dataPicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
//    [self save];
    
    [self.addEventBtn addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setDatePickerValueWithAnimation{
    
    [self.dataPicker setDate:self.eventDate animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if([self.eventTextField.text length] != 0){
        [self.eventTextField resignFirstResponder];
        self.addEventBtn.userInteractionEnabled = YES;
    }
    else{
        
        [self showAlertMessage:@"Event cannot remain empty."];
    }
       [self.view endEditing:YES];
   
}

-(void)datePickerValueChanged{
    
    self.eventDate = self.dataPicker.date;
    NSLog(@"%@",self.eventDate);
}
-(void)save{
    
    if(self.eventDate){
        
        if([self.eventDate compare:[NSDate date]] == NSOrderedSame){
            
            [self showAlertMessage:@"Wrong date, event cannot contain this date."];
        }
        else if([self.eventDate compare:[NSDate date]] == NSOrderedAscending){
            
            [self showAlertMessage:@"Wrong date, event cannot contain this date."];
        }
        else{
            
           [self setNotification];
        }
    }
    else{
        
         [self showAlertMessage:@"Event cannot remain empty."];
    }

}

-(void)setNotification{
    
    NSString* eventContent = self.eventTextField.text;
    NSDateFormatter* format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"HH:mm dd.MMMM.yyyy";
    
    NSString* eventDate = [format stringFromDate:self.eventDate];
    
    NSDictionary* dict = [[NSDictionary alloc]initWithObjectsAndKeys:eventContent,@"eventContent",eventDate,@"eventDate",nil];
    
    UILocalNotification* notification = [[UILocalNotification alloc]init];
    notification.userInfo = dict;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.fireDate = self.eventDate;
    notification.alertBody = eventContent;
    notification.applicationIconBadgeNumber = 1;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NewEvent" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"Saved");
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if([textField isEqual:self.eventTextField]){
        
        if([self.eventTextField.text length] != 0){
       [self.eventTextField resignFirstResponder];
        self.addEventBtn.userInteractionEnabled = YES;
            return YES;
        }
        else{
            
            [self showAlertMessage:@"Event cannot remain empty."];
        }
    }
    return NO;
}

-(void)showAlertMessage:(NSString*)message{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add Event Title" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
