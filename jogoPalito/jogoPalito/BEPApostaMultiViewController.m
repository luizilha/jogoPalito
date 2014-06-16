//
//  BEPApostaMultiViewController.m
//  jogoPalito
//
//  Created by Luiz Ilha Moschem on 6/16/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPApostaMultiViewController.h"

@interface BEPApostaMultiViewController ()

@end

@implementation BEPApostaMultiViewController

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
    BEPJogador *jogador = [self.jogadores objectAtIndex:(int) self.rodada];
    [self.imprementador setMaximumValue:self.jogadores.count * 3];
    [self.imprementador setMinimumValue: jogador.palitoMao];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aposta:(id) sender {
    UIStepper *action = (UIStepper *) sender;
    [self.lblValorAposta setText:[NSString stringWithFormat:@"%d",(int) action.value]];
    
}
@end
