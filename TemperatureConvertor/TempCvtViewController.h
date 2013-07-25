//
//  TempCvtViewController.h
//  TemperatureConvertor
//
//  Created by Jinyao Xu on 7/24/13.
//  Copyright (c) 2013 Jinyao Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempCvtViewController : UIViewController <UITextFieldDelegate>

@property(strong , nonatomic) IBOutlet UITextField * celTextField;
@property(strong , nonatomic) IBOutlet UITextField * fahTextField;
@property(strong , nonatomic) IBOutlet UITableViewCell * selectionCell;
@property(strong , nonatomic) IBOutlet UIButton * convertButton;

- (void) downButton;

@end
