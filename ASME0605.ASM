***********************************************************************
* OBJETIVOS: LER ARQUIVO ALUNOS E GRAVAR NO VSAM01 APENAS QUANDO O CPF
*            FOR VALIDO
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASME0605 AMODE 31
ASME0605 RMODE 24
ASME0605 CSECT
         INICIO ASME0605,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (ENTRADA,INPUT) 
         OPEN  (SAIDA,OUTPUT) 
         OPEN  ALUNOS 
         LTR   R15,R15 
         BNZ   ERROVSAM                                   ERRO O (OPEN)
* 
         LA    R7,CPFS 
* 
LER_ENTR EQU   * 
         GET   ENTRADA,REG_VSAM 
* 
         MVC   CPF_IN,CPF 
         LINK  EP=ASMSCPF1 
         CLC   CPF,CPF_OUT 
         BNE   LER_ENTR 
* 
         PUT   RPL=RPLVSAM 
         LTR   R15,R15 
         BNZ   ERRPVSAM                                   ERRO P (PUT) 
         B     LER_ENTR 
ERRPVSAM EQU   *
         MVC   MSG(23),=C'ERRO NO PUT DO VSAM01. '
         PUT   SAIDA,MSG
         B     FIMPROG
ERROVSAM EQU   *
         MVC   MSG(23),=C'ERRO NO OPEN DO VSAM01.'
         PUT   SAIDA,MSG
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
FIMPROG  EQU   *
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
CPFS     DS    0CL22
CPF_IN   DS    CL11
CPF_OUT  DS    CL11
*
MSG      DS    CL132
*
REG_VSAM DS    0CL80
CPF      DS    CL11
NOME     DS    CL40
SEXO     DS    CL1
N1       DS    CL4
N2       DS    CL4
N3       DS    CL4
N4       DS    CL4
N5       DS    CL4
MEDIA    DS    CL4
         DC    4CL1' '
TAM_REG  EQU   *-REG_VSAM
*
ALUNOS   ACB   DDNAME=ALUNOS,                                          *
               AM=VSAM,                                                *
               MACRF=(KEY,SEQ,OUT)
*
RPLVSAM  RPL   ACB=ALUNOS,                                             *
               ARG=CPF,                                                *
               AREA=REG_VSAM,                                          *
               AREALEN=TAM_REG,                                        *
               RECLEN=TAM_REG,                                         *
               KEYLEN=11
*
ENTRADA  DCB   DDNAME=ENTRADA,                                         *
               DSORG=PS,                                               *
               MACRF=GM,                                               *
               EODAD=FIMPROG
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=132,                                              *
               BLKSIZE=1320
*
         LTORG
*
         END   ASME0605