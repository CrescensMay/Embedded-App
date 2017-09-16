//
//  TomCatViewController.h
//  myEmbededApp2
//
//  Created by Mac on 02/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TomCatViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *tomCat;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UILabel *playTextLabel;

@end
