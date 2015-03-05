//
//  ViewController.m
//  LifeBlink
//
//  Created by Amr Elsehemy on 3/4/15.
//  Copyright (c) 2015 Inovaton. All rights reserved.
//

#import "ViewController.h"
#import <JVFloatLabeledTextField.h>

const static CGFloat kJVFieldHeight = 44.0f;
const static CGFloat kJVFieldHMargin = 10.0f;
const static CGFloat kJVFieldFontSize = 16.0f;
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *signInView;
@property (weak, nonatomic) IBOutlet UIView *signUpView;
@property (nonatomic) CGFloat topOffset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.topOffset = 0;
    
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    [self.view setTintColor:[UIColor blueColor]];
    
    self.topOffset = ([[UIApplication sharedApplication] statusBarFrame].size.height
                 + self.navigationController.navigationBar.frame.size.height);
#endif

    
    
    [self setupSignInView];
    [self setupSignUpView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUp:(id)sender {
    
//    if(self.signUpView.alpha == 0)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.signUpView.alpha = 1.0;
            self.signInView.alpha = 0.0;
        }];
    }
}
- (IBAction)signIn:(id)sender {
//    if(!self.signInView.alpha)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.signUpView.alpha = 0.0;
            self.signInView.alpha = 1.0;
        }];
    }
}


- (void) setupSignInView{
    UIColor *floatingLabelColor = [UIColor brownColor];
    
    JVFloatLabeledTextField *usernameField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                           CGRectMake(20+kJVFieldHMargin,
                                                      self.topOffset-20,
                                                      200,
                                                      kJVFieldHeight)];
    usernameField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Username", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    usernameField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    usernameField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    usernameField.floatingLabelTextColor = floatingLabelColor;
    usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.signInView addSubview:usernameField];
    
    JVFloatLabeledTextField *passwordField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                              CGRectMake(20+kJVFieldHMargin,
                                                         self.topOffset + kJVFieldHeight -20,
                                                         200,
                                                         kJVFieldHeight)];
    passwordField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Password", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    passwordField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    passwordField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    passwordField.floatingLabelTextColor = floatingLabelColor;
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordField.secureTextEntry = YES;
    [self.signInView addSubview:passwordField];
    
    
}

- (void) setupSignUpView {
    UIColor *floatingLabelColor = [UIColor brownColor];
    
    JVFloatLabeledTextField *emailField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                           CGRectMake(80+ kJVFieldHMargin,
                                                      self.topOffset - 20,
                                                      200,
                                                      kJVFieldHeight)];
    emailField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Email", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    emailField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    emailField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    emailField.floatingLabelTextColor = floatingLabelColor;
    emailField.clearButtonMode = UITextFieldViewModeWhileEditing;;

    [self.signUpView addSubview:emailField];
}


@end
