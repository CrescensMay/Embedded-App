//
//  FirstViewController.h
//  myEmbededApp2
//
//  Created by Mac on 02/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPassTextField;
@property (strong,nonatomic)NSString* username;
@property (strong,nonatomic)NSString* password;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

