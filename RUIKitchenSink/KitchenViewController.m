//
//  KitchenViewController.m
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-6-22.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "KitchenViewController.h"
#import "KitchenTextComposerViewController.h"

@interface KitchenViewController ()

@property (nonatomic, retain) KitchenTextComposerViewController *composerVC;

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

- (KitchenTextComposerViewController *)composerVC
{
    if (!_composerVC) {
        _composerVC = [KitchenTextComposerViewController defaultTextComposerViewController];
    }
    return _composerVC;
}

- (IBAction)showModalVC:(id)sender {
    
}

- (IBAction)showComposerVC:(id)sender {
    [self presentViewController:self.composerVC animated:YES completion:nil];
}


@end
