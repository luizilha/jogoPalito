//
//  BEPViewDefineAposta.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 04/06/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPViewDefineAposta.h"

@interface BEPViewDefineAposta ()

@end

@implementation BEPViewDefineAposta

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.valorMaxRec = (12 - (3-self.valorMinRec));
    self.ValorMin.text = [NSString stringWithFormat:@"%d",self.valorMinRec];
    self.ValorMax.text = [NSString stringWithFormat:@"%d",self.valorMaxRec];
    self.valorAposta = self.valorMinRec;
    self.Aposta.text = [NSString stringWithFormat:@"%d",self.valorAposta];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)IncrementaAposta:(id)sender {
    if (self.valorAposta < self.valorMaxRec) {
        self.valorAposta++;
        self.Aposta.text = [NSString stringWithFormat:@"%d",self.valorAposta];
    }
}

- (IBAction)descrementaAposta:(id)sender {
    if (self.valorAposta > self.valorMinRec) {
        self.valorAposta--;
        self.Aposta.text = [NSString stringWithFormat:@"%d",self.valorAposta];
    }
}

- (IBAction)VerResultado:(id)sender {
}
@end
