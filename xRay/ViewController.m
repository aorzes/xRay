//
//  ViewController.m
//  xRay
//
//  Created by Anton Orzes on 13/02/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    tijelo = [[UIImageView alloc] init];
    tijelo.image = [UIImage imageNamed:@"tijelo"];
    tijelo.frame = CGRectMake(25, 25, (self.view.frame.size.height-150)*0.5625, self.view.frame.size.height-150);
    [self.view addSubview:tijelo];
    
    tijelo1 = [[UIImageView alloc] init];
    tijelo1.image = [UIImage imageNamed:@"tijelo1"];
    tijelo1.frame = CGRectMake(25, 25, (self.view.frame.size.height-150)*0.5625, self.view.frame.size.height-150);
    [self.view addSubview:tijelo1];
    
    kx=tijelo.image.size.width/tijelo.frame.size.width;
    
    komad = [[UIImageView alloc] init];
    komad.frame = CGRectMake(10, self.view.frame.size.height-110, 100, 100);
    [self.view addSubview:komad];
    
    okviric = [[UIImageView alloc] init];
    okviric.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:okviric];
    
    CALayer *borderLayer = [CALayer layer];
    CGRect borderFrame = CGRectMake(0, 0, okviric.frame.size.width, okviric.frame.size.width);
    [borderLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
    [borderLayer setFrame:borderFrame];
    [borderLayer setCornerRadius:3];
    [borderLayer setBorderWidth:2];
    [borderLayer setBorderColor:[[UIColor blackColor] CGColor]];
    [okviric.layer addSublayer:borderLayer];
    
    okviric.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneMe:)];
    [okviric addGestureRecognizer:panGesture];

   
    
}

-(IBAction)paneMe:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation=[recognizer translationInView:self.view];
    recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x,recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    [self prikazi];
}

-(void) prikazi{

    CGRect pp = okviric.frame;
    
    if(okviric.frame.origin.x<25) {pp.origin.x = 25; okviric.frame = pp;}
    if(okviric.frame.origin.y<25) {pp.origin.y = 25; okviric.frame = pp;}
    
    struct CGImage *slika = tijelo.image.CGImage;
    
    CGPoint polozaj = CGPointMake((okviric.frame.origin.x-25)* kx, (okviric.frame.origin.y-25)* kx);
    CGImageRef ref = CGImageCreateWithImageInRect(slika, CGRectMake(polozaj.x, polozaj.y, 100*kx, 100*kx));
    komad.image = [UIImage imageWithCGImage:ref];
    okviric.image = komad.image;
    
   // NSLog(@"aa");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
