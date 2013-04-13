//
//  ZSTableView.m
//  ePub Reader
//
//  Created by Steven Zhang on 9/4/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//
//  Handling "Delete" key

#import "ZSTableView.h"

@implementation ZSTableView

- (void)keyDown:(NSEvent *)event
{
    // Based on LTKeyPressTableView.
    //https://github.com/jacobx/thoughtkit/blob/master/LTKeyPressTableView
    
    id delegate = [self delegate];
    
    // (removed unused LTKeyPressTableView code)
    
    unichar key = [[event charactersIgnoringModifiers] characterAtIndex:0];
    if(key == NSDeleteCharacter)
    {
        if([self selectedRow] == -1)
        {
            NSBeep();
        }
        
        /*
        BOOL isEditing = ([[self.window firstResponder] isKindOfClass:[NSText class]] && 
                          [[[self.window firstResponder] delegate] isKindOfClass:[IRTableView class]]);
        if (!isEditing) 
        {
            [relatedArrayController remove:nil];
            return;
        }
         */
        if ([delegate respondsToSelector:@selector(removeSelectedRow:)]) {
            [delegate performSelector:@selector(removeSelectedRow:) withObject:self];
            return;
        }
        
    }
    
    // still here?
    [super keyDown:event];
}



@end
