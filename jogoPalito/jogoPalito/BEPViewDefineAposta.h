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

@property(nonatomic) NSMutableArray *jogadores;
@property(nonatomic) BEPJogador *jogador;
@property(nonatomic) int valorMaxRec;
@property(nonatomic) int jogadorPrim;

- (IBAction)IncrementaAposta:(id)sender;
- (IBAction)descrementaAposta:(id)sender;
- (IBAction)VerResultado:(id)sender;




@end
