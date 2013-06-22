//
//  KitchenViewController.m
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-6-22.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "KitchenViewController.h"
#import "RTextComposerViewController.h"

@interface KitchenViewController ()

//@property (nonatomic, retain) RTextComposerViewController *composerVC;

@end

@implementation KitchenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (IBAction)showModalVC:(id)sender {
    
}

- (IBAction)showComposerVC:(id)sender {
    [RTextComposerViewController showWithTitle:@"Text Composer" ForViewController:self];
}


@end
