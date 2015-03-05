//
//  CameraViewController.m
//  LifeBlink
//
//  Created by Ahmed AlMoraly on 3/5/15.
//  Copyright (c) 2015 Inovaton. All rights reserved.
//

#import "CameraViewController.h"
#import "ViewUtils.h"
#import <LLSimpleCamera.h>

@interface CameraViewController ()
@property (weak, nonatomic) IBOutlet UIButton *captureButton;
@property (weak, nonatomic) IBOutlet UIButton *videoButton;
@property (weak, nonatomic) IBOutlet UIButton *libraryButton;

@property (weak, nonatomic) IBOutlet UIButton *flashButton;
@property (weak, nonatomic) IBOutlet UIButton *rotateCameraButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.captureButton.layer.cornerRadius = self.captureButton.width / 2.0f;
    self.captureButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.captureButton.layer.borderWidth = 3.0f;
    self.captureButton.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.captureButton.layer.shouldRasterize = YES;
    
    self.camera.cameraPosition = CameraPositionBack;
    
    // read: http://stackoverflow.com/questions/5427656/ios-uiimagepickercontroller-result-image-orientation-after-upload
    // you probably will want to set this to YES, if you are going view the image outside iOS.
    self.camera.fixOrientationAfterCapture = NO;
    
    // take the required actions on a device change
    __weak typeof(self) weakSelf = self;
    [self.camera setOnDeviceChange:^(LLSimpleCamera *camera, AVCaptureDevice * device) {
        
        NSLog(@"Device changed.");
        
        // device changed, check if flash is available
        if([camera isFlashAvailable]) {
            weakSelf.flashButton.hidden = NO;
        }
        else {
            weakSelf.flashButton.hidden = YES;
        }
        
        weakSelf.flashButton.selected = NO;
    }];
    
    [self.camera setOnError:^(LLSimpleCamera *camera, NSError *error) {
        NSLog(@"Camera error: %@", error);
    }];
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.camera start];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.camera stop];
}

- (LLSimpleCamera *)camera {
    return self.childViewControllers[0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)capture:(UIButton *)sender {
    // capture
    [self.camera capture:^(LLSimpleCamera *camera, UIImage *image, NSDictionary *metadata, NSError *error) {
        if(!error) {
            
            // we should stop the camera, since we don't need it anymore. We will open a new vc.
            // this very important, otherwise you may experience memory crashes
            [camera stop];
        }
    } exactSeenImage:YES];

}
- (IBAction)setFlash:(id)sender {
    if(self.camera.cameraFlash == CameraFlashOff) {
        self.camera.cameraFlash = CameraFlashOn;
        self.flashButton.selected = YES;
    }
    else {
        self.camera.cameraFlash = CameraFlashOff;
        self.flashButton.selected = NO;
    }
}
- (IBAction)rotateCamera:(id)sender {
    [self.camera togglePosition];
}

@end
