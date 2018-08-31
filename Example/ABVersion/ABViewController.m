//
//  ABViewController.m
//  ABVersion
//
//  Created by Alexander Barobin
//  Copyright (c) 2018 Alexander Barobin. All rights reserved.
//

#import "ABViewController.h"
@import ABVersion;

@interface ABViewController ()
@property (weak, nonatomic) IBOutlet UILabel *appVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *systemVersionLabel;
@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    ABVersion *appVersion = ABVersion.applicationVersion;
    self.appVersionLabel.text = [@"App version: " stringByAppendingString:appVersion.formatted];
    
    ABVersion *systemVersion = ABVersion.systemVersion;
    self.systemVersionLabel.text = [@"System version: " stringByAppendingString:systemVersion.formatted];
}

@end
