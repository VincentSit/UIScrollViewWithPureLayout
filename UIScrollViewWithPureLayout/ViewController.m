//
//  ViewController.m
//  UIScrollViewWithPureLayout
//
//  Created by Vincent Sit on 14/11/10.
//  Copyright (c) 2014年 Vincent Sit. All rights reserved.
//

#import "ViewController.h"

#import <PureLayout.h>


#define DEMO_1 1
#define DEMO_2 0
#define DEMO_3 0

@interface ConentView : UIView
@end

@implementation ConentView

- (CGSize)intrinsicContentSize {
  return CGSizeMake(2000.f, 2000.f);
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSParameterAssert(DEMO_1 + DEMO_2 + DEMO_3 <= 1);
  
#if DEMO_1
  [self setupScrollView];
#elif DEMO_2
  [self setupScrollView2];
#elif DEMO_3
  [self setupScrollView3];
#endif
}

- (void)setupScrollView {
  UIScrollView *scrollView = [UIScrollView newAutoLayoutView];
  scrollView.backgroundColor = [UIColor redColor];
  [self.view addSubview:scrollView];
  
  UIImageView *contentView = [UIImageView newAutoLayoutView];
  contentView.image = [UIImage imageNamed:@"BigImage"];
  [scrollView addSubview:contentView];
  [contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
  [scrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

- (void)setupScrollView2 {
  UIScrollView *scrollView = [UIScrollView newAutoLayoutView];
  scrollView.backgroundColor = [UIColor redColor];
  [self.view addSubview:scrollView];
  
  ConentView *contentView = [ConentView newAutoLayoutView];
  contentView.backgroundColor = [UIColor blueColor];
  [scrollView addSubview:contentView];
  
  [contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
  [scrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

- (void)setupScrollView3 {
  UIScrollView *scrollView = [UIScrollView newAutoLayoutView];
  scrollView.backgroundColor = [UIColor greenColor];
  [self.view addSubview:scrollView];
  
  UIView *contentView = [UIView newAutoLayoutView];
  contentView.backgroundColor = [UIColor orangeColor];
  [scrollView addSubview:contentView];
  
  [contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
  [scrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

#if DEMO_3
- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  
  UIScrollView *scrollView = nil;
  for (UIView *view in self.view.subviews) {
    if ([view isKindOfClass:[UIScrollView class]]) {
      scrollView = (UIScrollView *)view;
      break;
    }
  }
  
  scrollView.contentSize = CGSizeMake(2000, 2000);
}
#endif

@end
