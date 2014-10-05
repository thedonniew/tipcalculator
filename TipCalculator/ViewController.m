//
//  ViewController.m
//  TipCalculator
//
//  Created by Donnie Wang on 9/11/14.
//  Copyright (c) 2014 Donnie Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageSegmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.billAmountTextField.text = @"";
    [self calculateTipAndUpdateInterface];
    
    [_billAmountTextField becomeFirstResponder];
}

- (void)calculateTipAndUpdateInterface {
    double billAmount = self.billAmountTextField.text.doubleValue;
    NSInteger selectedSegmentIndex = self.tipPercentageSegmentControl.selectedSegmentIndex;
    double tipPercentage = [self.tipPercentageSegmentControl titleForSegmentAtIndex:selectedSegmentIndex].doubleValue;
    
    // do some math
    double tipAmount = billAmount * (tipPercentage / 100);
    double totalAmount = tipAmount + billAmount;
    
    // update the UI
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalAmountLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}

- (IBAction)didTapBackground:(UITapGestureRecognizer *)sender {
}

- (IBAction)didTapCalculator:(UIButton *)sender {
    [self calculateTipAndUpdateInterface];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
