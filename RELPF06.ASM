* RELPF06
CAB01    DS    0CL132
         DC    CL1'1'
         DC    CL8'INEFE06'
         DC    38CL1' '
         DC    CL39'SISTEMA DE CONTROLE DE NOTAS - SISNOTAS'
         DC    36CL1' '
DIA      DS    CL2
         DC    CL1'/'
MES      DS    CL2
         DC    CL1'/'
ANO      DS    CL4
*
CAB02    DS    0CL132
         DC    CL1' '
HORA     DS    CL2
         DC    CL1':'
MINUTO   DS    CL2
         DC    CL1':'
SEGUNDO  DS    CL2
         DC    CL1' '
         DC    112CL1'='
         DC    CL6' PAG. '
PAGINA   DS    CL4
*
CAB03    DS    0CL132
         DC    CL1'0'
         DC    CL23'                   NOME'
         DC    26CL1' '
         DC    CL5'IDADE'
         DC    22CL1' '
         DC    CL12'RESPONSAVEL'
         DC    20CL1' '
         DC    CL5'MEDIA'
         DC    7CL1' '
         DC    CL11'SITUACAO   '
*
CAB04    DS    0CL132
         DC    CL1' '
         DC    42CL1'-'
         DC    CL7' '
         DC    5CL1'-'
         DC    CL7' '
         DC    40CL1'-'
         DC    7CL1' '
         DC    5CL1'-'
         DC    6CL1' '
         DC    12CL1'-'
*
DETALHE  DS    0CL132
         DC    CL1' '
NOME_DT  DS    CL40
         DC    CL11' '
IDADE_DT DS    CL2
         DC    CL8' '
RESPN_DT DS    CL40
         DC    7CL1' '
MEDIA_DT DS    CL7
         DC    7CL1' '
SIT_DT   DS    CL11
*
RESUMO   DS    132CL1' '
