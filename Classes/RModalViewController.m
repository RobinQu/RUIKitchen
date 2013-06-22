//
//  ModalViewController.m
//  UNIQUECOMPANYNAME
//
//  Created by Robin Qu on 13-4-11.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "RModalViewController.h"
#import <objc/runtime.h>

static char INSTANCE_ASSOCIATION_KEY;

@interface RModalViewController ()


@end

@implementation RModalViewController

//http://stackoverflow.com/questions/8392687/giving-each-subclass-its-own-copy-of-a-class-variable
+ (id)showForViewController:(UIViewController *)viewController
{
    RModalViewController *vc = objc_getAssociatedObject(self, &INSTANCE_ASSOCIATION_KEY);
    if (!vc) {
        vc = [[self alloc] initWithNibName:nil bundle:nil];
        objc_setAssociatedObject(self, &INSTANCE_ASSOCIATION_KEY, vc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    if (vc.titleView) {
        vc.navigationBar.topItem.titleView = vc.titleView;
    }
    [viewController presentViewController:vc animated:NO completion:nil];
    return vc;
}

+ (id)showWithTitle:(NSString *)title ForViewController:(UIViewController *)viewController;
{
    RModalViewController* vc = [self showForViewController:viewController];
    vc.title = title;
    vc.navigationBar.topItem.title = title;
    return vc;
}

+ (id)showWithTitleView:(UIView *)titleView forViewController:(UIViewController *)viewController
{
    RModalViewController* vc = [self showForViewController:viewController];
    vc.navigationBar.topItem.titleView = titleView;
    return vc;
}

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

- (void)dismisSelf
{
    [self backAction];
}

@end
