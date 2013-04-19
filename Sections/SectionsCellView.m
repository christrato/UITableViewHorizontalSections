//
//  SectionsCellView.m
//  UITableViewHorizontalSections
//
//  Created by Christian Borsato on 19/04/13.
//  Copyright (c) 2013 Christian Borsato. All rights reserved.
//

#import "SectionsCellView.h"

@implementation SectionsCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setClipsToBounds:YES];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
        [_label setBackgroundColor:[UIColor clearColor]];
        [_label setTextColor:[UIColor blackColor]];
        [_label setTextAlignment:UITextAlignmentCenter];
        [_label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18.0]];
        [_label setLineBreakMode:NSLineBreakByTruncatingTail];
        [_label setNumberOfLines:2];
        
        [self addSubview:_label];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void)dealloc
{
    NSLog(@"dealloc SectionsCellView");
    
    [_label removeFromSuperview];
    [_label release];
    
    [super dealloc];
}

@end
