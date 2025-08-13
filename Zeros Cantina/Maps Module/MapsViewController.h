//
//  MapsViewController.h
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 13.08.2025.
//

#ifndef MapsViewController_h
#define MapsViewController_h
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class MapsRouter;

@interface MapsViewController : UIViewController
@property (nonatomic, weak) MapsRouter *router;
@end

#endif
