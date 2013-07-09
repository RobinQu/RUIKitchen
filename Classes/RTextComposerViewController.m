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
@property (nonatomic, retain) UIView *toolbarView;

@end

@implementation RTextComposerViewController

//@synthesize rightBarButtonItem = _rightBarButtonItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.maxLength = INFINITY;
        [self updateCounter];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(adjustViewForKeyboard:) name:UIKeyboardDidShowNotification object:nil];
    }
    return self;
}

- (NSString *)text
{
    return self.textView.text;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:[self frameForMainContent]];
        _textView.delegate = self;
        //TODO should inquery its delegate about font size, content inset, text color
        
        //to prevent horizontal scrolling, we treat left and right insets as margin not padding
        if (self.delegate && [self.delegate respondsToSelector:@selector(insetsForTextViewInTextComposerViewController:)]) {
            UIEdgeInsets insets = [self.delegate insetsForTextViewInTextComposerViewController:self];
            _textView.contentInset = UIEdgeInsetsMake(insets.top
                                                      , 0, insets.bottom, 0);
        } else {
            _textView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(fontForTextViewInTextComposerViewController:)]) {
            _textView.font = [self.delegate fontForTextViewInTextComposerViewController:self];
        } else {
            _textView.font = [UIFont systemFontOfSize:14];
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(colorForTextViewInTextComposerViewController:)]) {
            _textView.textColor = [self.delegate colorForTextViewInTextComposerViewController:self];
        } else {
            _textView.textColor = [UIColor grayColor];
        }
        [self.view addSubview:_textView];
    }
    return _textView;
}

- (UIView *)toolbarView
{
    if (!_toolbarView) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(viewForToolbarInTextComposerViewController:)]) {
            _toolbarView = [self.delegate viewForToolbarInTextComposerViewController:self];
            [self.view addSubview:_toolbarView];
        }
    }
    return _toolbarView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //delegate is possibly assgined after intialization
    [self.textView becomeFirstResponder];
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
    self.toolbarView.frame = CGRectMake(0, maxFrame.origin.y + maxFrame.size.height - kFrame.size.height - toolbarHeight, maxFrame.size.width, toolbarHeight);
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
