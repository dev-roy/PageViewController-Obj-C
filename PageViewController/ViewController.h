//
//  ViewController.h
//  PageViewController
//
//  Created by Field Employee on 3/30/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageToDisplay;
@property (weak, nonatomic) IBOutlet UILabel *labelToDisplay;
@property NSString *strImage;
@property NSString *strIndex;
@property NSUInteger pageIndex;
@end

