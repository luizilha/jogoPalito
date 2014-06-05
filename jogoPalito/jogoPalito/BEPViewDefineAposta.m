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
    self.jogador = self.jogadores[0];
    self.valorMaxRec = (12 - (3-self.jogador.palitoMao));
    self.ValorMin.text = [NSString stringWithFormat:@"%d",self.jogador.palitoMao];
    self.ValorMax.text = [NSString stringWithFormat:@"%d",self.valorMaxRec];
    self.jogador.aposta = self.jogador.palitoMao;
    self.Aposta.text = [NSString stringWithFormat:@"%d",self.jogador.aposta];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)IncrementaAposta:(id)sender {
    if (self.jogador.aposta < self.valorMaxRec) {
        self.jogador.aposta++;
        self.Aposta.text = [NSString stringWithFormat:@"%d",self.jogador.aposta];
    }
}

- (IBAction)descrementaAposta:(id)sender {
    if (self.jogador.aposta > self.jogador.palitoMao) {
        self.jogador.aposta--;
        self.Aposta.text = [NSString stringWithFormat:@"%d",self.jogador.aposta];
    }
}



- (IBAction)VerResultado:(id)sender {
}
@end
