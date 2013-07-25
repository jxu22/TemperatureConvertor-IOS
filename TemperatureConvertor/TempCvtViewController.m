//
//  TempCvtViewController.m
//  TemperatureConvertor
//
//  Created by Jinyao Xu on 7/24/13.
//  Copyright (c) 2013 Jinyao Xu. All rights reserved.
//

#import "TempCvtViewController.h"

@interface TempCvtViewController ()

@property(nonatomic) float cel;
@property(nonatomic) float fah;
@property(nonatomic) BOOL flag;

- (void) convert;
- (BOOL) checkInput:(NSString*) str type:(BOOL) flag;
@end

@implementation TempCvtViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature Convertor";
        self.flag = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.fahTextField.delegate = self;
    self.celTextField.delegate = self;
    
    [self.convertButton addTarget:self action:@selector(convert) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// editing call back
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if(textField == self.fahTextField)
    {
        self.flag = NO;
    }
    
    else
    {
        self.flag = YES;
    }
    return YES;
}

- (BOOL) checkInput:(NSString*) str type:(BOOL) flag
{
    NSString * regex = @"-?([0-9]|[1-9][0-9]*)(.[0-9]+)?";       // regex for float number
    
    if(self.flag == NO)
    {
        str = self.fahTextField.text;
    }
    else
    {
        str = self.celTextField.text;
    }
    
    NSPredicate *inputTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if(![inputTest evaluateWithObject:str])             // check number valid
        return NO;
    
    float chk = [str floatValue];
    if((chk <= -459.67 && flag == NO) || (flag == YES && chk <= -273.15))                                      // check the absolute zero
    {
        return NO;
    }

    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    BOOL flag;
    if(self.flag == NO)
    {
        flag = [self checkInput:self.fahTextField.text type: NO];
    }
    else
    {
        flag = [self checkInput:self.celTextField.text type:YES];
    }
    if(flag == YES)
        [self.view endEditing:YES];
    // call back works
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
   
  //  NSLog(@"here");
    return YES;
}

// core function

- (void) convert
{
    if(self.flag == NO)
    {
        
        float origin = [self.fahTextField.text floatValue];
        float ans = (origin - 32) * 5 / 9;
        self.celTextField.text = [NSString stringWithFormat: @"%0.2f" , ans];
        
    }
    else
    {
        float origin = [self.celTextField.text floatValue];
        float ans = origin * 9 / 5 + 32;
        self.fahTextField.text = [NSString stringWithFormat: @"%0.2f" , ans];
    }
}

@end
