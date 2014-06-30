//
//  BEPApostaMultiViewController.m
//  jogoPalito
//
//  Created by Luiz Ilha Moschem on 6/16/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPApostaMultiViewController.h"
#import "BEPResultadoMultiVC.h"

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
    BEPJogador *jogador = [self.jogadores objectAtIndex: self.rodada];
    [self.imprementador setMaximumValue:self.jogadores.count * 3];
    [self.imprementador setMinimumValue: jogador.palitoMao];
    [self.lblQtdeJogadores setText:self.qtdJogadores];
    [self.lblPontuacaoJogadores setText:self.chuteJogadores];
    [self.lblTitulo setBackgroundColor:[UIColor orangeColor]];
    [self.lblTitulo setText:[NSString stringWithFormat:@"Jogador %d", self.rodada+1]];
//    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aposta:(id) sender
{
    UIStepper *action = (UIStepper *) sender;
    [self.lblValorAposta setText:[NSString stringWithFormat:@"%d",(int) action.value]];
}

- (IBAction)chute:(id)sender
{
    int aposta = self.lblValorAposta.text.intValue;
    [self.jogadores[self.rodada] setAposta:aposta];
    if (self.rodada+1 == self.jogadores.count) {
        BEPResultadoMultiVC *resultado = [[BEPResultadoMultiVC alloc] init];
        resultado.jogadores = self.jogadores;
        [self.navigationController pushViewController:resultado animated:YES];
    } else {
        BEPApostaMultiViewController *novo = [[BEPApostaMultiViewController alloc] init];
        novo.jogadores = self.jogadores;
        novo.rodada = self.rodada+1;
        novo.lblQtdeJogadores = self.lblQtdeJogadores;
        [self.navigationController pushViewController:novo animated:YES];
    }
}

@end
