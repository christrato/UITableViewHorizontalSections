//
//  SectionsScrollView.h
//  UITableViewHorizontalSections
//
//  Created by Christian Borsato on 19/04/13.
//  Copyright (c) 2013 Christian Borsato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionsCellView.h"

#define CELL_WIDTH 200.0

@interface SectionsScrollView : UIScrollView

@property (nonatomic) float lastContentOffset;

- (void)loadSections:(NSArray*)sectionsArray;
- (void)sectionsScrollWithOffset:(CGPoint)contentOffset;

@end
