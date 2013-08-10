//
//  SPDetailViewController.m
//  CarouselView
//
//  Created by Kevin Jenkins on 8/10/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "SPDetailViewController.h"
#import "SPCarouselView.h"

@interface SPDetailViewController ()
- (void)configureView;
@end

@implementation SPDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect frame = CGRectMake(0, 0, 320, 150);

    UIView *redView = [[UIView alloc] initWithFrame:frame];
    redView.backgroundColor = [UIColor redColor];

    UIView *yellowView = [[UIView alloc] initWithFrame:frame];
    yellowView.backgroundColor = [UIColor yellowColor];

    UIView *greenView = [[UIView alloc] initWithFrame:frame];
    greenView.backgroundColor = [UIColor greenColor];

    SPCarouselView *carousel = [SPCarouselView carouselWithViews:@[redView, yellowView, greenView]];
    carousel.frame = frame;

    [self.view addSubview:carousel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
