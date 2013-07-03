//
//  ModalViewController.h
//  UNIQUECOMPANYNAME
//
//  Created by Robin Qu on 13-4-11.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSInteger NavigationBarHeight = 44;

@class RModalViewController;

@protocol RModalDelegate <NSObject>

@optional
- (UIBarButtonItem *)primaryBarButtonItemForModalViewController:(RModalViewController *)modalViewController;
- (UIBarButtonItem *)secondaryBarButtonItemForModalViewController:(RModalViewController *)modalViewController;
- (NSString *)titleForModalViewController:(RModalViewController *)modalViewController;

@end

@interface RModalViewController : UIViewController

@property (nonatomic, retain) UINavigationBar *navigationBar;
@property (nonatomic, weak) id<RModalDelegate> delegate;
@property (nonatomic, retain) UIBarButtonItem *rightBarButtonItem;
@property (nonatomic, retain) UIBarButtonItem *leftBarButtonItem;
@property (nonatomic, retain) UIView *titleView;


+ (id)showForViewController:(UIViewController *)viewController;
+ (id)showWithTitleView:(UIView *)titleView forViewController:(UIViewController *)viewController;
+ (id)showWithTitle:(NSString *)title ForViewController:(UIViewController *)viewController;
- (CGRect)frameForMainContent;
- (void)dismisSelf;
- (void)dialogDidCloseByUser;




@end
