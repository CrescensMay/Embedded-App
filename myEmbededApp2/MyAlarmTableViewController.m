//
//  MyAlarmTableViewController.m
//  myEmbededApp2
//
//  Created by Mac on 05/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "MyAlarmTableViewController.h"
#import "AlarmSetViewController.h"

@interface MyAlarmTableViewController ()

@end

@implementation MyAlarmTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* array = [[UIApplication sharedApplication]scheduledLocalNotifications];
    self.events = [[NSMutableArray alloc]initWithArray:array];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadTableViewWhenNewEvent) name:@"NewEvent" object:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(setAlarm:)];
    
}

-(void) dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)reloadTableViewWhenNewEvent{
    
    [self.events removeAllObjects];
    NSArray* array = [[UIApplication sharedApplication]scheduledLocalNotifications];
    self.events = [[NSMutableArray alloc]initWithArray:array];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setAlarm:(UIBarButtonItem*)sender{
    
    [self performSegueWithIdentifier:@"goToDatePicker" sender:self];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.events.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* identifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    UILocalNotification* notification = [self.events objectAtIndex:indexPath.row];
    
    NSDictionary* dict = notification.userInfo;
    
    cell.textLabel.text = [dict objectForKey:@"eventContent"];
    cell.detailTextLabel.text = [dict objectForKey:@"eventDate"];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UILocalNotification* notification = [self.events objectAtIndex:indexPath.row];
    
    NSDictionary* dict = notification.userInfo;
    AlarmSetViewController* detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    
    detailView.eventContent = [dict objectForKey:@"eventContent"];
    detailView.eventDate = notification.fireDate;
    detailView.isDetail = YES;

    [self.navigationController pushViewController:detailView animated:YES];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
          UILocalNotification* notification = [self.events objectAtIndex:indexPath.row];
        
        [[UIApplication sharedApplication]cancelLocalNotification:notification];
        [self.events removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
