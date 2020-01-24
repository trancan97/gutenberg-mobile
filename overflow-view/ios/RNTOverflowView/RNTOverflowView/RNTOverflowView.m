//
//  RNTOverflowView.m
//  RNTOverflowView
//
//  Created by Chip Snyder on 1/24/20.
//  Copyright © 2020 Automattic. All rights reserved.
//

#import "RNTOverflowView.h"

@implementation RNTOverflowView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    for (UIView *subview in self.subviews) {
        
        NSLog(@"%@", NSStringFromCGRect(subview.frame));
    }
    
    return [super hitTest:point withEvent:event];
}

@end
