//
//  ProfileViewController.m
//  LifeBlink
//
//  Created by Amr Elsehemy on 3/5/15.
//  Copyright (c) 2015 Inovaton. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIView *blinkView;
@property (weak, nonatomic) IBOutlet UIView *familyView;
@property (weak, nonatomic) IBOutlet UIView *followingView;
@property (weak, nonatomic) IBOutlet UIView *followersView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.blinkView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.blinkView.layer.borderWidth = 0.4;
    self.blinkView.layer.cornerRadius = 4;
    self.blinkView.layer.masksToBounds = NO;
    
    self.familyView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.familyView.layer.borderWidth = 0.4;
    self.familyView.layer.cornerRadius = 4;
    self.familyView.layer.masksToBounds = NO;
    
    self.followingView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.followingView.layer.borderWidth = 0.4;
    self.followingView.layer.cornerRadius = 4;
    self.followingView.layer.masksToBounds = NO;
    
    self.followersView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.followersView.layer.borderWidth = 0.4;
    self.followersView.layer.cornerRadius = 4;
    self.followersView.layer.masksToBounds = NO;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFamily:)];
    [self.familyView addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFollowing:)];
    [self.followingView addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFollowers:)];
    [self.followersView addGestureRecognizer:tap3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapFamily:(id)sender {
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"FamilyViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapFollowing:(id)sender {
    
//    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"FollowingViewController"];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapFollowers:(id)sender {
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"FollowersViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)unwindToProfileViewController:(UIStoryboardSegue *)unwind {
    
}

@end
