//
//  FAViewController.m
//  FileApp
//
//  Created by user on 11/13/13.
//  Copyright (c) 2013 Classroom. All rights reserved.
//

#import "FAViewController.h"
#import "FAMyDocument.h"

@interface FAViewController ()

@end

@implementation FAViewController
{
    NSFileManager *filemgr;
    NSString *dataFilePath;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    filemgr = [NSFileManager defaultManager];
    NSArray *dirPaths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    
    NSString *docsDir = dirPaths[0];
    dataFilePath = [docsDir stringByAppendingPathComponent:@"doc.data"];
    
    NSURL *docURL = [NSURL fileURLWithPath:dataFilePath];
    _document = [[FAMyDocument alloc] initWithFileURL:docURL];
    
    if([filemgr fileExistsAtPath:dataFilePath])
    {
        [[self document] openWithCompletionHandler:^(BOOL success)
        {
            if(success)
            {
                NSLog(@"Opened");
                self.textView.text = self.document.userText;
            }
            else
            {
                NSLog(@"Not Openeded");
            }
        }];
    }
    else
    {
       [[self document] saveToURL:docURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success)
        {
            if(success)
                NSLog(@"Created");
            else
                NSLog(@"Not created");
       } ];
       self.textView.text = @"";
    }
    
//    if([filemgr fileExistsAtPath:dataFilePath])
//    {
//        NSData *buffer =  [filemgr contentsAtPath:dataFilePath];
//        NSString *dataString = [[NSString alloc] initWithData:buffer encoding:NSUTF8StringEncoding];
//        self.textView.text = dataString;
//    }
//    else
//    {
//        self.textView.text = @"";
//    }
//    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveAction:(id)sender {

//    NSData *buffer =  [[[self textView] text] dataUsingEncoding:NSUTF8StringEncoding];
//    [filemgr createFileAtPath:dataFilePath contents:buffer attributes:Nil];
//
    self.document.userText = self.textView.text;
    [[self document] saveToURL:[NSURL fileURLWithPath:dataFilePath] forSaveOperation:UIDocumentSaveForOverwriting
        completionHandler:^(BOOL success) {
            if (success) {
                NSLog(@"Saved");
            } else {
                NSLog(@"Not Saved");
            }
        }];
}



@end
