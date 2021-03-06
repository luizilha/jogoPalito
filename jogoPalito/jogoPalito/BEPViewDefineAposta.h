//
//  BEPViewDefineAposta.h
//  jogoPalito
//
//  Created by Neyllor Barbosa on 04/06/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEPJogador.h"

@interface BEPViewDefineAposta : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ValorMin;
@property (weak, nonatomic) IBOutlet UILabel *Aposta;
@property (weak, nonatomic) IBOutlet UILabel *ValorMax;
@property (weak, nonatomic) IBOutlet UILabel *player1;
@property (weak, nonatomic) IBOutlet UILabel *player2;
@property (weak, nonatomic) IBOutlet UILabel *player3;
@property (weak, nonatomic) IBOutlet UIButton *avancarPag;
@property (weak, nonatomic) IBOutlet UILabel *alerta;
@property (weak, nonatomic) IBOutlet UIButton *incrementaAposta;
@property (weak, nonatomic) IBOutlet UIButton *descrementaAposta;

@property(nonatomic) NSMutableArray *jogadores;
@property(nonatomic) BEPJogador *jogador;
@property(nonatomic) int valorMaxRec;
@property(nonatomic) int jogadorPrim;
@property(nonatomic) int rodada;
@property(nonatomic) NSMutableArray *labels;


- (IBAction)avancar:(id)sender;
- (IBAction)IncrementaAposta:(id)sender;
- (IBAction)descrementaAposta:(id)sender;
- (IBAction)VerResultado:(id)sender;
- (int)defineMaxMesa:(NSMutableArray*)jogadores;
-(void)preencheLabel:(NSString*)texto label:(UILabel*)label;
-(BOOL)validaAposta:(NSMutableArray*)jogadores valor:(int) valor;
-(void)terminaPreenchimento:(NSMutableArray*)labels;

@end
