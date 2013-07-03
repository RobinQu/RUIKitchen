//
//  KitchenWebViewController.m
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-7-3.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "KitchenWebViewController.h"

@interface KitchenWebViewController ()

@end

@implementation KitchenWebViewController

+ (id)defaultBrowserViewController
{
    KitchenWebViewController *browserVC = [[KitchenWebViewController alloc] initWithNibName:nil bundle:nil];
    browserVC.delegate = browserVC;
    return browserVC;
}

@end
