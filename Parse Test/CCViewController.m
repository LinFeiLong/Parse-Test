//
//  CCViewController.m
//  Parse Test
//
//  Created by Fernand LIME on 20/07/14.
//  Copyright (c) 2014 Code Coalition. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    PFObject *loginCredentials = [PFObject objectWithClassName:@"LoginCredentials"];
    loginCredentials[@"name"] = self.usernameTextField.text;
    loginCredentials[@"password"] = self.passwordTextField.text;
    
    [loginCredentials saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Save" message:@"Your object saved" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            NSLog(@"save successful");
        }
        else if (error){
            NSLog(@"%@", error);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveUserButtonPressed:(UIButton *)sender
{
    
}

@end
