//
//  SPCarouselView.m
//  CarouselView
//
//  Created by Kevin Jenkins on 8/10/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "SPCarouselView.h"

@implementation SPCarouselView

#pragma mark - Initialization
- (id)init {

    self = [super init];
    if (self) {
        [self setupWithViews:@[]];
        [self addGestureRecognizers];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWithViews:@[]];
        [self addGestureRecognizers];
    }
    return self;
}

- (id)initWithViews:(NSArray *)views {

    self = [super init];
    if (self) {
        [self setupWithViews:views];
        [self addGestureRecognizers];
    }
    return self;
}

+ (id)carouselWithViews:(NSArray *)views {

    return [[SPCarouselView alloc] initWithViews:views];
}

+ (id)carousel {
    return [[SPCarouselView alloc] init];
}

- (void)setupWithViews:(NSArray *)views {
    self.views = views;
    self.currentViewIndex = 0;
    self.clipsToBounds = YES;
}

#pragma mark - Gestures
- (void)addGestureRecognizers {

    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSwipeGesture:)];
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipeGesture:)];

    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;

    [self addGestureRecognizer:swipeLeftRecognizer];
    [self addGestureRecognizer:swipeRightRecognizer];
}

#pragma mark - Gesture Handlers
- (void)handleLeftSwipeGesture:(UIGestureRecognizer *)reconizer {

    if (self.currentViewIndex >= self.views.count - 1) { return; }
    self.currentViewIndex++;
    [self slideCarouselLeft];
}

- (void)handleRightSwipeGesture:(UIGestureRecognizer *)recognizer {

    if (self.currentViewIndex <= 0) { return; }
    self.currentViewIndex--;
    [self slideCarouselRight];
}

#pragma mark - View Array Modification
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setViews:self.views];
}
- (void)addView:(UIView *)view {

    NSMutableArray *temp = self.views.mutableCopy;
    [temp addObject:view];
    self.views = temp;
}

- (void)setViews:(NSArray *)views {

    _views = views;

    NSInteger viewIndex = 0;
    for (UIView *view in self.views) {
        [self addSubview:view];
        view.frame = CGRectMake(viewIndex*self.frame.size.width, 0,
                                view.frame.size.width, view.frame.size.height);
        viewIndex++;
    }
}

#pragma mark - View Transitions
- (void)slideCarouselLeft {

    [UIView animateWithDuration:0.5 animations:^{
        for (UIView *view in self.views) {
            CGRect oldFrame = view.frame;
            CGRect newFrame = CGRectMake(view.frame.origin.x - self.frame.size.width,
                                         view.frame.origin.y,
                                         view.frame.size.width,
                                         view.frame.size.height);
            view.frame = newFrame;
            NSLog(@"Frame of %@ from %@ to %@", view, NSStringFromCGRect(oldFrame), NSStringFromCGRect(newFrame));
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)slideCarouselRight {

    [UIView animateWithDuration:0.5 animations:^{
        for (UIView *view in self.views) {
            view.frame = CGRectMake(view.frame.origin.x + self.frame.size.width,
                                    view.frame.origin.y,
                                    view.frame.size.width,
                                    view.frame.size.height);
        }
    } completion:^(BOOL finished) {

    }];
}

@end
