//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Albert on 03/11/17.
//  Copyright © 2017 Albert. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController

//- (void)viewDidLoad{
//    [super viewDidLoad];
//    self.textToAnalize = [[NSAttributedString alloc] initWithString:@"test" attributes:@{NSForegroundColorAttributeName:[UIColor greenColor], NSStrokeWidthAttributeName:@-3}];
//}

- (void)setTextToAnailze:(NSAttributedString *)textToAnalize{
    _textToAnalize = textToAnalize;
    // if self.view.window is null the screen is not loaded
    if(self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void)updateUI{
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%ld coloful characters", (long)[[self characetsWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%ld outlined characters", (long)[[self characetsWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *)characetsWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    int index = 0;
    while(index < [self.textToAnalize length]){
        NSRange range;
        id value = [self.textToAnalize attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalize attributedSubstringFromRange:range]];
            index = (int)range.location + (int)range.length;
        }else{
            index++;
        }
    }
    return characters;
}



@end
