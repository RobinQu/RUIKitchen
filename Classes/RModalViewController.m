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
static char kModalViewTitleKVO;
static char kModalViewDelegateKVO;
static char kModalViewLeftBarItemKVO;
static char kModalViewRightBarItemKVO;


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
    
    [viewController presentViewController:vc animated:YES completion:nil];
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
        [self.view addSubview:self.navigationBar];
        [self addObserver:self forKeyPath:@"title" options:0 context:&kModalViewTitleKVO];
        [self addObserver:self forKeyPath:@"delegate" options:0 context:&kModalViewDelegateKVO];
        [self addObserver:self forKeyPath:@"leftBarButtonItem" options:0 context:&kModalViewLeftBarItemKVO];
        [self addObserver:self forKeyPath:@"rightBarButtonItem" options:0 context:&kModalViewRightBarItemKVO];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    [self delegateDidChange];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == &kModalViewTitleKVO) {
        self.navigationBar.topItem.title = self.title;
    } else if(context == &kModalViewDelegateKVO) {
        [self delegateDidChange];
    } else if (context == &kModalViewLeftBarItemKVO) {
        self.navigationBar.topItem.leftBarButtonItem = self.leftBarButtonItem;
    } else if (context == &kModalViewRightBarItemKVO) {
        self.navigationBar.topItem.rightBarButtonItem = self.rightBarButtonItem;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)delegateDidChange
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(primaryBarButtonItemForModalViewController:)]) {
        self.leftBarButtonItem = [self.delegate primaryBarButtonItemForModalViewController:self];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(secondaryBarButtonItemForModalViewController:)]) {
        self.rightBarButtonItem = [self.delegate secondaryBarButtonItemForModalViewController:self];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(titleForModalViewController:)]) {
        self.title = [self.delegate titleForModalViewController:self];
    }
}

- (CGRect)frameForMainContent
{
    return CGRectMake(self.view.bounds.origin.x, NavigationBarHeight + self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - NavigationBarHeight);
}

- (UINavigationBar *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.frame.size.width, NavigationBarHeight)];
        UINavigationItem *currentItem = [[UINavigationItem alloc] initWithTitle:self.title];
        currentItem.rightBarButtonItem = self.rightBarButtonItem;
        currentItem.leftBarButtonItem = self.leftBarButtonItem;
        [_navigationBar pushNavigationItem:currentItem animated:NO];
    }
    return _navigationBar;
}

- (UIBarButtonItem *)leftBarButtonItem
{
    if (!_leftBarButtonItem) {
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(backAction)];
    }
    return _leftBarButtonItem;
}

//- (UIBarButtonItem *)rightBarButtonItem
//{
//    if (!_rightBarButtonItem) {
//        if (self.delegate && [self.delegate respondsToSelector:@selector(secondaryBarButtonItemForModalViewController:)]) {
//            _rightBarButtonItem = [self.delegate secondaryBarButtonItemForModalViewController:self];
//        }
//    }
//    return _rightBarButtonItem;
//}

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
    SEL didClose = @selector(dialogDidCloseByUser);
    if ([self respondsToSelector:didClose]) {
        [self performSelector:didClose];
    }
}

- (void)dialogDidCloseByUser
{
    
}

- (void)dismisSelf
{
    [self backAction];
}

@end
