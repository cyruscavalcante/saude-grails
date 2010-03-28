class Queixa {
	String tipo
	String nome_cidadao
	Date data_queixa
	String queixa
	Boolean status
	
	static constraints = {
		tipo(inList:["Alimentar", "Animal"])
		nome_cidadao(blank:false, nullable:false, maxSize:100)
		data_queixa(max:new Date(), nullable:false)
		status(inList:[true, false])
		queixa(blank:false, maxSize:1000)
	}
}