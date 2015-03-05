//
//  EditProfileTableViewController.m
//  LifeBlink
//
//  Created by Ahmed AlMoraly on 3/5/15.
//  Copyright (c) 2015 Inovaton. All rights reserved.
//

#import "EditProfileTableViewController.h"

@interface EditProfileTableViewController ()

@end

@implementation EditProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editImage:(id)sender {
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"Change Profile Picture" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    [sheet addAction:cancel];
    
    UIAlertAction *remove = [UIAlertAction actionWithTitle:@"Remove Current Photo" style:UIAlertActionStyleDestructive handler:nil];
    [sheet addAction:remove];
    
    UIAlertAction *fb = [UIAlertAction actionWithTitle:@"Import from Facebook" style:UIAlertActionStyleDefault handler:nil];
    [sheet addAction:fb];
    
    UIAlertAction *tw = [UIAlertAction actionWithTitle:@"Import from Twitter" style:UIAlertActionStyleDefault handler:nil];
    [sheet addAction:tw];
    
    UIAlertAction *take = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:nil];
    [sheet addAction:take];
    
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"Choose from Library" style:UIAlertActionStyleDefault handler:nil];
    [sheet addAction:album];
    
    
    [self presentViewController:sheet animated:YES completion:nil];

}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
