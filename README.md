RUIKitchenSink
==============
**Drop-in views and view controllers for iOS**

Not-production readly


Components
==========

* RModalViewController
* RTextComposerViewController
* RWebBrowserViewController


RModalViewController
--------------------

Abstract Modal ViewController. It should never be used directly. Meant to be subclassed.

It exposes some important methods:

    + (id)showForViewController:(UIViewController *)viewController;
    + (id)showWithTitleView:(UIView *)titleView forViewController:(UIViewController *)viewController;
    + (id)showWithTitle:(NSString *)title ForViewController:(UIViewController *)viewController;
    - (CGRect)frameForMainContent;
    - (void)dismisSelf;


`RModalDelegate` is the companion with any `RModalViewController`; It helpes `RModalViewController` to make some important decisions.

    - (UIBarButtonItem *)primaryBarButtonItemForModalViewController:(RModalViewController *)modalViewController;
    - (UIBarButtonItem *)secondaryBarButtonItemForModalViewController:(RModalViewController *)modalViewController;
    - (NSString *)titleForModalViewController:(RModalViewController *)modalViewController;


RTextComposerViewController
---------------------------

A simple text composer view controller with a UITextField and a customizable toolbar.

It has also has a companion delegate named `RTextComposerDelegate`(inherits from `RModalDelegate`)



RWebBrowserViewController
-------------------------

A simple web browser view controller. Its delegate inherits from `UIWebViewDelegate` and `RModalDelegate`