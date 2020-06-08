args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else if (length(args)==1) {
  # default output file
  args[2] = "out.txt"
}
#teste.R;
# args[1] - input:  /home/nifi/data-volume/analytix-me/datasus/siasus/${filename}
# args[2] - output: /home/nifi/data-volume/datalake/SOT/${filename}

FILE = read.dbc::read.dbc(args[1])
AUX = subset(FILE, select=c(PA_CODUNI, PA_GESTAO, PA_UFMUN, PA_CNPJCPF, PA_PROC_ID, PA_MVM, PA_CMP, PA_DOCORIG, PA_AUTORIZ, PA_CNSMED, PA_MOTSAI, PA_OBITO, PA_ENCERR, PA_PERMAN, PA_ALTA, PA_TRANSF, PA_CIDPRI, PA_IDADE, PA_SEXO, PA_MUNPCN, PA_QTDPRO, PA_QTDAPR, PA_VALPRO, PA_VALAPR, PA_UFDIF, PA_MNDIF))
write.csv(AUX,file=paste0("",sub(".dbc","",args[2]),".csv"))

df <- data.frame(name = c(args[1], args[2], "Maria"), age = c(23,41,32))

write.csv(df, file=args[1])
