//
//  ViewController.m
//  UITableViewHorizontalSections
//
//  Created by Christian Borsato on 19/04/13.
//  Copyright (c) 2013 Christian Borsato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    
    const CGFloat k90DegreesCounterClockwiseAngle = (CGFloat) -(90 * M_PI / 180.0);
    
    CGRect frame = _tableView.frame;
    _tableView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, k90DegreesCounterClockwiseAngle);
    _tableView.frame = frame;
    
    _arrayItem = [[NSMutableArray alloc] init];
    
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Christian", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Luca", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Paolo", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Salvatore", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Alessandro", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Raffaele", @"text", nil]];
    
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Milano", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Roma", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Verona", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Rimini", @"text", nil]];
    [_arrayItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Firenze", @"text", nil]];
    
    _arraySections = [[NSMutableArray alloc] init];
    
    [_arraySections addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Name", @"text", [NSNumber numberWithInt:6], @"rows", nil]];
    [_arraySections addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"City", @"text", [NSNumber numberWithInt:5], @"rows", nil]];
    
    EasyTableView *easyTableView = [[EasyTableView alloc] initWithFrame:CGRectMake(0.0, 0.0, _containerEasyTableView.frame.size.width, _containerEasyTableView.frame.size.height) numberOfColumns:[_arrayItem count] ofWidth:CELL_WIDTH];
	
	easyTableView.delegate = self;
	easyTableView.tableView.backgroundColor	= [UIColor clearColor];
	easyTableView.tableView.allowsSelection	= YES;
	easyTableView.tableView.separatorColor= [UIColor darkGrayColor];
	easyTableView.cellBackgroundColor = [UIColor lightGrayColor];
	easyTableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    
    [_containerEasyTableView addSubview:easyTableView];
    
    [easyTableView release];
    
    [_sectionsScrollView loadSections:_arraySections];
    [_easySectionsScrollView loadSections:_arraySections];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark UITableView Delegate & DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayItem count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_WIDTH;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        
        CGFloat k90DegreesClockwiseAngle = (CGFloat) (90 * M_PI / 180.0);
		cell.transform = CGAffineTransformRotate(CGAffineTransformIdentity, k90DegreesClockwiseAngle);
        [cell setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        
    }
    
    [cell.textLabel setText:[[_arrayItem objectAtIndex:indexPath.row] objectForKey:@"text"]];
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint contentOffset = CGPointMake(scrollView.contentOffset.y, scrollView.contentOffset.x);
    
    [_sectionsScrollView sectionsScrollWithOffset:contentOffset];
    
}

#pragma mark -
#pragma mark EasyTableView Delegate

- (void)easyTableView:(EasyTableView *)easyTableView scrolledToOffset:(CGPoint)contentOffset
{
    [_easySectionsScrollView sectionsScrollWithOffset:contentOffset];
}


- (UIView *)easyTableView:(EasyTableView *)easyTableView viewForRect:(CGRect)rect {
    EasyCellView *cell = [[[EasyCellView alloc] initWithFrame:rect] autorelease];
    return cell;
}

- (void)easyTableView:(EasyTableView *)easyTableView setDataForView:(UIView *)view forIndex:(NSUInteger)index
{
    EasyCellView *cell = (EasyCellView *)view;
    [cell.label setText:[[_arrayItem objectAtIndex:index] objectForKey:@"text"]];
}

@end
