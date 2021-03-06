//
//  BEPViewApresentaResulSP.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 05/06/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPViewApresentaResulSP.h"
#import "BEPPalitosMaoViewController.h"
#import "BEPViewMain.h"


@interface BEPViewApresentaResulSP ()

@end

@implementation BEPViewApresentaResulSP

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
    [self preencheLabel:self.qtdPalitosPlayer aposta:self.apostaPlayer jogador:self.jogadores[0]];
    [self preencheLabel:self.qtdPalitosA1 aposta:self.apostaA1 jogador:self.jogadores[1]];
    [self preencheLabel:self.qtdPalitosA2 aposta:self.apostaA2 jogador:self.jogadores[2]];
    [self preencheLabel:self.qtdPalitosA3 aposta:self.apostaA3 jogador:self.jogadores[3]];
    self.avancarPag.hidden = YES;
    self.terminaJogo.hidden = YES;
    
        // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) preencheLabel:(UILabel *)palitos aposta:(UILabel *)aposta jogador:(BEPJogador *) jogador{
    aposta.text = [NSString stringWithFormat:@"%d",jogador.aposta];
    palitos.text = [NSString stringWithFormat:@"%d",jogador.max];
}

- (int) revelaResultado:(UILabel *)resultado jogadores:(NSMutableArray *) jogadores{
    
    int max = 0;
    int resul = 0;
    for (BEPJogador * jogador in jogadores ) {
        max += jogador.max;
        resul += jogador.palitoMao;
    }
    
    resultado.text = [NSString stringWithFormat:@"%d", resul];
    return resul;
}

-(int) revelaVencedor:(UILabel *)vencedor and:(NSMutableArray *)jogadores and:(int)resultado{
    if (resultado == [[jogadores objectAtIndex:0] aposta]){
        vencedor.text = [NSString stringWithFormat:@"Você"];
        return 0;
    }else if (resultado == [[jogadores objectAtIndex:1] aposta]){
        vencedor.text = [NSString stringWithFormat:@"A1"];
        return 1;
    }else if (resultado == [[jogadores objectAtIndex:2] aposta]){
        vencedor.text = [NSString stringWithFormat:@"A2"];
        return 2;
    }else if (resultado == [[jogadores objectAtIndex:3] aposta]){
        vencedor.text = [NSString stringWithFormat:@"A3"];
        return 3;
    }else{
        vencedor.text = [NSString stringWithFormat:@"Não houve"];
        return 4;
    }
    
}

-(void) subtraiVencedor:(UILabel *)palitos and:(UILabel *)aposta and:(BEPJogador *)jogador{
    palitos.text = [NSString stringWithFormat:@"%d",jogador.max - 1];
    palitos.backgroundColor = [UIColor whiteColor];
    palitos.textColor = [UIColor brownColor];
    aposta.backgroundColor = [UIColor whiteColor];
    aposta.textColor = [UIColor brownColor];
    jogador.max = jogador.max-1;
}

- (IBAction)avancar:(id)sender {
    BEPPalitosMaoViewController *v = [[BEPPalitosMaoViewController alloc] init];
    if (self.rodada == 4) {
        v.rodada = 1;
    }else{
        v.rodada = self.rodada+1;
    }
    for (BEPJogador *jogador in self.jogadores) {
        jogador.aposta = 0;
    }
    v.jogadores = self.jogadores;
    v.modoSingle = YES;
    [self.navigationController pushViewController:v animated:YES];
}

- (IBAction)botaoOk:(id)sender {
    int resul;
    int vencedorAux;
    resul = [self revelaResultado:self.resultado jogadores:self.jogadores];
    vencedorAux = [self revelaVencedor:self.vencedor and:self.jogadores and:resul];
    switch (vencedorAux) {
        case 0:
            [self subtraiVencedor:self.qtdPalitosPlayer and:self.apostaPlayer and: [self.jogadores objectAtIndex:0]] ;
            break;
        case 1:
            [self subtraiVencedor:self.qtdPalitosA1 and:self.apostaA1 and: [self.jogadores objectAtIndex:1]];
            break;
        case 2:
            [self subtraiVencedor:self.qtdPalitosA2 and:self.apostaA2 and: [self.jogadores objectAtIndex:2]];
            break;
        case 3:
            [self subtraiVencedor:self.qtdPalitosA3 and:self.apostaA3 and: [self.jogadores objectAtIndex:3]];
            break;
    }
    resul = [self revelaResultado:self.resultado jogadores:self.jogadores];
    vencedorAux = [self revelaVencedor:self.vencedor and:self.jogadores and:resul];
    if(([[self.jogadores objectAtIndex:0] max] == 0) || ([[self.jogadores objectAtIndex:1] max] == 0) || ([[self.jogadores objectAtIndex:2] max] == 0) || ([[self.jogadores objectAtIndex:0] max] == 0)){
        [self apresentaMensagem:self.jogadores :self.msgVencedor];
        self.terminaJogo.hidden = NO;
        
    }else{
        self.avancarPag.hidden = NO;
    }
}

-(void) apresentaMensagem:(NSMutableArray *)nsJogadores :(UILabel *)msg{
    
    if ([[nsJogadores objectAtIndex:0]max] == 0) {
        msg.text = [NSString stringWithFormat:@"Você venceu o Jogo"];
    }else if ([[nsJogadores objectAtIndex:1]max] == 0) {
        msg.text = [NSString stringWithFormat:@"Jogador A1 venceu o Jogo"];
    }else if ([[nsJogadores objectAtIndex:2]max] == 0) {
        msg.text = [NSString stringWithFormat:@"Jogador A2 venceu o Jogo"];
    }else if ([[nsJogadores objectAtIndex:3]max] == 0) {
        msg.text = [NSString stringWithFormat:@"Jogador A3 venceu o Jogo"];
    }
}
- (IBAction)terminaJogo:(id)sender {
    BEPViewMain *main = [[BEPViewMain alloc]init];
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:main animated:YES];
}
@end
