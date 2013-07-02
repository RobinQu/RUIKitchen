//
//  KitchenTextComposerViewController.m
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-6-22.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "KitchenTextComposerViewController.h"

@interface KitchenTextComposerViewController ()

@end

@implementation KitchenTextComposerViewController

+ (id)defaultTextComposerViewController
{
    KitchenTextComposerViewController *vc = [[KitchenTextComposerViewController alloc] initWithNibName:nil bundle:nil];
    vc.delegate = vc;
    return vc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)titleForModalViewController:(RModalViewController *)modalViewController
{
    return @"Text Composer";
}

static CGFloat toolbarHeight = 40;
- (UIView *)viewForToolbarInTextComposerViewController:(RTextComposerViewController *)textComposerViewController
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (CGFloat)heightForToolbarInTextComposerViewController:(RTextComposerViewController *)textComposerViewController
{
    return toolbarHeight;
}

- (UIBarButtonItem *)primaryBarButtonItemForModalViewController:(RModalViewController *)modalViewController
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Send" style:UIBarButtonItemStyleBordered target:self action:@selector(doSend)];
    return barButton;
}

- (void)doSend
{
    [[[UIAlertView alloc] initWithTitle:@"Send!" message:@"Message Sent!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}


@end
