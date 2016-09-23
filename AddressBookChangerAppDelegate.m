//
//  AddressBookChangerAppDelegate.m
//  AddressBookChanger
//
//  Created by Tercio F. Gaudencio Filho on 9/23/2016.
//  Copyright 2016 EPIC Consultoria em TI Ltda. All rights reserved.
//

#import "AddressBookChangerAppDelegate.h"
#import <AddressBook/ABAddressBook.h>
#import <AddressBook/ABPerson.h>
#import <AddressBook/ABMultiValue.h>
#import "RegexKitLite.h"

@implementation AddressBookChangerAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    ABAddressBook* addressBook = [ABAddressBook sharedAddressBook];
    NSArray* people = [addressBook people];
    
    for(ABPerson* person in people)
    {
        NSString* firstName = [person valueForKey: kABFirstNameProperty];
        NSString* lastName = [person valueForKey: kABLastNameProperty];
        NSString* entryName = (firstName == NULL && lastName == NULL) ? [person valueForKey: kABOrganizationProperty] : [NSString stringWithFormat:@"%@ %@", (firstName == NULL) ? @"" : firstName, (lastName == NULL) ? @"" : lastName];
        
        ABMutableMultiValue* phones = [[person valueForKey:kABPhoneProperty] mutableCopy];
        
        BOOL hasLogged = NO;
        for(int i = 0 ; i < [phones count] ; i++)
        {
            NSString* phone = [phones valueAtIndex: i];
            // Cleanup Phone Number, removing spaces(\s), dash(‑|-) and parenthesis().
            phone = [phone stringByReplacingOccurrencesOfRegex:@"(\\s|‑|-|\\(|\\))" withString:@""];
            
            if(!hasLogged) {
                NSLog(@"Person: %@", entryName);
                hasLogged = YES;
            }
            if([phone hasPrefix:@"0"]) {
                if(![phone hasPrefix: @"0800"]) {
                    phone = [phone stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:@"+55"];
                    NSLog(@"%@", phone);
                    [phones replaceValueAtIndex:i withValue:phone];
                    [person setValue:phones forKey:kABPhoneProperty];
                }
            }
        }
        NSLog(@" ");
    }
    
    [addressBook save];
    exit(0);
}

@end
