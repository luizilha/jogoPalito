//
//  BEPViewDefineQtdJogadores.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 29/05/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPViewDefineQtdJogadores.h"


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
    self.numJogadores = 0;
    self.labelNumeroJogadores.text = [NSString stringWithFormat:@"%d",self.numJogadores];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementador:(id)sender {
    if (self.numJogadores < 4) {
        self.numJogadores++;
        self.labelNumeroJogadores.text = [NSString stringWithFormat:@"%d",self.numJogadores];
    }
    
}

- (IBAction)descrementador:(id)sender {
    if (self.numJogadores > 0) {
        self.numJogadores--;
        self.labelNumeroJogadores.text = [NSString stringWithFormat:@"%d",self.numJogadores];
    }

}

- (IBAction)voltarMenu:(id)sender {
}

- (IBAction)iniciarJogo:(id)sender {

}
@end
