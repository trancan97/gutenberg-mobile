//
//  RNTOverflowView.m
//  RNTOverflowView
//
//  Created by Chip Snyder on 1/24/20.
//  Copyright © 2020 Automattic. All rights reserved.
//

#import "RNTOverflowView.h"

@implementation RNTOverflowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return [super hitTest:point withEvent:event];
}

@end
