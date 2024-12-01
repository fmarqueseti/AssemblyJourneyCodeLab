***********************************************************************
* OBJETIVOS: LER UMA LISTA DE CPFS E UMA LISTA DE ALUNOS, DE ARQUIVOS
*            KSAM DISTINTOS. TROCAR A CHAVE DO REGISTRO DE  ALUNO  DA
*            MATRICULA PELO CPF CALCULADO. GRAVA O  RESULTADO  EM  UM
*            NOVO ARQUIVO KSAM.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0619 AMODE 31
ASMP0619 RMODE 24
ASMP0619 CSECT
         INICIO ASMP0619,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (CPFSIN,INPUT)
         LTR   R15,R15
         BNZ   ROT_ABND
         OPEN  (ALUNOS,INPUT)
         LTR   R15,R15
         BNZ   ROT_ABND
         OPEN  (SAIDA,OUTPUT)
*
         LA    R7,CPF_IN
*
LER_REGS EQU   *
         GET   CPFSIN,CPF_IN
         GET   ALUNOS,REG_IN
*
         LINK  EP=ASMSCPF1
*
         MVC   OUT_CPF,CPF_OUT
         MVC   OUT_NOME,IN_NOME
         MVC   OUT_SEXO,IN_SEXO
         MVC   OUT_N1,IN_N1
         MVC   OUT_N2,IN_N2
         MVC   OUT_N3,IN_N3
         MVC   OUT_N4,IN_N4
         MVC   OUT_N5,IN_N5
*
         PUT   SAIDA,REG_OUT
*
         B     LER_REGS
***********************************************************************
* ROTINA DE ABEND
***********************************************************************
ROT_ABND EQU   *
         MVC   MSG+1(12),=C'OPEN FALHOU.'
         PUT   SAIDA,MSG
***********************************************************************
* FINALIZA (FECHA) OS DATASETS
***********************************************************************
FIMARQ   EQU   *
         CLOSE CPFSIN
         CLOSE ALUNOS
         CLOSE SAIDA
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
REG_IN   DS    0CL80
IN_MATR  DS    CL6
IN_NOME  DS    CL40
IN_SEXO  DS    CL11
IN_N1    DS    CL4
IN_N2    DS    CL4
IN_N3    DS    CL4
IN_N4    DS    CL4
IN_N5    DS    CL4
         DC    13CL1' '
*
REG_OUT  DS    0CL80
OUT_CPF  DS    CL11
OUT_NOME DS    CL40
OUT_SEXO DS    CL11
OUT_N1   DS    CL4
OUT_N2   DS    CL4
OUT_N3   DS    CL4
OUT_N4   DS    CL4
OUT_N5   DS    CL4
         DC    8CL1' '
*
CPFS     DS    0CL22
CPF_IN   DS    CL11
CPF_OUT  DS    CL11
*
MSG      DS    CL80
*
CPFSIN   DCB   DDNAME=CPFSIN,                                          *
               DSORG=PS,                                               *
               MACRF=GM,                                               *
               EODAD=FIMARQ
*
ALUNOS   DCB   DDNAME=ALUNOS,                                          *
               DSORG=PS,                                               *
               MACRF=GM,                                               *
               EODAD=FIMARQ
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM
*
         LTORG
*
         END ASMP0619