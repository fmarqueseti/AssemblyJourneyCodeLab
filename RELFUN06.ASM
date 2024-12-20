* RELFUN06
CAB01    DS    0CL80
         DC    CL1'1'
         DC    CL8'ASME0607'
         DC    11CL1' '
         DC    CL39'  SISTEMA DE CONTROLE DE FUNCIONARIOS  '
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
         DC    18CL1' '
         DC    CL12'SALARIO     '
         DC    CL8'DT-ADM  '
*
CAB04    DS    0CL80
         DC    CL1' '
         DC    14CL1'-'
         DC    CL2'    '
         DC    40CL1'-'
         DC    CL2'  '
         DC    9CL1'-'
         DC    CL2'    '
         DC    10CL1'-'
*
DETALHE  DS    0CL80
         DC    CL1' '
CPF_DET  DS    CL14
         DC    CL2'  '
NOME_DET DS    CL39
         DC    CL2'  '
SALA_DET DS    CL10
         DC    CL2'  '
DTAD_DET DS    CL10
         ORG   DTAD_DET
DIA_DET  DS    CL2
         DC    CL1'/'
MES_DET  DS    CL2
         DC    CL1'/'
ANO_DET  DS    CL4