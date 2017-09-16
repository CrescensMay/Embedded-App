//
//  MyToDoTableViewController.m
//  myEmbededApp2
//
//  Created by Mac on 03/07/2017.
//  Copyright © 2017 TechGuide. All rights reserved.
//

#import "MyToDoTableViewController.h"

@interface MyToDoTableViewController ()<UIAlertViewDelegate>

@end

@implementation MyToDoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.items = @[@{@"name":@"Take out the trash",@"Category":@"Home"},@{@"name":@"Mom's birthday",@"Category":@"Home"},@{@"name":@"Brother's birthday",@"Category":@"Home"},@{@"name":@"Reply to a very important email",@"Category":@"Work"}].mutableCopy;
    self.categories = @[@"Home",@"Work"];
    
    self.navigationItem.title =@"My To-Do List";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEdit:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addNewItem:(UIBarButtonItem*)sender{
    
    
    
       UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"New to-do item" message:@"Please enter the name of the to-item" preferredStyle:UIAlertControllerStyleAlert];
        
    UIAlertAction* add = [UIAlertAction actionWithTitle:@"Add item" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        
        NSString* item = alert.textFields.firstObject.text;
         NSDictionary* items = @{@"name":item,@"Category":@"Home"};
        
        [self.items addObject:items];
        NSInteger numberHomeItems = [self numberOfItemsInCategory:@"Home"];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:numberHomeItems-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    }];
    [alert addTextFieldWithConfigurationHandler:nil];
 
        [alert addAction:add];
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)toggleEdit:(UIBarButtonItem*)sender{
    
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    if(self.tableView.editing){
        
        sender.title = @"Done";
        sender.style = UIBarButtonItemStyleDone;
        
    }else{
        
        sender.title = @"Edit";
        sender.style = UIBarButtonItemStylePlain;
    }
}
-(NSArray*)itemsInCategory:(NSString*)targetCategory{
    
    NSPredicate* matchpredicate = [NSPredicate predicateWithFormat:@"Category == %@",targetCategory];
    NSArray* categoryItems = [self.items filteredArrayUsingPredicate:matchpredicate];
    
    return categoryItems;
}

-(NSInteger)numberOfItemsInCategory:(NSString*)targetCategory{
    
    return [self itemsInCategory:targetCategory].count;
}

-(NSDictionary*)itemAtIndexPath:(NSIndexPath*)indexPath{
    
    NSString* category = self.categories[indexPath.section];
    NSArray *categoriesItems = [self itemsInCategory:category];
    NSDictionary* item = categoriesItems[indexPath.row];
    
    return item;
}

-(NSInteger)itemIndexForIndexPath:(NSIndexPath*)indexPath{
    
    NSDictionary* item = [self itemAtIndexPath:indexPath];
    NSInteger index = [self.items indexOfObjectIdenticalTo:item];
    
    return index;
}

-(void)removeItemAtIndexPath:(NSIndexPath*)indexPath{
    
    NSInteger index = [self itemIndexForIndexPath:indexPath];
    [self.items removeObjectAtIndex:index];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        [self removeItemAtIndexPath:indexPath];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.categories.count;
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self numberOfItemsInCategory:self.categories[section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"myCells";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary* item = [self itemAtIndexPath:indexPath];
    cell.textLabel.text = item[@"name"];

    if([item[@"completed"] boolValue]){
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger index = [self itemIndexForIndexPath:indexPath];
    NSMutableDictionary* item = [self.items[index]mutableCopy];
    BOOL completed = [item[@"completed"] boolValue];
    item[@"completed"] = @(!completed);
    
    self.items[index] = item;
    
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = ([item[@("completed")]boolValue])? UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.categories[section];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
