***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
         MACRO
         FIM
         L     R13,SAVE_AREA+4
         LM    R14,R12,12(R13)
         LA    R15,0
         BR    R14
         MEND
