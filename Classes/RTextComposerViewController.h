//
//  RTextComposerViewController.h
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-6-22.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "RModalViewController.h"

@class RTextComposerViewController;

@protocol RTextComposerDelegate <RModalViewDelegate>

@optional
- (UIView *)viewForToolbarInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (CGFloat)heightForToolbarInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;


- (UIEdgeInsets)insetsForTextViewInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (UIFont *)fontForTextViewInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (UIColor *)colorForTextViewInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;


@end


@interface RTextComposerViewController : RModalViewController <UITextViewDelegate>

@property (nonatomic, weak) id<RTextComposerDelegate> delegate;
@property (nonatomic, assign) NSUInteger wordCount;
@property (nonatomic, assign) NSUInteger maxLength;
@property (nonatomic, readonly, weak) NSString *text;

- (void)resetContent;

@end
