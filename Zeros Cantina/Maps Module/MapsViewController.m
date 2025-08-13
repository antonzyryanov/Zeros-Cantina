//
//  MapsViewController.m
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 13.08.2025.
//

#import <Foundation/Foundation.h>
#import "MapsViewController.h"
#import "Zeros_Cantina-Swift.h"

@interface MapsViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) UIImageView *bottomImageView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) MKRoute *currentRoute;
@property (nonatomic, strong) UIImageView *closeButtonImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *distanceLabel;


@end

@implementation MapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBGImage];
    [self setupMapView];
    [self setupCloseButton];
    [self setupTimeLabel];
    [self setupDistanceLabel];
    [self setupLocationManager];
    [self setupBottomImage];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.locationManager requestWhenInUseAuthorization];
}

- (void)setupMapView {
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    self.mapView.frame = CGRectMake(32, 32, screenWidth -64, screenHeight-96);
    self.mapView.showsUserLocation = YES;
    self.mapView.backgroundColor = UIColor.clearColor;
    self.mapView.layer.cornerRadius = 16;
    self.mapView.layer.masksToBounds = TRUE;
    [self.view addSubview:self.mapView];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleMapTap:)];
    [self.mapView addGestureRecognizer:tapRecognizer];
}

- (void)setupBGImage {
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    UIImage *backgroundImage = [UIImage imageNamed:@"stars_background"];
    self.backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    self.backgroundImageView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeModule)];
    [self.closeButtonImageView addGestureRecognizer:tapGesture];
    [self.view addSubview:_backgroundImageView];
}

- (void)setupBottomImage {
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    UIImage *bottomImage = [UIImage imageNamed:@"maps_droid"];
    self.bottomImageView = [[UIImageView alloc] initWithImage:bottomImage];
    self.bottomImageView.frame = CGRectMake(screenWidth -250, screenHeight-270, 250, 300);
    self.bottomImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.bottomImageView.userInteractionEnabled = YES;
    [self.view addSubview:self.bottomImageView];
}

- (void)setupCloseButton {
    UIImage *closeImage = [UIImage imageNamed:@"home_icon"];
    self.closeButtonImageView = [[UIImageView alloc] initWithImage:closeImage];
    self.closeButtonImageView.frame = CGRectMake(48, 48, 32, 32);
    self.closeButtonImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.closeButtonImageView.userInteractionEnabled = YES;

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeModule)];
    [self.closeButtonImageView addGestureRecognizer:tapGesture];

    [self.view addSubview:self.closeButtonImageView];
}

- (void)setupTimeLabel {
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 240, 40, 180, 150)];
    self.timeLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.timeLabel.backgroundColor = [UIColor clearColor];
    self.timeLabel.textColor = [UIColor blackColor];
    self.timeLabel.font = [UIFont boldSystemFontOfSize:24];
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel.numberOfLines = 0;
    self.timeLabel.hidden = YES;
    [self.view addSubview:self.timeLabel];
}

- (void)setupDistanceLabel {
    self.distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 240, 240, 180, 150)];
    self.distanceLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.distanceLabel.backgroundColor = [UIColor clearColor];
    self.distanceLabel.textColor = [UIColor blackColor];
    self.distanceLabel.font = [UIFont boldSystemFontOfSize:24];
    self.distanceLabel.textAlignment = NSTextAlignmentRight;
    self.distanceLabel.numberOfLines = 0;
    self.distanceLabel.hidden = YES; 
    [self.view addSubview:self.distanceLabel];
}

- (void)setupLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)closeModule {
    [self.router closeModule];
}

#pragma mark - Handle Map Tap

- (void)handleMapTap:(UITapGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];

    if (self.currentRoute) {
        [self.mapView removeOverlay:self.currentRoute.polyline];
        self.currentRoute = nil;
    }

    CLLocation *userLocation = self.mapView.userLocation.location;
    if (userLocation) {
        [self buildRouteFrom:userLocation.coordinate to:coordinate];
    } else {
        NSLog(@"User location not available yet");
    }
}

- (void)buildRouteFrom:(CLLocationCoordinate2D)source to:(CLLocationCoordinate2D)destination {
    [self.mapView removeOverlays:self.mapView.overlays];

    MKPlacemark *sourcePlacemark = [[MKPlacemark alloc] initWithCoordinate:source];
    MKPlacemark *destPlacemark = [[MKPlacemark alloc] initWithCoordinate:destination];
    MKMapItem *sourceItem = [[MKMapItem alloc] initWithPlacemark:sourcePlacemark];
    MKMapItem *destItem = [[MKMapItem alloc] initWithPlacemark:destPlacemark];

    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = sourceItem;
    request.destination = destItem;
    request.transportType = MKDirectionsTransportTypeAutomobile;

    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error calculating directions: %@", error.localizedDescription);
            return;
        }

        MKRoute *route = response.routes.firstObject;
        self.currentRoute = route;
        [self.mapView addOverlay:route.polyline];

        CLLocationDistance distanceInMeters = route.distance;
        double distanceInKm = distanceInMeters / 1000.0;

        double speedKmh = 80.0;
        double hours = distanceInKm / speedKmh;
        int totalMinutes = (int)(hours * 60);
        int hoursPart = totalMinutes / 60;
        int minutesPart = totalMinutes % 60;

        NSString *timeString = [NSString stringWithFormat:@"%02d Hours\n %02d Minutes", hoursPart, minutesPart];

        self.timeLabel.text = [NSString stringWithFormat:@"Time to destination:\n %@\n (80 km/h)", timeString];
        self.timeLabel.hidden = NO;
        
        NSString *distanceString = [NSString stringWithFormat:@"%.1f km", distanceInKm];
        
        self.distanceLabel.text = [NSString stringWithFormat:@"Distance to\n destination:\n%@\n", distanceString];
        self.distanceLabel.hidden = NO;

        MKMapRect rect = route.polyline.boundingMapRect;
        [self.mapView setVisibleMapRect:rect edgePadding:UIEdgeInsetsMake(20, 20, 20, 20) animated:YES];
    }];
}

#pragma mark - MKMapViewDelegate
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        renderer.strokeColor = [UIColor yellowColor];
        renderer.lineWidth = 4.0;
        return renderer;
    }
    return nil;
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [self.locationManager startUpdatingLocation];
        self.mapView.showsUserLocation = YES;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations.lastObject;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000);
    [self.mapView setRegion:region animated:YES];
    [self.locationManager stopUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        static NSString *identifier = @"UserLocation";
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.image = [self yellowDotImage];
        return annotationView;
    }
    return nil;
}

- (UIImage *)yellowDotImage {
    CGSize size = CGSizeMake(20, 20);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor yellowColor] setFill];
    CGContextFillEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
