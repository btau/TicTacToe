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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onButtonTapped:(UIButton *)sender {
}



@end
