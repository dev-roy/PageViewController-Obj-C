//
//  PageViewController.m
//  PageViewController
//
//  Created by Field Employee on 3/30/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"

@interface PageViewController ()
{
    NSArray *images;
}
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    images = @[@"barto", @"donut", @"family", @"homer"];
    self.dataSource = self;
    ViewController *initialVC = (ViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialVC];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

// MARK: - Helper method
-(UIViewController *) viewControllerAtIndex: (NSUInteger)index {
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.strImage = images[index];
    viewController.strIndex = [NSString stringWithFormat: @"%lu", (unsigned long)index + 1];
    viewController.pageIndex = index;
    return viewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((ViewController *)viewController).pageIndex;
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((ViewController *)viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == images.count) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

@end
