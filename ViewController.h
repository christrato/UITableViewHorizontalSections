//
//  ViewController.h
//  UITableViewHorizontalSections
//
//  Created by Christian Borsato on 19/04/13.
//  Copyright (c) 2013 Christian Borsato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionsScrollView.h"
#import "EasyTableView.h"
#import "EasyCellView.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, EasyTableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet SectionsScrollView *sectionsScrollView;

@property (nonatomic, retain) IBOutlet UIView *containerEasyTableView;
@property (nonatomic, retain) IBOutlet SectionsScrollView *easySectionsScrollView;

@property (nonatomic, retain) NSMutableArray *arraySections;
@property (nonatomic, retain) NSMutableArray *arrayItem;

@end
