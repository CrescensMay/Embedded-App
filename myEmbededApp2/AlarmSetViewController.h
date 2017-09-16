//
//  AlarmSetViewController.h
//  myEmbededApp2
//
//  Created by Mac on 05/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmSetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *eventTextField;

@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;
@property (strong, nonatomic) IBOutlet UIButton *addEventBtn;

@property (weak, nonatomic) NSDate* eventDate;
@property (strong,nonatomic) NSString* eventContent;
@property (nonatomic,assign)BOOL isDetail;

@end
