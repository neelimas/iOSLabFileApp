//
//  FAViewController.h
//  FileApp
//
//  Created by user on 11/13/13.
//  Copyright (c) 2013 Classroom. All rights reserved.
//
@class FAMyDocument;
#import <UIKit/UIKit.h>

@interface FAViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property FAMyDocument *document;

@end
