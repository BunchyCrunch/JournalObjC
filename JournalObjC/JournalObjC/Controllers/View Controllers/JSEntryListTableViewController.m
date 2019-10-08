//
//  JSEntryListTableViewController.m
//  JournalObjC
//
//  Created by Josh Sparks on 10/7/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import "JSEntryListTableViewController.h"
#import "JSEntryController.h"
#import "JSEntryDetailViewController.h"

@interface JSEntryListTableViewController ()

@end

@implementation JSEntryListTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[JSEntryController sharedController] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    JSEntryController * entryController = [JSEntryController sharedController];
    JSEntry * entry = entryController.entries[indexPath.row];
    
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailVC"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        JSEntry *entry = [JSEntryController sharedController].entries[indexPath.row];
        
        JSEntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}


@end
