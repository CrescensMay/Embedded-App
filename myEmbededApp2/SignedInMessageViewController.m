//
//  SingedInMessageViewController.m
//  myEmbededApp2
//
//  Created by Mac on 02/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "SignedInMessageViewController.h"

@interface SignedInMessageViewController ()

@end

@implementation SignedInMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)TapGoToTomCat:(id)sender {
    
    [self performSegueWithIdentifier:@"goToTomCat" sender:self];
}

@end
