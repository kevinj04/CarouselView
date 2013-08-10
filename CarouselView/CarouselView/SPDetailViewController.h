//
//  SPDetailViewController.h
//  CarouselView
//
//  Created by Kevin Jenkins on 8/10/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
