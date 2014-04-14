#line 1 "/Users/lxs/Xcode/Project/SwipeSelection/SwipeSelection/SwipeSelection.xm"























#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UITextInput.h>
#import <UIKit/UIGestureRecognizerSubclass.h>


#pragma mark - Headers


@class UIKeyboardTaskExecutionContext;

@interface UIKeyboardTaskQueue : NSObject
@property(retain, nonatomic) UIKeyboardTaskExecutionContext *executionContext;

-(BOOL)isMainThreadExecutingTask;
-(void)performTask:(id)arg1;
-(void)waitUntilAllTasksAreFinished;
-(void)addDeferredTask:(id)arg1;
-(void)addTask:(id)arg1;
-(void)promoteDeferredTaskIfIdle;
-(void)performDeferredTaskIfIdle;
-(void)performTaskOnMainThread:(id)arg1 waitUntilDone:(void)arg2;
-(void)finishExecution;
-(void)continueExecutionOnMainThread;
-(void)unlock;
-(BOOL)tryLockWhenReadyForMainThread;
-(void)lockWhenReadyForMainThread;
-(void)lock;
@end

@interface UIKeyboardTaskExecutionContext : NSObject
@property(readonly, nonatomic) UIKeyboardTaskQueue *executionQueue;

-(void)transferExecutionToMainThreadWithTask:(id)arg1;
-(void)returnExecutionToParent;
-(id)childWithContinuation:(id)arg1;
-(id)initWithParentContext:(id)arg1 continuation:(id)arg2;
-(id)initWithExecutionQueue:(id)arg1;
@end







@protocol UITextInputPrivate <UITextInput, UITextInputTokenizer> 
-(BOOL)shouldEnableAutoShift;
-(NSRange)selectionRange;
-(CGRect)rectForNSRange:(NSRange)nsrange;
-(NSRange)_markedTextNSRange;





-(void)moveBackward:(unsigned)backward;
-(void)moveForward:(unsigned)forward;
-(unsigned short)characterBeforeCaretSelection;
-(id)wordContainingCaretSelection;
-(id)wordRangeContainingCaretSelection;
-(id)markedText;
-(void)setMarkedText:(id)text;
-(BOOL)hasContent;
-(void)selectAll;
-(id)textColorForCaretSelection;
-(id)fontForCaretSelection;
-(BOOL)hasSelection;


-(CGRect)caretRect;
-(void)_scrollRectToVisible:(CGRect)visible animated:(BOOL)animated;
@end




@interface UIKBShape : NSObject
@end

@interface UIKBKey : UIKBShape
@property(copy) NSString * name;
@property(copy) NSString * representedString;
@property(copy) NSString * displayString;
@property(copy) NSString * displayType;
@property(copy) NSString * interactionType;
@property(copy) NSString * variantType;

@property(copy) NSString * overrideDisplayString;
@property(copy) NSString * clientVariantRepresentedString;
@property(copy) NSString * clientVariantActionName;
@property BOOL visible;
@property BOOL hidden;
@property BOOL disabled;
@property BOOL isGhost;
@property int splitMode;
@end



@interface UIKBTree : NSObject <NSCopying>
+(id)keyboard;
+(id)key;
+(id)shapesForControlKeyShapes:(id)arg1 options:(int)arg2;
+(id)mergeStringForKeyName:(id)arg1;
+(BOOL)shouldSkipCacheString:(id)arg1;
+(id)stringForType:(int)arg1;
+(id)treeOfType:(int)arg1;
+(id)uniqueName;

@property(retain, nonatomic) NSString *layoutTag;
@property(retain, nonatomic) NSMutableDictionary *cache;
@property(retain, nonatomic) NSMutableArray *subtrees;
@property(retain, nonatomic) NSMutableDictionary *properties;
@property(retain, nonatomic) NSString *name;
@property(nonatomic) int type;

- (BOOL)isLeafType;
- (BOOL)usesKeyCharging;
- (BOOL)usesAdaptiveKeys;
- (BOOL)modifiesKeyplane;
- (BOOL)avoidsLanguageIndicator;
- (BOOL)isAlphabeticPlane;
- (BOOL)noLanguageIndicator;
- (BOOL)isLetters;
- (BOOL)subtreesAreOrdered;

@end


@interface UIKeyboardLayout : UIView
-(UIKBKey*)keyHitTest:(CGPoint)point;
@end

@interface UIKeyboardLayoutStar : UIKeyboardLayout

-(id)keyHitTest:(CGPoint)arg1;
-(id)keyHitTestWithoutCharging:(CGPoint)arg1;
-(id)keyHitTestClosestToPoint:(CGPoint)arg1;
-(id)keyHitTestContainingPoint:(CGPoint)arg1;

-(BOOL)SS_shouldSelect;
-(BOOL)SS_disableSwipes;
-(BOOL)isShiftKeyBeingHeld;
-(void)deleteAction;
@end


@interface UIKeyboardImpl : UIView
+(UIKeyboardImpl*)sharedInstance;
+(UIKeyboardImpl*)activeInstance;
@property (readonly, assign, nonatomic) UIResponder <UITextInputPrivate> *privateInputDelegate;
@property (readonly, assign, nonatomic) UIResponder <UITextInput> *inputDelegate;
-(BOOL)isLongPress;
-(id)_layout;
-(BOOL)callLayoutIsShiftKeyBeingHeld;
-(void)_KHKeyboardGestureDidPan:(UIPanGestureRecognizer*)gesture;
-(void)handleDelete;
-(void)handleDeleteAsRepeat:(BOOL)repeat;
-(void)handleDeleteWithNonZeroInputCount;
-(void)stopAutoDelete;
-(BOOL)handwritingPlane;
@end


@interface UIFieldEditor : NSObject
+(UIFieldEditor*)sharedFieldEditor;
-(void)revealSelection;
@end


@interface UIWebDocumentView : UIView
-(void)_scrollRectToVisible:(CGRect)visible animated:(BOOL)animated;
-(void)scrollSelectionToVisible:(BOOL)visible;
@end


@interface UIView(Private_text) <UITextInput>
-(NSRange)selectedRange;
-(NSRange)selectionRange;
-(void)setSelectedRange:(NSRange)range;
-(void)setSelectionRange:(NSRange)range;
-(void)scrollSelectionToVisible:(BOOL)arg1;
-(CGRect)rectForSelection:(NSRange)range;
-(CGRect)textRectForBounds:(CGRect)rect;
@end














#pragma mark - Helper functions

UITextPosition *KH_MovePositionDirection(id <UITextInput, UITextInputTokenizer> tokenizer, UITextPosition *startPosition, UITextLayoutDirection direction){
    if (tokenizer && startPosition) {
        return [tokenizer positionFromPosition:startPosition inDirection:direction offset:1];
    }
    return nil;
}










BOOL KH_positionsSame(id <UITextInput, UITextInputTokenizer> tokenizer, UITextPosition *position1, UITextPosition *position2){
    return ([tokenizer comparePosition:position1 toPosition:position2] == NSOrderedSame);
}



float KH_PositiveFloat(float x){
	if (x<0) {
		x = -x;
    }
	return x;
}



#pragma mark - GestureRecognizer
@interface SSPanGestureRecognizer : UIPanGestureRecognizer
@end




#include <logos/logos.h>
#include <substrate.h>
@class UIKeyboardImpl; @class UIKeyboardLayoutStar; 
static id (*_logos_orig$_ungrouped$UIKeyboardImpl$initWithFrame$)(UIKeyboardImpl*, SEL, CGRect); static id _logos_method$_ungrouped$UIKeyboardImpl$initWithFrame$(UIKeyboardImpl*, SEL, CGRect); static void _logos_method$_ungrouped$UIKeyboardImpl$SS_KeyboardGestureDidPan$(UIKeyboardImpl*, SEL, UIPanGestureRecognizer*); static BOOL (*_logos_orig$_ungrouped$UIKeyboardImpl$isLongPress)(UIKeyboardImpl*, SEL); static BOOL _logos_method$_ungrouped$UIKeyboardImpl$isLongPress(UIKeyboardImpl*, SEL); static void (*_logos_orig$_ungrouped$UIKeyboardImpl$handleDelete)(UIKeyboardImpl*, SEL); static void _logos_method$_ungrouped$UIKeyboardImpl$handleDelete(UIKeyboardImpl*, SEL); static void (*_logos_orig$_ungrouped$UIKeyboardImpl$handleDeleteAsRepeat$executionContext$)(UIKeyboardImpl*, SEL, BOOL, UIKeyboardTaskExecutionContext*); static void _logos_method$_ungrouped$UIKeyboardImpl$handleDeleteAsRepeat$executionContext$(UIKeyboardImpl*, SEL, BOOL, UIKeyboardTaskExecutionContext*); static void (*_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesBegan$withEvent$)(UIKeyboardLayoutStar*, SEL, NSSet *, UIEvent *); static void _logos_method$_ungrouped$UIKeyboardLayoutStar$touchesBegan$withEvent$(UIKeyboardLayoutStar*, SEL, NSSet *, UIEvent *); static void (*_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesMoved$withEvent$)(UIKeyboardLayoutStar*, SEL, NSSet *, UIEvent *); static void _logos_method$_ungrouped$UIKeyboardLayoutStar$touchesMoved$withEvent$(UIKeyboardLayoutStar*, SEL, NSSet *, UIEvent *); static void (*_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesCancelled$withEvent$)(UIKeyboardLayoutStar*, SEL, id, id); static void _logos_method$_ungrouped$UIKeyboardLayoutStar$touchesCancelled$withEvent$(UIKeyboardLayoutStar*, SEL, id, id); static void (*_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesEnded$withEvent$)(UIKeyboardLayoutStar*, SEL, NSSet *, UIEvent *); static void _logos_method$_ungrouped$UIKeyboardLayoutStar$touchesEnded$withEvent$(UIKeyboardLayoutStar*, SEL, NSSet *, UIEvent *); static BOOL _logos_method$_ungrouped$UIKeyboardLayoutStar$SS_shouldSelect(UIKeyboardLayoutStar*, SEL); static BOOL _logos_method$_ungrouped$UIKeyboardLayoutStar$SS_disableSwipes(UIKeyboardLayoutStar*, SEL); 

#line 264 "/Users/lxs/Xcode/Project/SwipeSelection/SwipeSelection/SwipeSelection.xm"
#pragma mark - Hooks


static id _logos_method$_ungrouped$UIKeyboardImpl$initWithFrame$(UIKeyboardImpl* self, SEL _cmd, CGRect rect){
    id orig = _logos_orig$_ungrouped$UIKeyboardImpl$initWithFrame$(self, _cmd, rect);
    
    if (orig){
        SSPanGestureRecognizer *pan = [[SSPanGestureRecognizer alloc] initWithTarget:self action:@selector(SS_KeyboardGestureDidPan:)];
        pan.cancelsTouchesInView = NO;
        [self addGestureRecognizer:pan];
        [pan release];
    }
    
    return orig;
}


static void _logos_method$_ungrouped$UIKeyboardImpl$SS_KeyboardGestureDidPan$(UIKeyboardImpl* self, SEL _cmd, UIPanGestureRecognizer* gesture){
    
    static UITextRange *startingtextRange = nil;
    static CGPoint previousPosition;
    
    
    static BOOL shiftHeldDown = NO;
    static BOOL hasStarted = NO;
    static BOOL longPress = NO;
    static BOOL handWriting = NO;
    static BOOL haveCheckedHand = NO;
    static BOOL isFirstShiftDown = NO; 
	static BOOL isMoreKey = NO;
    static NSInteger touchesWhenShiting = 0;
	static BOOL cancelled = NO;
	
    NSInteger touchesCount = [gesture numberOfTouches];
    
    UIKeyboardImpl *keyboardImpl = self;
    
    if ([keyboardImpl respondsToSelector:@selector(isLongPress)]) {
        BOOL nLongTouch = [keyboardImpl isLongPress];
        if (nLongTouch) {
            longPress = nLongTouch;
        }
    }
	
	
    id currentLayout = nil;
    if ([keyboardImpl respondsToSelector:@selector(_layout)]) {
        currentLayout = [keyboardImpl _layout];
    }
    
	
	if ([currentLayout respondsToSelector:@selector(SS_disableSwipes)] && !isMoreKey) {
		isMoreKey = [currentLayout SS_disableSwipes];
	}
	
	
    if ([currentLayout respondsToSelector:@selector(handwritingPlane)] && !haveCheckedHand) {
        handWriting = [currentLayout handwritingPlane];
	}
	else if ([currentLayout respondsToSelector:@selector(subviews)] && !handWriting && !haveCheckedHand) {
        NSArray *subviews = [((UIView*)currentLayout) subviews];
        for (UIView *subview in subviews) {
			
            if ([subview respondsToSelector:@selector(subviews)]) {
                NSArray *arrayToCheck = [subview subviews];
				
                for (id view in arrayToCheck) {
                    NSString *classString = [NSStringFromClass([view class]) lowercaseString];
                    NSString *substring = [@"Handwriting" lowercaseString];
					
                    if ([classString rangeOfString:substring].location != NSNotFound) {
                        handWriting = YES;
                        break;
                    }
                }
            }
        }
        haveCheckedHand = YES;
    }
    haveCheckedHand = YES;
	
	
	
	
	if ([currentLayout respondsToSelector:@selector(SS_shouldSelect)] && !shiftHeldDown) {
		shiftHeldDown = [currentLayout SS_shouldSelect];
        isFirstShiftDown = YES;
        touchesWhenShiting = touchesCount;
	}
	
	
	
    id <UITextInputPrivate> privateInputDelegate = nil;
    if ([keyboardImpl respondsToSelector:@selector(privateInputDelegate)]) {
        privateInputDelegate = (id)keyboardImpl.privateInputDelegate;
    }
    if (!privateInputDelegate && [keyboardImpl respondsToSelector:@selector(inputDelegate)]) {
        privateInputDelegate = (id)keyboardImpl.inputDelegate;
    }
	
	
	if (privateInputDelegate != nil && [NSStringFromClass([privateInputDelegate class]) isEqualToString:@"VBEmoticonsContentTextView"]) {
		privateInputDelegate = nil;
		cancelled = YES; 
	}
	
	
	
	
	
    if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        if ([privateInputDelegate respondsToSelector:@selector(selectedTextRange)]) {
            UITextRange *range = [privateInputDelegate selectedTextRange];
            if (range && !range.empty) {
                CGRect screenBounds = [UIScreen mainScreen].bounds;
                CGRect rect = CGRectMake(screenBounds.size.width * 0.5, screenBounds.size.height * 0.5, 1, 1);
                
                if ([privateInputDelegate respondsToSelector:@selector(firstRectForRange:)]) {
                    rect = [privateInputDelegate firstRectForRange:range];
                }
                
                UIView *view = nil;
                if ([privateInputDelegate isKindOfClass:[UIView class]]) {
                    view = (UIView*)privateInputDelegate;
                }
                else if ([privateInputDelegate respondsToSelector:@selector(inputDelegate)]) {
                    id v = [keyboardImpl inputDelegate];
                    if (v != privateInputDelegate) {
                        if ([v isKindOfClass:[UIView class]]) {
                            view = (UIView*)v;
                        }
                    }
                }
                
				
                UIMenuController *menu = [UIMenuController sharedMenuController];
                [menu setTargetRect:rect inView:view];
                [menu setMenuVisible:YES animated:YES];
            }
        }
        
		shiftHeldDown = NO;
		isMoreKey = NO;
		longPress = NO;
		hasStarted = NO;
		handWriting = NO;
		haveCheckedHand = NO;
		cancelled = NO;
        
        touchesCount = 0;
        touchesWhenShiting = 0;
        gesture.cancelsTouchesInView = NO;
    }
    else if (longPress || handWriting || !privateInputDelegate || isMoreKey || cancelled) {
        return;
    }
    else if (gesture.state == UIGestureRecognizerStateBegan) {
        previousPosition = [gesture locationInView:self];
        
        if ([privateInputDelegate respondsToSelector:@selector(selectedTextRange)]) {
            [startingtextRange release], startingtextRange = nil;
            startingtextRange = [[privateInputDelegate selectedTextRange] retain];
        }
	}
	else if (gesture.state == UIGestureRecognizerStateChanged) {
        UITextRange *currentRange = startingtextRange;
        if ([privateInputDelegate respondsToSelector:@selector(selectedTextRange)]) {
            currentRange = nil;
            currentRange = [[[privateInputDelegate selectedTextRange] retain] autorelease];
        }
        
        CGPoint position = [gesture locationInView:self];
		CGPoint delta = CGPointMake(position.x - previousPosition.x, position.y - previousPosition.y);
        
        
        CGFloat deadZone = 18;
		if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
			deadZone = 30;
		}
        
        CGFloat positiveX = KH_PositiveFloat(delta.x);
        CGFloat positiveY = KH_PositiveFloat(delta.y);
        
        if ((positiveX < deadZone &&
             positiveY < deadZone &&
             hasStarted == NO) || cancelled) {
            return;
		}
		
        
        gesture.cancelsTouchesInView = YES;
        hasStarted = YES;
        
        
        UITextLayoutDirection textDirection;
       
        if (positiveX > positiveY) {
            if (delta.x < 0)
                textDirection = UITextLayoutDirectionLeft;
            else
                textDirection = UITextLayoutDirectionRight;
        } else {
            if (delta.y < 0)
                textDirection = UITextLayoutDirectionUp;
            else
                textDirection = UITextLayoutDirectionDown;
        }
        
        
        CGFloat xMinimum = 10;
        CGFloat yMinimum = 20;
        
        
        BOOL extendRange = shiftHeldDown;
        
        static UITextPosition *pivotPoint = nil;
        
        
        UITextPosition *positionStart = currentRange.start;
        UITextPosition *positionEnd = currentRange.end;
        
        
        UITextPosition *_position = nil;
        
        
        if (isFirstShiftDown) {
            [pivotPoint release], pivotPoint = nil;
            if (delta.x > 0 || delta.y < -20) {
                pivotPoint = [positionStart retain];
            }
            else {
                pivotPoint = [positionEnd retain];
            }
        }
        if (extendRange && pivotPoint) {
            
            BOOL startIsPivot = KH_positionsSame(privateInputDelegate, pivotPoint, positionStart);
            if (startIsPivot) {
                _position = positionEnd;
            }
            else {
                _position = positionStart;
            }
        }
        else {
            _position = (delta.x > 0) ? positionEnd : positionStart;
            
            if (!pivotPoint) {
                pivotPoint = _position;
            }
        }
        
		
        id <UITextInputTokenizer, UITextInput> tokenizer = nil;
        if ([privateInputDelegate respondsToSelector:@selector(positionFromPosition:toBoundary:inDirection:)])
            tokenizer = privateInputDelegate;
        else if ([privateInputDelegate respondsToSelector:@selector(tokenizer)])
            tokenizer = (id <UITextInput, UITextInputTokenizer>)privateInputDelegate.tokenizer;
		
        if (tokenizer) {
            UITextPosition *_position_old = _position;
            
            if ([tokenizer respondsToSelector:@selector(positionFromPosition:inDirection:offset:)])
                _position = KH_MovePositionDirection(tokenizer, _position, textDirection);
                
                
            if (!_position || (positiveX < xMinimum && positiveY < yMinimum))
					_position = _position_old;
        }
        
        if (!extendRange && _position) {
            [pivotPoint release], pivotPoint = nil;
            pivotPoint = [_position retain];
        }
        
        
        UITextRange *textRange = startingtextRange = nil;
        if ([privateInputDelegate respondsToSelector:@selector(textRangeFromPosition:toPosition:)]) {
            textRange = [privateInputDelegate textRangeFromPosition:pivotPoint toPosition:_position];
        }
        
        CGPoint oldPrevious = previousPosition;
        
        if (positiveX > xMinimum || positiveY > yMinimum) {
            previousPosition = position;
        }
        
        isFirstShiftDown = NO;
        
        if (textRange && (oldPrevious.x != previousPosition.x || oldPrevious.y != previousPosition.y)) {
            [privateInputDelegate setSelectedTextRange:textRange];
			
			UIFieldEditor *fieldEditor = [objc_getClass("UIFieldEditor") sharedFieldEditor];
			if (fieldEditor && [fieldEditor respondsToSelector:@selector(revealSelection)]) {
				[fieldEditor revealSelection];
			}
			
			if ([privateInputDelegate respondsToSelector:@selector(_scrollRectToVisible:animated:)]) {
				if ([privateInputDelegate respondsToSelector:@selector(caretRect)]) {
					CGRect caretRect = [privateInputDelegate caretRect];
					[privateInputDelegate _scrollRectToVisible:caretRect animated:NO];
				}
			}
			else if ([privateInputDelegate respondsToSelector:@selector(scrollSelectionToVisible:)]) {
				[(UIView*)privateInputDelegate scrollSelectionToVisible:YES];
			}
        }
	}
}




#pragma mark - GestureRecognizer implementation
@implementation SSPanGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventingGestureRecognizer{
    if ([preventingGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer{
    return NO;
}
@end

















static BOOL shiftByOtherKey = NO;
static BOOL isLongPressed = NO;
static BOOL isDeleteKey = NO;
static BOOL isMoreKey = NO;




static void _logos_method$_ungrouped$UIKeyboardLayoutStar$touchesBegan$withEvent$(UIKeyboardLayoutStar* self, SEL _cmd, NSSet * touches, UIEvent * event) {
	UITouch *touch = [touches anyObject];
	
	UIKBKey *keyObject = [self keyHitTest:[touch locationInView:touch.view]];
	NSString *key = [[keyObject representedString] lowercaseString];
	
	
	
	
	if ([key isEqualToString:@"delete"]) {
		isDeleteKey = YES;
	}
	else {
		isDeleteKey = NO;
	}
	
	
	
	if ([key isEqualToString:@"more"]) {
		isMoreKey = YES;
	}
	else {
		isMoreKey = NO;
	}
	
	
	_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesBegan$withEvent$(self, _cmd, touches, event);
}


static void _logos_method$_ungrouped$UIKeyboardLayoutStar$touchesMoved$withEvent$(UIKeyboardLayoutStar* self, SEL _cmd, NSSet * touches, UIEvent * event) {
	UITouch *touch = [touches anyObject];
	
	UIKBKey *keyObject = [self keyHitTest:[touch locationInView:touch.view]];
	NSString *key = [[keyObject representedString] lowercaseString];
	
	
	
	if ([key isEqualToString:@"delete"] ||
		[key isEqualToString:@"ء"]) {
		shiftByOtherKey = YES;
	}
	
	
	if ([key isEqualToString:@"more"]) {
		isMoreKey = YES;
	}
	else {
		isMoreKey = NO;
	}
	
	
	_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesMoved$withEvent$(self, _cmd, touches, event);
}

static void _logos_method$_ungrouped$UIKeyboardLayoutStar$touchesCancelled$withEvent$(UIKeyboardLayoutStar* self, SEL _cmd, id arg1, id arg2) {
	_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesCancelled$withEvent$(self, _cmd, arg1, arg2);
	
	shiftByOtherKey = NO;
	isLongPressed = NO;
	isMoreKey = NO;
}


static void _logos_method$_ungrouped$UIKeyboardLayoutStar$touchesEnded$withEvent$(UIKeyboardLayoutStar* self, SEL _cmd, NSSet * touches, UIEvent * event) {
	_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesEnded$withEvent$(self, _cmd, touches, event);
	
	isDeleteKey = NO;
	
	UITouch *touch = [touches anyObject];
	NSString *key = [[[self keyHitTest:[touch locationInView:touch.view]] representedString] lowercaseString];
	
	
	
	if ([key isEqualToString:@"delete"] && !isLongPressed) {
		UIKeyboardImpl *kb = [UIKeyboardImpl activeInstance];
		if ([kb respondsToSelector:@selector(handleDelete)]) {
			[kb handleDelete];
		}
		else if ([kb respondsToSelector:@selector(handleDeleteAsRepeat:)]) {
			[kb handleDeleteAsRepeat:NO];
		}
		else if ([kb respondsToSelector:@selector(handleDeleteWithNonZeroInputCount)]) {
			[kb handleDeleteWithNonZeroInputCount];
		}
	}
	
	
	shiftByOtherKey = NO;
	isLongPressed = NO;
	isMoreKey = NO;
}


static BOOL _logos_method$_ungrouped$UIKeyboardLayoutStar$SS_shouldSelect(UIKeyboardLayoutStar* self, SEL _cmd){
	return ([self isShiftKeyBeingHeld] || shiftByOtherKey);
}



static BOOL _logos_method$_ungrouped$UIKeyboardLayoutStar$SS_disableSwipes(UIKeyboardLayoutStar* self, SEL _cmd){
	return isMoreKey;
}










static BOOL _logos_method$_ungrouped$UIKeyboardImpl$isLongPress(UIKeyboardImpl* self, SEL _cmd) {
	isLongPressed = _logos_orig$_ungrouped$UIKeyboardImpl$isLongPress(self, _cmd);
	return isLongPressed;
}


static void _logos_method$_ungrouped$UIKeyboardImpl$handleDelete(UIKeyboardImpl* self, SEL _cmd) {
    if (isLongPressed || !isDeleteKey)
        _logos_orig$_ungrouped$UIKeyboardImpl$handleDelete(self, _cmd);
}

static void _logos_method$_ungrouped$UIKeyboardImpl$handleDeleteAsRepeat$executionContext$(UIKeyboardImpl* self, SEL _cmd, BOOL repeat, UIKeyboardTaskExecutionContext* executionContext){
	
	isLongPressed = repeat;
	
	if (!isLongPressed && isDeleteKey) {
		[[executionContext executionQueue] finishExecution];
		return;
	}
	
	_logos_orig$_ungrouped$UIKeyboardImpl$handleDeleteAsRepeat$executionContext$(self, _cmd, repeat, executionContext);
}




static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIKeyboardImpl = objc_getClass("UIKeyboardImpl"); MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardImpl, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$UIKeyboardImpl$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$UIKeyboardImpl$initWithFrame$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIPanGestureRecognizer*), strlen(@encode(UIPanGestureRecognizer*))); i += strlen(@encode(UIPanGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$UIKeyboardImpl, @selector(SS_KeyboardGestureDidPan:), (IMP)&_logos_method$_ungrouped$UIKeyboardImpl$SS_KeyboardGestureDidPan$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardImpl, @selector(isLongPress), (IMP)&_logos_method$_ungrouped$UIKeyboardImpl$isLongPress, (IMP*)&_logos_orig$_ungrouped$UIKeyboardImpl$isLongPress);MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardImpl, @selector(handleDelete), (IMP)&_logos_method$_ungrouped$UIKeyboardImpl$handleDelete, (IMP*)&_logos_orig$_ungrouped$UIKeyboardImpl$handleDelete);MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardImpl, @selector(handleDeleteAsRepeat:executionContext:), (IMP)&_logos_method$_ungrouped$UIKeyboardImpl$handleDeleteAsRepeat$executionContext$, (IMP*)&_logos_orig$_ungrouped$UIKeyboardImpl$handleDeleteAsRepeat$executionContext$);Class _logos_class$_ungrouped$UIKeyboardLayoutStar = objc_getClass("UIKeyboardLayoutStar"); MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardLayoutStar, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$_ungrouped$UIKeyboardLayoutStar$touchesBegan$withEvent$, (IMP*)&_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesBegan$withEvent$);MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardLayoutStar, @selector(touchesMoved:withEvent:), (IMP)&_logos_method$_ungrouped$UIKeyboardLayoutStar$touchesMoved$withEvent$, (IMP*)&_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesMoved$withEvent$);MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardLayoutStar, @selector(touchesCancelled:withEvent:), (IMP)&_logos_method$_ungrouped$UIKeyboardLayoutStar$touchesCancelled$withEvent$, (IMP*)&_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesCancelled$withEvent$);MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardLayoutStar, @selector(touchesEnded:withEvent:), (IMP)&_logos_method$_ungrouped$UIKeyboardLayoutStar$touchesEnded$withEvent$, (IMP*)&_logos_orig$_ungrouped$UIKeyboardLayoutStar$touchesEnded$withEvent$);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$UIKeyboardLayoutStar, @selector(SS_shouldSelect), (IMP)&_logos_method$_ungrouped$UIKeyboardLayoutStar$SS_shouldSelect, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$UIKeyboardLayoutStar, @selector(SS_disableSwipes), (IMP)&_logos_method$_ungrouped$UIKeyboardLayoutStar$SS_disableSwipes, _typeEncoding); }} }
#line 755 "/Users/lxs/Xcode/Project/SwipeSelection/SwipeSelection/SwipeSelection.xm"
