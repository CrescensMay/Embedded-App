//
//  TomCatViewController.m
//  myEmbededApp2
//
//  Created by Mac on 02/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "TomCatViewController.h"

@interface TomCatViewController ()

@end

@implementation TomCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Cymbal:(id)sender {
    
//    _statusLabel.backgroundColor = random;
//    _statusLabel.text = @"Wake up!";
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 13; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"cymbal_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
}
- (IBAction)Drink:(id)sender {
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 81; i++) {
        NSString* imgName = [NSString stringWithFormat:@"drink_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
        
    }
}
- (IBAction)Eat:(id)sender {
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 40; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"eat_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }

}

- (IBAction)Fart:(id)sender {
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 28; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"fart_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }

}

- (IBAction)Pie:(id)sender {
    
    NSMutableArray* array = [NSMutableArray array];

    for (int i = 0; i < 24; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"pie_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }

}
- (IBAction)PlayAll:(id)sender {
    
    
//    self.tabBar.backgroundColor = [UIColor orangeColor];
    self.playButton.backgroundColor = [UIColor yellowColor];
    self.playTextLabel.backgroundColor = [UIColor greenColor];
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 13; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"cymbal_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
    for (int i = 0; i < 81; i++) {
        NSString* imgName = [NSString stringWithFormat:@"drink_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
        
    }
    for (int i = 0; i < 40; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"eat_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
    for (int i = 0; i < 28; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"fart_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }

        for (int i = 0; i < 24; i++) {
            
            NSString* imgName = [NSString stringWithFormat:@"pie_%02d.jpg",i];
            
            UIImage* img = [UIImage imageNamed:imgName];
            [array addObject:img];
            _tomCat.animationImages = array;
            _tomCat.animationRepeatCount = 1;
            _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
            [_tomCat startAnimating];
        }
    
    for (int i = 0; i < 56; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"scratch_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
    for (int i = 0; i < 34; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"stomach_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
    
    for (int i = 0; i < 34; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"stomach_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
    
    for (int i = 0; i < 81; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"knockout_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
    
//    for (int i = 0; i < 81; i++) {
//        
//        NSString* imgName = [NSString stringWithFormat:@"knockout_%02d.jpg",i];
//        
//        UIImage* img = [UIImage imageNamed:imgName];
//        [array addObject:img];
//        _tomCat.animationImages = array;
//        _tomCat.animationRepeatCount = 1;
//        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
//        [_tomCat startAnimating];
//    }
    



    
}
- (IBAction)Scratch:(UIButton *)sender {
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 56; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"scratch_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
}

- (IBAction)Stomach:(UIButton *)sender {
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 34; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"stomach_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }

}
- (IBAction)KnockOut:(UIButton *)sender {
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 81; i++) {
        
        NSString* imgName = [NSString stringWithFormat:@"knockout_%02d.jpg",i];
        
        UIImage* img = [UIImage imageNamed:imgName];
        [array addObject:img];
        _tomCat.animationImages = array;
        _tomCat.animationRepeatCount = 1;
        _tomCat.animationDuration = _tomCat.animationImages.count * 0.1;
        [_tomCat startAnimating];
    }
}

- (IBAction)GoToHome:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"goToHome" sender:self];
}

@end
