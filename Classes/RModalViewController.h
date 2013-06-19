//
//  ModalViewController.h
//  UNIQUECOMPANYNAME
//
//  Created by Robin Qu on 13-4-11.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSInteger NavigationBarHeight = 44;


@interface RModalViewController : UIViewController

@property (nonatomic, retain) UINavigationBar *navigationBar;


//+ (id)showWithTitle:(NSString *)title forViewController:(UIViewController *)viewController;

//+ (id)showWithTitleView:(UIView *)titleView forViewController:(UIViewController *)viewController;

//+ (id)showForViewController:(UIViewController *)viewController;


- (CGRect)frameForMainContent;

//- (void)dismisSelf;

@property (nonatomic, retain) UIBarButtonItem *rightBarButtonItem;

@property (nonatomic, retain) UIView *titleView;


@end
