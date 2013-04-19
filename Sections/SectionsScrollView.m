//
//  SectionsScrollView.m
//  UITableViewHorizontalSections
//
//  Created by Christian Borsato on 19/04/13.
//  Copyright (c) 2013 Christian Borsato. All rights reserved.
//

#import "SectionsScrollView.h"

@implementation SectionsScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setUserInteractionEnabled:NO];
        [self setBounces:NO];
        [self setScrollEnabled:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
    
    }
    return self;
}


- (void)loadSections:(NSArray*)sectionsArray
{
    float offsetX = 0.0;
    
    for(int i = 0; i < [sectionsArray count]; i++)
    {
        NSString *text = [[sectionsArray objectAtIndex:i] objectForKey:@"text"];
        int rows = [[[sectionsArray objectAtIndex:i] objectForKey:@"rows"] intValue];
        
        NSLog(@"text: %@, rows: %d", text, rows);
        
        UIView *scrollView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, 0.0, CELL_WIDTH * rows, self.frame.size.height)];
        [scrollView setClipsToBounds:YES];
        
        SectionsCellView *view = [[SectionsCellView alloc] initWithFrame:CGRectMake(0.0, 0.0, CELL_WIDTH, self.frame.size.height)];
        [view setTag:i];
        [view.label setText:text];

        [scrollView addSubview:view];
        
        [self addSubview:scrollView];
        
        offsetX += scrollView.frame.size.width;
        
        [view release];
        [scrollView release];
    }
    
    [self setContentSize:CGSizeMake(offsetX, self.frame.size.height)];

}


- (void)sectionsScrollWithOffset:(CGPoint)contentOffset
{

    int direction = 0;
        
    if (_lastContentOffset > contentOffset.x)
    {
        direction = 2;
    }
    else if (_lastContentOffset < contentOffset.x)
    {
        direction = 1;
    }
    
    _lastContentOffset = contentOffset.x;
    
    for(UIView *subScrollView in self.subviews)
    {
        
        UIView *view = [[subScrollView subviews] objectAtIndex:0];
        
        int tag = view.tag;
        
        CGRect frame = view.frame;
        
        if(view.frame.origin.x + view.frame.size.width > subScrollView.frame.size.width)
        {
            frame.origin.x = subScrollView.frame.size.width - view.frame.size.width;
            view.frame = frame;
        }
        
        if(contentOffset.x >= subScrollView.frame.origin.x)
        {
            
            if(direction == 1)
            {
                if(frame.origin.x + frame.size.width >= subScrollView.frame.size.width)
                {
                    
                } else {
                    
                    frame.origin.x = (contentOffset.x - subScrollView.frame.origin.x);
                    view.frame = frame;
                }
            } else if(direction == 2)
            {
                if(frame.origin.x + frame.size.width >= subScrollView.frame.size.width
                   && contentOffset.x >= (frame.origin.x + subScrollView.frame.origin.x))
                {
                    if(subScrollView.frame.origin.x + subScrollView.frame.size.width >= contentOffset.x)
                    {
                        for(UIView *scrollView_ in self.subviews)
                        {
                            UIView *view_ = [scrollView_ viewWithTag:tag+1];
                            
                            if(view_ != nil)
                            {
                                CGRect frame_ = view_.frame;
                                frame_.origin.x = 0.0;
                                view_.frame = frame_;
                            }
                        }
                    }
                    
                } else {
                    
                    frame.origin.x = (contentOffset.x - subScrollView.frame.origin.x);
                    view.frame = frame;
                }
            }
        } else {
            
            if(contentOffset.x < 0.0)
            {
                if(view.tag == 0)
                {
                    frame.origin.x = (subScrollView.frame.origin.x);
                    view.frame = frame;
                }
            }
        }
        
        
    }
    
    self.contentOffset = contentOffset;
    
}


- (void)dealloc
{
    NSLog(@"dealloc SectionsScrollView");
    
    [super dealloc];
}

@end
