//
//  JSEntryDetailViewController.m
//  JournalObjC
//
//  Created by Josh Sparks on 10/7/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import "JSEntryDetailViewController.h"
#import "JSEntryController.h"

@interface JSEntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation JSEntryDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
}
- (IBAction)saveButtontapped:(id)sender
{
    if (self.entry)
    {
        self.entry.title = self.titleTextField.text;
        self.entry.bodyText = self.bodyTextView.text;
        self.entry.timeStamp = [NSDate date];
    } else {
        JSEntry *entry = [[JSEntry alloc] initWithEntry:self.titleTextField.text bodyText:self.bodyTextView.text timeStamp:[NSDate date]];
        
        [[JSEntryController sharedController] addEntry:entry];
        
        [[JSEntryController sharedController]saveToPersistentStorage];
        
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender {
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

@end
