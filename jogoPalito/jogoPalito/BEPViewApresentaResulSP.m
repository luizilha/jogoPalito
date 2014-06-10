//
//  BEPViewApresentaResulSP.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 05/06/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPViewApresentaResulSP.h"
#import "BEPPalitosMaoViewController.h"

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
    int resul;
    int vencedorAux;
    [self preencheLabel:self.qtdPalitosPlayer aposta:self.apostaPlayer jogador:self.jogadores[0]];
    [self preencheLabel:self.qtdPalitosA1 aposta:self.apostaA1 jogador:self.jogadores[1]];
    [self preencheLabel:self.qtdPalitosA2 aposta:self.apostaA2 jogador:self.jogadores[2]];
    [self preencheLabel:self.qtdPalitosA3 aposta:self.apostaA3 jogador:self.jogadores[3]];
    resul = [self revelaResultado:self.resultado jogadores:self.jogadores];
    vencedorAux = [self revelaVencedor:self.vencedor and:self.jogadores and:resul];
    switch (vencedorAux) {
        case 0:
            [self subtraiVencedor:self.qtdPalitosPlayer and:self.apostaPlayer and: [[self.jogadores objectAtIndex:0] max]-1];
            break;
        case 1:
            [self subtraiVencedor:self.qtdPalitosA1 and:self.apostaA1 and: [[self.jogadores objectAtIndex:1] max]-1];
            break;
        case 2:
            [self subtraiVencedor:self.qtdPalitosA2 and:self.apostaA2 and: [[self.jogadores objectAtIndex:2] max]-1];
            break;
        case 3:
            [self subtraiVencedor:self.qtdPalitosA3 and:self.apostaA3 and: [[self.jogadores objectAtIndex:3] max]-1];
            break;
    }
    sleep(1000);
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
    int tSleep = 50;
    for (BEPJogador * jogador in jogadores ) {
        max += jogador.max;
        resul += jogador.palitoMao;
    }
    
    for (int i = 0; i < 70; i++) {
        resultado.text = [NSString stringWithFormat:@"%d",arc4random()%max];
        sleep(tSleep);
        tSleep += 10;
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

-(void) subtraiVencedor:(UILabel *)palitos and:(UILabel *)aposta and:(int)qtdPalitos{
    palitos.text = [NSString stringWithFormat:@"%d",qtdPalitos];
    aposta.backgroundColor = [UIColor yellowColor];
}

- (IBAction)botaoOk:(id)sender {
    if(([[self.jogadores objectAtIndex:0] max] == 0) || ([[self.jogadores objectAtIndex:1] max] == 1) || ([[self.jogadores objectAtIndex:2] max] == 0) || ([[self.jogadores objectAtIndex:0] max] == 3)){
        
    }
    else{
        BEPPalitosMaoViewController *v = [[BEPPalitosMaoViewController alloc] init];
        v.rodada = self.rodada;
        v.jogadores = self.jogadores;
        [self.navigationController pushViewController:v animated:YES];
    }
}
@end
