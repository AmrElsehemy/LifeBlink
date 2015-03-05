//
//  CameraTapViewController.m
//  LifeBlink
//
//  Created by Ahmed AlMoraly on 3/5/15.
//  Copyright (c) 2015 Inovaton. All rights reserved.
//

#import "CameraTapViewController.h"

@interface CameraTapViewController ()

@end

@implementation CameraTapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self performSegueWithIdentifier:@"capture" sender:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindCamera:(UIStoryboardSegue *)sender {
    [self.tabBarController setSelectedIndex:0];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
