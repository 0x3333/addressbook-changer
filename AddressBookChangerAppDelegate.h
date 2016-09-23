//
//  AddressBookChangerAppDelegate.h
//  AddressBookChanger
//
//  Created by Tercio F. Gaudencio Filho on 9/23/2016.
//  Copyright 2016 EPIC Consultoria em TI Ltda. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AddressBookChangerAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
