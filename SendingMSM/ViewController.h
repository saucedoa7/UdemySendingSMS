//
//  ViewController.h
//  SendingMSM
//
//  Created by Albert Saucedo on 2/5/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate, ADBannerViewDelegate>{
}

@property (weak, nonatomic) IBOutlet UIImageView *imgImage;
- (IBAction)btnMessage:(id)sender;
- (IBAction)btnEmail:(id)sender;
- (IBAction)btnCall:(id)sender;

@end

