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
    //Define adivinhações das maquinas antes da vez do usuario.
    int maxMesa = [self defineMaxMesa:self.jogadores];
    if(self.rodada > 1){
        for (int i = self.rodada; i <= [self.jogadores count]; i++ ) {
            BEPJogador * jogadorAux = self.jogadores[i-1];
            int aux = jogadorAux.palitoMao + arc4random() %(maxMesa - jogadorAux.palitoMao);
            
            //Valida adivinhações repetidas
            while ([self validaAposta:self.jogadores valor:aux] == false) {
               aux = jogadorAux.palitoMao + arc4random() %(maxMesa - jogadorAux.palitoMao);
            }
            jogadorAux.aposta =aux;
            
            //Posiciona adivinhações em seus locais especificos
            switch (i) {
                case 2:
                    [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:self.player1];
                    break;
                case 3:
                    [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:self.player2];
                    break;
                case 4:
                    [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:self.player3];
                    break;
            }
        }
    }
    //preenche os labels das telas
    self.jogador = self.jogadores[0];
    self.valorMaxRec = (maxMesa - (3-self.jogador.palitoMao));
    [self preencheLabel:[NSString stringWithFormat:@"%d",self.jogador.palitoMao] label:self.ValorMin];
    [self preencheLabel:[NSString stringWithFormat:@"%d",self.valorMaxRec] label:self.ValorMax];
    self.jogador.aposta = self.jogador.palitoMao;
    [self preencheLabel:[NSString stringWithFormat:@"%d",self.jogador.aposta] label:self.Aposta];
    
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


-(int)defineMaxMesa:(NSMutableArray *)jogadores{
    int soma = 0;
    for(int i = 0; i < 4; i++){
        BEPJogador * jogador = jogadores[0];
        soma += jogador.max;
    }
    return soma;
}

-(int)defineMinMesa:(NSMutableArray *)jogadores{
    int soma = 0;
    for(int i = 0; i < 4; i++){
        BEPJogador * jogador = jogadores[0];
        soma += jogador.palitoMao;
    }
    return soma - 6;
}

-(void)preencheLabel:(NSString *)texto label:(UILabel *)label{
    label.text = texto;
}

-(BOOL)validaAposta:(NSMutableArray*)jogadores valor:(int) valor{
    for (int i = 0; i < [jogadores count]; i++) {
        BEPJogador *jogador = jogadores[i];
        if(jogador.aposta == valor)
            return  false;
    }
    return true;
}

- (IBAction)VerResultado:(id)sender {;
    //define adivinhações das maquinas apos a aposta do usuario
    int maxMesa = [self defineMaxMesa:self.jogadores];
    for (int i = 2; i <= (5-self.rodada); i++ ) {
        BEPJogador * jogadorAux = self.jogadores[i-1];
        int aux = jogadorAux.palitoMao + arc4random() %(maxMesa - jogadorAux.palitoMao);
        
        //Valida adivinhações repetidas
        while ([self validaAposta:self.jogadores valor:aux] == false) {
            aux = jogadorAux.palitoMao + arc4random() %(maxMesa - jogadorAux.palitoMao);
        }
        jogadorAux.aposta =aux;
        //Apresenta as adivinhações em seus campos especificos
        switch (i) {
            case 2:
                [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:self.player1];
                break;
            case 3:
                [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:self.player2];
                break;
            case 4:
                [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:self.player3];
                break;
        }
    }
    sleep(500);

}
@end
