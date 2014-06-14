//
//  BEPViewDefineAposta.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 04/06/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPViewDefineAposta.h"
#import "BEPViewApresentaResulSP.h"

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
    self.labels = [[NSMutableArray alloc]init];
    [self.labels addObject:self.player1];
    [self.labels addObject:self.player2];
    [self.labels addObject:self.player3];
    int maxMesa = [self defineMaxMesa:self.jogadores];
    if(self.rodada > 1){
        for (int i = self.rodada; i <= [self.jogadores count]; i++ ) {
            BEPJogador * jogadorAux = self.jogadores[i-1];
            int aux = jogadorAux.palitoMao + arc4random() %(maxMesa - jogadorAux.palitoMao);
            // Valida adivinhações repetidas
            while ([self validaAposta:self.jogadores valor:aux] == false) {
               aux = jogadorAux.palitoMao + arc4random() %(maxMesa - jogadorAux.palitoMao);
            }
            jogadorAux.aposta =aux;
            
            // Posiciona adivinhações em seus locais especificos
            switch (i) {
                case 2:
                    [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:[self.labels objectAtIndex:0]];
                    break;
                case 3:
                    [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:[self.labels objectAtIndex:1]];
                    break;
                case 4:
                    [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:[self.labels objectAtIndex:2]];
                    break;
            }
        }
    }
    //preenche os labels das telas
    self.jogador = [[BEPJogador alloc]init];
    self.valorMaxRec = (maxMesa - (3-[[self.jogadores objectAtIndex:0] palitoMao]));
    [self preencheLabel:[NSString stringWithFormat:@"%d",[[self.jogadores objectAtIndex:0] palitoMao]] label:self.ValorMin];
    [self preencheLabel:[NSString stringWithFormat:@"%d",self.valorMaxRec] label:self.ValorMax];
    self.jogador.aposta =[[self.jogadores objectAtIndex:0]palitoMao];
    [self preencheLabel:[NSString stringWithFormat:@"%d",[[self.jogadores objectAtIndex:0]palitoMao]] label:self.Aposta];
    self.avancarPag.hidden = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)avancar:(id)sender {
    BEPViewApresentaResulSP *viewResul = [[BEPViewApresentaResulSP alloc] init];
    viewResul.rodada = self.rodada;
    viewResul.jogadores = self.jogadores;    
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:viewResul animated:YES];
}

- (IBAction)IncrementaAposta:(id)sender {
    if (self.jogador.aposta < self.valorMaxRec) {
        self.jogador.aposta++;
        self.Aposta.text = [NSString stringWithFormat:@"%d",self.jogador.aposta];
    }
}

- (IBAction)descrementaAposta:(id)sender {
    if (self.jogador.aposta > [[self.jogadores objectAtIndex:0]palitoMao]) {
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
    label.textColor = [UIColor whiteColor];
}

-(BOOL)validaAposta:(NSMutableArray*)jogadores valor:(int) valor{
    for (int i = 0; i < [jogadores count]; i++) {
        BEPJogador *jogador = jogadores[i];
        if(jogador.aposta == valor)
            return  false;
    }
    return true;
}

-(void)terminaPreenchimento:labels
{
    int maxMesa = [self defineMaxMesa:self.jogadores];
    for (int i = 2; i <= (5-self.rodada); i++ ) {
        BEPJogador * jogadorAux = self.jogadores[i-1];
        int aux = jogadorAux.palitoMao + arc4random() %(maxMesa - jogadorAux.palitoMao);
        
        //Valida adivinhações repetidas
        while ([self validaAposta:self.jogadores valor:aux] == false) {
            aux = jogadorAux.palitoMao + arc4random() %(maxMesa - jogadorAux.palitoMao);
        }
        jogadorAux.aposta = aux;
        //Apresenta as adivinhações em seus campos especificos
        [self preencheLabel:[NSString stringWithFormat:@"%d",jogadorAux.aposta] label:[self.labels objectAtIndex:i-2]];
    }
}

- (IBAction)VerResultado:(id)sender {
   
    //define adivinhações das maquinas apos a aposta do usuario
    if ([self validaAposta:self.jogadores valor:self.jogador.aposta]) {
        [self terminaPreenchimento:self.labels];
        BEPJogador *jog = self.jogadores[0];
        jog.aposta = self.jogador.aposta;
        self.avancarPag.hidden = NO;
    }
    
}
@end
