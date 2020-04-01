//
//  ViewController.m
//  PageViewController
//
//  Created by Field Employee on 3/30/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign, nonatomic) NSInteger index;
@end

@implementation ViewController
{
    NSArray *myViewControllers;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageToDisplay.image = [UIImage imageNamed:_strImage];
    self.labelToDisplay. text = _strIndex;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    return myViewControllers[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    NSUInteger index = self.index;

    if (index == 0) { return nil; }

    // Decrease the index by 1 to return
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {

    NSUInteger index = self.index;
    index++;
    if (index > [myViewControllers count]) { return nil; }

    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return [myViewControllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


@end
