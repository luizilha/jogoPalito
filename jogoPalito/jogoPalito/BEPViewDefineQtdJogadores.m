//
//  BEPViewDefineQtdJogadores.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 29/05/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPViewDefineQtdJogadores.h"
#import "BEPAppDelegate.h"

@interface BEPViewDefineQtdJogadores ()

@end

@implementation BEPViewDefineQtdJogadores

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
    self.numJogadores = 2;
    self.labelNumeroJogadores.text = [NSString stringWithFormat:@"%d",self.numJogadores];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementador:(id)sender
{
    if (self.numJogadores < 4) {
        self.numJogadores++;
        self.labelNumeroJogadores.text = [NSString stringWithFormat:@"%d",self.numJogadores];
    }
}

- (IBAction)descrementador:(id)sender
{
    if (self.numJogadores > 2) {
        self.numJogadores--;
        self.labelNumeroJogadores.text = [NSString stringWithFormat:@"%d",self.numJogadores];
    }
}

- (IBAction)iniciarJogo:(id)sender
{
    BEPPalitosMaoViewController *v = [[BEPPalitosMaoViewController alloc] init];
    int qtde = self.labelNumeroJogadores.text.intValue;
    v.jogadores = [[NSMutableArray alloc]init];
    for (int i =0; i < qtde ; i++) {
        BEPJogador *jogador = [[BEPJogador alloc] init];
        [v.jogadores addObject:jogador];
    }
    for (int i =0; i < qtde ; i++) {
        [[v.jogadores objectAtIndex:i] setMax:3];
    }
    [v setModoSingle:NO];
    [self.navigationController pushViewController:v animated:YES];
    
}
@end
