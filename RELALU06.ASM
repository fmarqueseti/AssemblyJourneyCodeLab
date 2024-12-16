* RELALU06
CAB01    DS    0CL80
         DC    CL1'1'
         DC    CL8'ASMP0626'
         DC    11CL1' '
         DC    CL39'SISTEMA DE CONTROLE DE NOTAS - SISNOTAS'
         DC    11CL1' '
DIA      DS    CL2
         DC    CL1'/'
MES      DS    CL2
         DC    CL1'/'
ANO      DS    CL4
*
CAB02    DS    0CL80
         DC    CL1' '
HORA     DS    CL2
         DC    CL1':'
MINUTO   DS    CL2
         DC    CL1':'
SEGUNDO  DS    CL2
         DC    CL1' '
         DC    60CL1'='
         DC    CL6' PAG. '
PAGINA   DS    CL4
*
CAB03    DS    0CL80
         DC    CL1'0'
         DC    CL8'     CPF'
         DC    29CL1' '
         DC    CL4'NOME'
         DC    20CL1' '
         DC    CL09'MEDIA    '
         DC    CL11'SITUACAO   '
*
CAB04    DS    0CL80
         DC    CL1' '
         DC    14CL1'-'
         DC    CL4'    '
         DC    40CL1'-'
         DC    CL2'  '
         DC    CL7'-------'
         DC    CL3'    '
         DC    CL11'-----------'
*
DETALHE  DS    0CL80
         DC    CL1' '
CPF_DET  DS    CL14
         DC    CL4'    '
NOME_DET DS    CL40
         DC    CL2'  '
MED_DET  DS    CL6
         DC    CL4'    '
STAT_DET DS    CL9