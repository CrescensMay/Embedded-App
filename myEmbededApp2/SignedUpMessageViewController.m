//
//  SignedUpMessageViewController.m
//  myEmbededApp2
//
//  Created by Mac on 02/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "SignedUpMessageViewController.h"
#import "TomCatViewController.h"

@interface SignedUpMessageViewController ()

@end

@implementation SignedUpMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)viewDidAppear:(BOOL)animated{
//    
//    [super viewDidAppear:animated];
//    TomCatViewController* tomcat = [[TomCatViewController alloc]init];
//    tomcat.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentViewController:tomcat animated:YES completion:nil];
//    
//}
- (IBAction)tapGoToTomCat:(id)sender {
    
    [self performSegueWithIdentifier:@"goToTomCat" sender:self];
}

@end
