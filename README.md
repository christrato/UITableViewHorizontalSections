UITableViewHorizontalSections
=============================

Now you can add sections above a Horizontal Table view that works well.

The normal header sections of UITableView have some issues when you put it on horizontal, 
because you must set a height for it, and this make an annoying beahviour of the row (the first row start at x = section height).
You can fix this behaviour if you set the height of the sections = 0.0, but with this fix the sections will be overlapped when you scroll between sections.

As well as the new EasyTableView, that support sections, have the same issue.

