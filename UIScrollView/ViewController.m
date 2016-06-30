//
//  ViewController.m
//  UIScrollView
//
//  Created by baishiqi on 16/6/30.
//  Copyright © 2016年 baishiqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *colorPool;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initColor];
    [self configScrollView];
}

- (void)initColor
{
//    RGB
//    红: 255,   0,   0
//    橙: 255, 125,   0
//    黄: 255, 255,   0
//    绿:   0, 255,   0
//    蓝:   0,   0, 255
//    靛:   0, 255, 255
//    紫: 255,   0, 255
    self.colorPool = @[[UIColor colorWithRed:255.0/255.0 green:0 blue:0 alpha:1.0],
                       [UIColor colorWithRed:255.0/255.0 green:125.0/255.0 blue:0 alpha:1.0],
                       [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0 alpha:1.0],
                       [UIColor colorWithRed:0 green:255.0/255.0 blue:0 alpha:1.0],
                       [UIColor colorWithRed:0 green:0 blue:255.0/255.0 alpha:1.0],
                       [UIColor colorWithRed:0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
                       [UIColor colorWithRed:255.0/255.0 green:0 blue:255.0/255.0 alpha:1.0]];
}

- (void)configScrollView
{
    for (int i=0; i<self.colorPool.count; i++) {
        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(i * CGRectGetWidth(self.view.bounds), 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
        subView.backgroundColor = [self.colorPool objectAtIndex:i];
        [self.scrollView addSubview:subView];
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(self.colorPool.count * CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

// any offset changes
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    NSLog(@"%s", __func__);
}

// any zoom scale changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2)
{
    NSLog(@"%s", __func__);
}

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    NSLog(@"%s, %@, %@", __func__, NSStringFromCGPoint(velocity), NSStringFromCGPoint(*targetContentOffset));
}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"%s , %i", __func__, decelerate);
}

// called on finger up as we are moving
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

// called when scroll view grinds to a halt
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

// return a view that will be scaled. if delegate returns nil, nothing happens
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
    return nil;
}

// called before the scroll view begins zooming its content
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2)
{
    NSLog(@"%s", __func__);
}

// scale between minimum and maximum. called after any 'bounce' animations
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"%s", __func__);
}

// return a yes if you want to scroll to the top. if not defined, assumes YES
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
    return YES;
}

// called when scrolling animation finished. may be called immediately if already at top
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

@end
