***********************************************************************
* OBJETIVOS: IMPRIME O TIMESTAMP EM SAIDA
*            FORMATO YYYYMMDDHHMMSSTHMIJU (VIDE HTTP://T.LY/HCXHE)
*            THMIJU: T (TEN), H (HUNDRED), M (1 THOUSAND),
*                    I (10 THOUSAND), J (100 THOUSAND), U (1 MILLION)
*                    ESPECIFICACAO (CONHECIDA COMO PRECISAO) ATE O
*                    MILIONESIMO DE SEGUNDO (000000 - 999999)
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0625 AMODE 31
ASMP0625 RMODE 24
ASMP0625 CSECT
         INICIO ASMP0625,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         TIME  DEC,TIMEDAT,ZONE=LT,LINKAGE=SYSTEM,DATETYPE=YYYYMMDD
         UNPK  CURRDATE(9),TIMEDAT+8(5)
         UNPK  CURRTIME(13),TIMEDAT(7)
         MVC   MSG+1(8),CURRDATE
         MVC   MSG+9(12),CURRTIME
         PUT   SAIDA,MSG
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
TIMEDAT  DS    CL16
CURRDATE DS    CL8                                DATA: C'YYYYMMDD'
CURRTIME DS    CL12                               HORA: C'HHMMSSTHMIJU'
*
MSG      DS    CL132
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
         END ASMP0625