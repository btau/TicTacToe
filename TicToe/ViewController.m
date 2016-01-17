//
//  ViewController.m
//  TicToe
//
//  Created by Matt Deuschle on 1/14/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *buttonOne;
@property (strong, nonatomic) IBOutlet UIButton *buttonTwo;
@property (strong, nonatomic) IBOutlet UIButton *buttonThree;
@property (strong, nonatomic) IBOutlet UIButton *buttonFour;
@property (strong, nonatomic) IBOutlet UIButton *buttonFive;
@property (strong, nonatomic) IBOutlet UIButton *buttonSix;
@property (strong, nonatomic) IBOutlet UIButton *buttonSeven;
@property (strong, nonatomic) IBOutlet UIButton *buttonEight;
@property (strong, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@property NSString *playerX;
@property NSString *playerO;

@property NSString *currentPlayer;
@property UIColor *currentColor;

@property NSMutableSet *playerXSet;
@property NSMutableSet *playerOSet;
@property NSMutableSet *currentSet;

@property NSArray *winArray;
@property NSArray *buttonArray;

@property BOOL gameWon;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playerX = @"X";
    self.playerO = @"O";
    
    self.currentPlayer = self.playerX;
    self.currentColor = [UIColor blueColor];
    
    self.playerXSet = [NSMutableSet new];
    self.playerOSet = [NSMutableSet new];
    self.currentSet = [NSMutableSet new];
    
    self.winArray = [NSArray new];
    self.buttonArray = @[self.buttonOne, self.buttonTwo, self.buttonThree, self.buttonFour, self.buttonFive, self.buttonSix, self.buttonSeven, self.buttonEight];
    
    self.gameWon = NO;
    
    self.whichPlayerLabel.text = self.currentPlayer;
    self.whichPlayerLabel.textColor = self.currentColor;
}


- (NSString *)whoWon {
    
    NSLog(@"The current set is %@", self.currentSet);
    
    for (NSSet *set in self.winArray) {
        if ([set isSubsetOfSet:self.currentSet]) {
            self.gameWon = YES;
            return self.currentPlayer;
        }
    }
    
    int count = 0;
    for (UIButton *button in self.buttonArray) {
        if (![button.titleLabel.text isEqual:@""]) {
            count += 1;
        }
    }
    
    if (count == 9) {
        return @"Tie";
    }
    
    return @"";
    
}


- (void)gameResults {
        
    if (![[self whoWon] isEqual:@""]) {
        NSLog(@"%@ Won", [self whoWon]);
        
        UIAlertController *winAlert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat: @"%@ Wins!",self.currentPlayer] message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Play Again!" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self viewDidLoad];
        }];
        [winAlert addAction:cancel];
        [self presentViewController:winAlert animated:true completion:nil];
    }
}


- (void)currentPlayerMethod {
    if (self.currentPlayer == self.playerX) {
        self.currentPlayer = self.playerO;
        self.currentColor = [UIColor redColor];
    } else {
        self.currentPlayer = self.playerX;
        self.currentColor = [UIColor blueColor];
    }
    self.whichPlayerLabel.text = self.currentPlayer;
    self.whichPlayerLabel.textColor = self.currentColor;
}


- (void)setWinTable {
    //Checking if X win.
    
    if ([self.buttonOne.titleLabel.text isEqualToString:@"X"] && [self.buttonTwo.titleLabel.text isEqualToString:@"X"] && [self.buttonThree.titleLabel.text isEqualToString:@"X"]) {
        NSLog(@"X Wins");
        self.gameWon = YES;
        
    } else if ([self.buttonFour.titleLabel.text isEqualToString:@"X"] && [self.buttonFive.titleLabel.text isEqualToString:@"X"] && [self.buttonSix.titleLabel.text isEqualToString:@"X"]) {
        NSLog(@"X Wins");
        self.gameWon = YES;
        
    } else if ([self.buttonSeven.titleLabel.text isEqualToString:@"X"] && [self.buttonEight.titleLabel.text isEqualToString:@"X"] && [self.buttonNine.titleLabel.text isEqualToString:@"X"]) {
        NSLog(@"X Wins");
        self.gameWon = YES;
        
    } else if ([self.buttonOne.titleLabel.text isEqualToString:@"X"] && [self.buttonFour.titleLabel.text isEqualToString:@"X"] && [self.buttonSeven.titleLabel.text isEqualToString:@"X"]) {
        NSLog(@"X Wins");
        self.gameWon = YES;
        
    } else if ([self.buttonTwo.titleLabel.text isEqualToString:@"X"] && [self.buttonFive.titleLabel.text isEqualToString:@"X"] && [self.buttonEight.titleLabel.text isEqualToString:@"X"]) {
        NSLog(@"X Wins");
        self.gameWon = YES;
        
    } else if ([self.buttonThree.titleLabel.text isEqualToString:@"X"] && [self.buttonSix.titleLabel.text isEqualToString:@"X"] && [self.buttonNine.titleLabel.text isEqualToString:@"X"]) {
        NSLog(@"X Wins");
        self.gameWon = YES;
        
    } else if ([self.buttonOne.titleLabel.text isEqualToString:@"X"] && [self.buttonFive.titleLabel.text isEqualToString:@"X"] && [self.buttonNine.titleLabel.text isEqualToString:@"X"]) {
        NSLog(@"X Wins");
        self.gameWon = YES;
        
    } else if ([self.buttonThree.titleLabel.text isEqualToString:@"X"] && [self.buttonFive.titleLabel.text isEqualToString:@"X"] && [self.buttonSeven.titleLabel.text isEqualToString:@"X"]) {
        NSLog(@"X Wins");
        self.gameWon = YES;
    }
    
    
    //Checking if O wins
    if ([self.buttonOne.titleLabel.text isEqualToString:@"O"] && [self.buttonTwo.titleLabel.text isEqualToString:@"O"] && [self.buttonThree.titleLabel.text isEqualToString:@"O"]) {
        NSLog(@"O Wins");
        self.gameWon = YES;
    } else if ([self.buttonFour.titleLabel.text isEqualToString:@"O"] && [self.buttonFive.titleLabel.text isEqualToString:@"O"] && [self.buttonSix.titleLabel.text isEqualToString:@"O"]) {
        NSLog(@"O Wins");
        self.gameWon = YES;
    } else if ([self.buttonSeven.titleLabel.text isEqualToString:@"O"] && [self.buttonEight.titleLabel.text isEqualToString:@"O"] && [self.buttonNine.titleLabel.text isEqualToString:@"O"]) {
        NSLog(@"O Wins");
        self.gameWon = YES;
    } else if ([self.buttonOne.titleLabel.text isEqualToString:@"O"] && [self.buttonFour.titleLabel.text isEqualToString:@"O"] && [self.buttonSeven.titleLabel.text isEqualToString:@"O"]) {
        NSLog(@"O Wins");
        self.gameWon = YES;
    } else if ([self.buttonTwo.titleLabel.text isEqualToString:@"O"] && [self.buttonFive.titleLabel.text isEqualToString:@"O"] && [self.buttonEight.titleLabel.text isEqualToString:@"O"]) {
        NSLog(@"O Wins");
        self.gameWon = YES;
    } else if ([self.buttonThree.titleLabel.text isEqualToString:@"O"] && [self.buttonSix.titleLabel.text isEqualToString:@"O"] && [self.buttonNine.titleLabel.text isEqualToString:@"O"]) {
        NSLog(@"O Wins");
        self.gameWon = YES;
    } else if ([self.buttonOne.titleLabel.text isEqualToString:@"O"] && [self.buttonFive.titleLabel.text isEqualToString:@"O"] && [self.buttonNine.titleLabel.text isEqualToString:@"O"]) {
        NSLog(@"O Wins");
        self.gameWon = YES;
    } else if ([self.buttonThree.titleLabel.text isEqualToString:@"O"] && [self.buttonFive.titleLabel.text isEqualToString:@"O"] && [self.buttonSeven.titleLabel.text isEqualToString:@"O"]) {
        NSLog(@"O Wins");
        self.gameWon = YES;
    }
    
}

    
    
    
    
    
    
    
    
//    NSSet *set1 = [NSSet setWithObjects:self.buttonOne.titleLabel.text, self.buttonTwo.titleLabel.text, self.buttonThree.titleLabel.text, nil];
//    NSSet *set2 = [NSSet setWithObjects:self.buttonFour.titleLabel.text, self.buttonFive.titleLabel.text, self.buttonSix.titleLabel.text, nil];
//    NSSet *set3 = [NSSet setWithObjects:self.buttonSeven.titleLabel.text, self.buttonEight.titleLabel.text, self.buttonNine.titleLabel.text, nil];
//    NSSet *set4 = [NSSet setWithObjects:self.buttonOne.titleLabel.text, self.buttonFour.titleLabel.text, self.buttonSeven.titleLabel.text, nil];
//    NSSet *set5 = [NSSet setWithObjects:self.buttonTwo.titleLabel.text, self.buttonFive.titleLabel.text, self.buttonEight.titleLabel.text, nil];
//    NSSet *set6 = [NSSet setWithObjects:self.buttonThree.titleLabel.text, self.buttonSix.titleLabel.text, self.buttonNine.titleLabel.text, nil];
//    NSSet *set7 = [NSSet setWithObjects:self.buttonOne.titleLabel.text, self.buttonFive.titleLabel.text, self.buttonNine.titleLabel.text, nil];
//    NSSet *set8 = [NSSet setWithObjects:self.buttonSeven.titleLabel.text, self.buttonFive.titleLabel.text, self.buttonThree.titleLabel.text, nil];
//    
//    NSLog(@"Set1 is:  %@", set1);
//    
//    self.winArray = @[set1, set2, set3, set4, set5, set6, set7, set8];



- (IBAction)onButtonTapped:(UIButton *)currentButton {
    [currentButton setTitle:self.currentPlayer forState:UIControlStateNormal];
    [currentButton setTitleColor:self.currentColor forState:UIControlStateNormal];

    currentButton.enabled = NO;
    
    
    [self.currentSet addObject:[NSString stringWithFormat:@"%@",currentButton.titleLabel.text]];
    [self whoWon];
    [self currentPlayerMethod];
    [self gameResults];
    [self setWinTable];selel
    
    

}

@end
