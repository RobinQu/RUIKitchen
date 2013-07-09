//
//  RWebBrowserViewController.m
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-7-3.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "RWebBrowserViewController.h"

@interface RWebBrowserViewController ()

@end


@implementation RWebBrowserViewController

@synthesize webView = _webView;

+ (id)showBrowserWithTitle:(NSString *)title URL:(NSURL *)url forViewController:(UIViewController *)viewController
{
    RWebBrowserViewController *vc = [self showWithTitle:title ForViewController:viewController];
    [vc loadURL:url];
    return vc;
}

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
	// Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
        _webView.delegate = self.delegate;
        _webView.frame = [self frameForMainContent];
    }
    NSLog(@"delegate %@", _webView.delegate);
    return _webView;
}

- (void)loadURL:(NSURL *)url
{
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:urlRequest];
}

@end
