//
//  ModalViewController.m
//  UNIQUECOMPANYNAME
//
//  Created by Robin Qu on 13-4-11.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "RModalViewController.h"

@interface RModalViewController ()


@end

@implementation RModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view addSubview:self.navigationBar];
    }
    return self;
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (CGRect)frameForMainContent
{
    return CGRectMake(0, NavigationBarHeight, self.view.frame.size.width, self.view.frame.size.height - NavigationBarHeight);
}

- (UINavigationBar *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, NavigationBarHeight)];
        UINavigationItem *currentItem = [[UINavigationItem alloc] initWithTitle:self.title];
        currentItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(backAction)];;
        currentItem.rightBarButtonItem = self.rightBarButtonItem;
        [_navigationBar pushNavigationItem:currentItem animated:NO];
    }
    return _navigationBar;
}

- (void)backAction
{
    [self dismissViewControllerAnimated:NO completion:nil];
    SEL didClose = @selector(dialogDidCloseByUser);
    if ([self respondsToSelector:didClose]) {
        [self performSelector:didClose];
    }
}


@end
