/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNCPickerCompManager.h"
#import "RNCPickerComp.h"

#import <React/RCTBridge.h>
#import <React/RCTFont.h>

@implementation RNCPickerCompManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [RNCPickerComp new];
}

RCT_EXPORT_VIEW_PROPERTY(items, NSArray<NSDictionary *>)
RCT_EXPORT_VIEW_PROPERTY(selectedIndex, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(color, UIColor)
RCT_EXPORT_VIEW_PROPERTY(textAlign, NSTextAlignment)
RCT_EXPORT_VIEW_PROPERTY(numberOfLines, NSInteger)
RCT_CUSTOM_VIEW_PROPERTY(fontSize, NSNumber, RNCPickerComp)
{
  view.font = [RCTFont updateFont:view.font withSize:json ?: @(defaultView.font.pointSize)];
}
RCT_CUSTOM_VIEW_PROPERTY(fontWeight, NSString, __unused RNCPickerComp)
{
  view.font = [RCTFont updateFont:view.font withWeight:json]; // defaults to normal
}
RCT_CUSTOM_VIEW_PROPERTY(fontStyle, NSString, __unused RNCPickerComp)
{
  view.font = [RCTFont updateFont:view.font withStyle:json]; // defaults to normal
}
RCT_CUSTOM_VIEW_PROPERTY(fontFamily, NSString, RNCPickerComp)
{
  view.font = [RCTFont updateFont:view.font withFamily:json ?: defaultView.font.familyName];
}
RCT_CUSTOM_VIEW_PROPERTY(themeVariant, NSString, RNCPickerComp)
{
    if (@available(iOS 13.4, *)) {
            if (json) {
                if ([json isEqual:@"dark"])
                    view.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
                else if ([json isEqual:@"light"])
                    view.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
                else
                    view.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
            }
        }
}

@end
