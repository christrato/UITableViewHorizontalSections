UITableViewHorizontalSections
=============================

Now you can add sections above a Horizontal Table view that works well.

The normal header sections of UITableView have some issues when you put it on horizontal, 
because you must set a height for it, and this make an annoying beahviour of the row (the first row start at x = section height).
You can fix this behaviour if you set the height of the sections = 0.0, but with this fix the sections will be overlapped when you scroll between sections.

As well as the new EasyTableView, that support sections, have the same issue.


HOW TO USE:

Add into your project the files:

  - SectionsCellView.h
  - SectionsCellView.m
  - SectionsScrollView.h
  - SectionsScrollView.m

Create a ScrollView and assign the class "SectionsScrollView" to it. 

Set the CELL_WIDTH inside the file SectionsScrollView.h, this value is the "width" of the cell of the TableView.

You have to pass an array like the one that you found inside the file "ViewController.m":

    _arraySections = [[NSMutableArray alloc] init];
    [_arraySections addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Name", @"text", [NSNumber numberWithInt:6], @"rows", nil]];
    [_arraySections addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"City", @"text", [NSNumber numberWithInt:5], @"rows", nil]];

that tells the "SectionScrollView" how and where create the "SectionsCellView".
In this case the section "NAME" correspond for the first 6 rows, and the section "CITY" correspond for the next 5 rows.


EXAMPLE:

In the project you can see the UITableViewHorizontalSections working with UITableView and EasyTableView.
