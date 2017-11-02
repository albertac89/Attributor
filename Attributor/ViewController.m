//
//  ViewController.m
//  Attributor
//
//  Created by Albert on 02/11/17.
//  Copyright © 2017 Albert. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@end

@implementation ViewController

- (IBAction)changeBodySelectionColorToMathcBackgorundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}

- (IBAction)outlineBodySelection {
    [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName: @-3,
                                            NSStrokeColorAttributeName: [UIColor blackColor]}
                                   range:self.body.selectedRange];
}
- (IBAction)unnoutilineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
