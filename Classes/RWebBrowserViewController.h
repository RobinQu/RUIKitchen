//
//  RWebBrowserViewController.h
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-7-3.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "RModalViewController.h"

@protocol RWebBrowserDelegate <RModalDelegate, UIWebViewDelegate>



@end


@interface RWebBrowserViewController : RModalViewController


@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, weak) id<RWebBrowserDelegate> delegate;

- (void)loadURL:(NSURL *)url;

+ (id)showBrowserWithTitle:(NSString *)title URL:(NSURL *)url forViewController:(UIViewController *)viewController;


@end