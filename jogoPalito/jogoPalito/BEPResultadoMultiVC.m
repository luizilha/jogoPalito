//
//  BEPResultadoMultiVC.m
//  jogoPalito
//
//  Created by luiz ilha on 6/20/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPResultadoMultiVC.h"
#import "BEPJogador.h"
#import "BEPPalitosMaoViewController.h"
#import "BEPViewMain.h"
@interface BEPResultadoMultiVC ()

@end

@implementation BEPResultadoMultiVC

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
    int soma = 0;
    for (BEPJogador *jogador in self.jogadores) {
        soma += jogador.palitoMao;
    }
    int i = 1;
    BOOL vencedor = NO;
    for (BEPJogador *jogador in self.jogadores) {
        if (jogador.aposta == soma) {
            self.lblVencedor.textColor = [UIColor greenColor];
            if (jogador.max-1 == 0) {
                self.lblVencedor.text = [NSString stringWithFormat:@"Jogador %d", i];
                self.imgCerveja.hidden = NO;
                self.botao.titleLabel.text = @"ACABOU";
                self.acabou = YES;
            } else {
                self.acabou = NO;
                self.lblVencedor.text = [NSString stringWithFormat:@"Jogador %d",i];
            }
            jogador.max = jogador.max-1;
            vencedor = YES;
            break;
        }
        i++;
    }
    if (!vencedor) {
        self.lblVencedor.textColor = [UIColor redColor];
        self.lblVencedor.text = @"NINGUEM ACERTOU";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)proximaRodada:(id)sender
{
    if (self.acabou) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        return;
    }
    BEPPalitosMaoViewController *palitos = [[BEPPalitosMaoViewController alloc] init];
    palitos.jogadores = self.jogadores;
    [self.navigationController pushViewController:palitos animated:YES];
}
@end
