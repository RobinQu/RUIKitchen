//
//  RTextComposerViewController.m
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-6-22.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "RTextComposerViewController.h"

@interface RTextComposerViewController ()

@property (nonatomic, retain) UITextView *textView;
//@property (nonatomic, retain) UIBarButtonItem *primaryBarButtonItem;
@property (nonatomic, retain) UIView *toolbarView;

@end

@implementation RTextComposerViewController

@synthesize rightBarButtonItem = _rightBarButtonItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view addSubview:self.textView];
        [self.view addSubview:self.toolbarView];
        self.maxLength = INFINITY;
        [self updateCounter];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(adjustViewForKeyboard:) name:UIKeyboardDidShowNotification object:nil];
    }
    return self;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:[self frameForMainContent]];
        //TODO should inquery its delegate about font size, content inset, text color
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
        _textView.textColor = [UIColor grayColor];
        _textView.delegate = self;
    }
    return _textView;
}

- (UIBarButtonItem *)rightBarButtonItem
{
    if (!_rightBarButtonItem) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(primaryBarButtonItemForTextComposerViewController:)]) {
            _rightBarButtonItem = [self.delegate primaryBarButtonItemForTextComposerViewController:self];
        }
    }
    return _rightBarButtonItem;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Force update navigation items
    self.navigationBar.topItem.rightBarButtonItem = self.rightBarButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateCounter
{
    self.wordCount = self.textView.text.length;
}

- (void)adjustViewForKeyboard:(NSNotification *)notification
{
    CGRect kFrame = [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect maxFrame = [self frameForMainContent];
    CGFloat toolbarHeight = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightForToolbarInTextComposerViewController:)]) {
        toolbarHeight = [self.delegate heightForToolbarInTextComposerViewController:self];
    }
    self.textView.frame = CGRectMake(0, maxFrame.origin.y, maxFrame.size.width, maxFrame.size.height -  kFrame.size.height - toolbarHeight);
    self.toolbarView.frame = CGRectMake(0, maxFrame.origin.y + maxFrame.size.height - kFrame.size.height - toolbarHeight, maxFrame.origin.x, toolbarHeight);
}

- (void)resetContent
{
    self.textView.text = @"";
    [self updateCounter];
}

- (void)textViewDidChange:(UITextView *)textView
{
    [self updateCounter];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    //when text.length == ComposerTotalSize, we shouldn't allow futher editing actions
    return textView.text.length < self.maxLength;
}

@end
