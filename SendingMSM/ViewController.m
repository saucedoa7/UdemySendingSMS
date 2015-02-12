//
//  ViewController.m
//  SendingMSM
//
//  Created by Albert Saucedo on 2/5/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//
}

-(int)initWithAnswerA:(int)A AndB:(int)B{
    int c = A - B;
    return c;
}

- (IBAction)btnMessage:(id)sender {

    MFMessageComposeViewController *textComposer = [MFMessageComposeViewController new];

    [textComposer setMessageComposeDelegate:self];

    //    int one = 1;
    //    int two = 2;
    //    NSString *answer = [NSString stringWithFormat:@"%d", [self initWithAnswerA:one AndB:two]];
    //    NSLog(@"%@",answer);

    if ([MFMessageComposeViewController canSendText]) {
        [textComposer setRecipients:[NSArray arrayWithObjects: nil]];

        //        int one = 1;
        //        int two = 2;
        //        [textComposer setBody:[NSString stringWithFormat:@"%d", [self initWithAnswerA:one AndB:two]]];

        [self presentViewController:textComposer animated:YES completion:NULL];
    } else {
        NSLog(@"Text not sent");
    }

}

- (IBAction)btnEmail:(id)sender {

    MFMailComposeViewController *emailComposer = [MFMailComposeViewController new];

    [emailComposer setMailComposeDelegate:self];

    if ([MFMailComposeViewController canSendMail]) {
        [emailComposer setToRecipients:[NSArray arrayWithObjects:@"asaucedo@smartts.com",@"saucedoa7@gmail.com", nil]];
        [emailComposer setSubject:@"Test Subject :)"];
        [emailComposer setMessageBody:@"TEst message body" isHTML:NO];
        [emailComposer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];

        NSData *data = UIImageJPEGRepresentation(self.imgImage.image, 1);
        [emailComposer addAttachmentData:data mimeType:@"Image/jpeg" fileName:@"grey.png"];

        //Present it to the user
        [self presentViewController:emailComposer animated:YES completion:NULL];
    } else {
        NSLog(@"Email not sent");
    }
}

- (IBAction)btnCall:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:1234567890"]];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{

    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Text Cancelled");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Text Failed");
            break;
        case MessageComposeResultSent:
            NSLog(@"Text sent");
        default:
            break;
    }

    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[NSString stringWithFormat:@"Error %@", [error description]]
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

#pragma mark iAd's

-(void)loadBanner{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView commitAnimations];
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    [self loadBanner];
    [banner setAlpha:1];

}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    [self loadBanner];
    [banner setAlpha:0];
    
}
@end
