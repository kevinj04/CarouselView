//
//  SPCarouselView.h
//  CarouselView
//
//  Created by Kevin Jenkins on 8/10/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPCarouselView : UIView

@property (strong, nonatomic) NSArray *views;
@property (assign, nonatomic) NSInteger currentViewIndex;

- (id)initWithViews:(NSArray *)views;
+ (id)carousel;
+ (id)carouselWithViews:(NSArray *)views;

- (void)addView:(UIView *)view;

@end
