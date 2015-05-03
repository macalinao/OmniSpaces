//
//  AppDelegate.m
//  OmniSpaces
//
//  Created by Ian Macalinao on 5/2/15.
//  Copyright (c) 2015 Ian Macalinao. All rights reserved.
//

#import "AppDelegate.h"

@import AppKit;

@interface AppDelegate ()

@property (strong, nonatomic) NSStatusItem *item;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // Create status item
    _item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _item.title = @"Test";
    
    _item.menu = [self createMenu];
    
    NSLog(@"Asdf");
}

- (NSMenu *) createMenu{
    NSMenu *menu = [[NSMenu alloc] init];
    [menu addItemWithTitle:@"Workspace 1" action:@selector(switchWorkspace:) keyEquivalent:@""];
    return menu;
}

- (IBAction)switchWorkspace:(id)sender {
    if (![sender isKindOfClass:[NSMenuItem class]]) return;
    NSMenuItem *item = (NSMenuItem *) sender;
    
    int workspace = [[[item.title componentsSeparatedByString:@" "] lastObject] intValue];
    
    NSLog(@"%d", workspace);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Remove status item from bar
    [[NSStatusBar systemStatusBar] removeStatusItem:_item];
    _item = nil;
}

@end
