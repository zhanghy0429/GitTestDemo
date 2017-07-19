//
//  ViewController.m
//  GCDDemo
//
//  Created by zhanghongyu on 2017/4/14.
//  Copyright © 2017年 zhanghongyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>


// 费时分支2

//test分支

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation ViewController

//scrollView滚动时，就调用该方法。任何offset值改变都调用该方法。即滚动过程中，调用多次
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewDidScroll");
    CGPoint point=scrollView.contentOffset;
    NSLog(@"%f,%f",point.x,point.y);
    // 从中可以读取contentOffset属性以确定其滚动到的位置。
    
    // 注意：当ContentSize属性小于Frame时，将不会出发滚动
}

// 当开始滚动视图时，执行该方法。一次有效滑动（开始滑动，滑动一小段距离，只要手指不松开，只算一次滑动），只执行一次。
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewWillBeginDragging");
    
}
// 滑动scrollView，并且手指离开时执行。一次有效滑动，只执行一次。
// 当pagingEnabled属性为YES时，不调用，该方法
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    NSLog(@"scrollViewWillEndDragging");
    NSLog(@"velocity == %@",NSStringFromCGPoint(velocity));
    NSLog(@"targetContentOffset == %@",NSStringFromCGPoint(*targetContentOffset));
    
}
// 滑动视图，当手指离开屏幕那一霎那，调用该方法。一次有效滑动，只执行一次。
// decelerate,指代，当我们手指离开那一瞬后，视图是否还将继续向前滚动（一段距离），经过测试，decelerate=YES
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    NSLog(@"scrollViewDidEndDragging");
    if (decelerate) {
        NSLog(@"decelerate");
    }else{
        NSLog(@"no decelerate");
        
    }
    
    CGPoint point=scrollView.contentOffset;
    NSLog(@"%f,%f",point.x,point.y);
    
}

// 滑动减速时调用该方法。
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewWillBeginDecelerating");
    // 该方法在scrollViewDidEndDragging方法之后。
    
    
}

// 滚动视图减速完成，滚动将停止时，调用该方法。一次有效滑动，只执行一次。
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewDidEndDecelerating");
    
    //[_scrollView setContentOffset:CGPointMake(0, 500) animated:YES];
    
}

// 当滚动视图动画完成后，调用该方法，如果没有动画，那么该方法将不被调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewDidEndScrollingAnimation");
    // 有效的动画方法为：
    //    - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated 方法
    //    - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated 方法
    
    
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"已经滑动到顶部");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 好尴尬的测试
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            for (int i = 0 ; i< 999; i++) {
                NSLog(@"%d",i);
            }
        });
    });
    for (int i = 0 ; i< 999; i++) {
        NSLog(@"%d",i);
    }
    dispatch_group_t queueGroup = dispatch_group_create();
    NSLog(@"%@",dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    NSLog(@"%@",dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    NSLog(@"%@",dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
