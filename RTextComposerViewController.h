//
//  RTextComposerViewController.h
//  RUIKitchenSink
//
//  Created by Robin Qu on 13-6-22.
//  Copyright (c) 2013年 Robin Qu. All rights reserved.
//

#import "RModalViewController.h"

@class RTextComposerViewController;

@protocol RTextComposerDelegate <NSObject>

@optional
- (UIView *)viewForToolbarInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (CGFloat)heightForToolbarInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (UIBarButtonItem *)primaryBarButtonItemForTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (UIEdgeInsets)insetsForTextViewInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (UIFont *)fontForTextViewInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (UIColor *)colorForTextViewInTextComposerViewController:(RTextComposerViewController *)textComposerViewController;
- (NSString *)titleForTextComposerViewController:(RTextComposerViewController *)textComposerViewController;


@end


@interface RTextComposerViewController : RModalViewController <UITextViewDelegate>

@property (nonatomic, weak) id<RTextComposerDelegate> delegate;
@property (nonatomic, assign) NSUInteger wordCount;
@property (nonatomic, assign) NSUInteger maxLength;

@end
