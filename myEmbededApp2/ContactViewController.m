//
//  ContactViewController.m
//  myEmbededApp2
//
//  Created by Mac on 03/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.items = @[@{@"name":@"take out the trash",@"Category":@"Home"}].mutableCopy;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString* identifier = @"myCells";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"myCells" forIndexPath:indexPath];
  
    NSDictionary* item = self.items[indexPath.row];
    
    cell.textLabel.text = item[@"name"];
    
    return cell;
}


@end
