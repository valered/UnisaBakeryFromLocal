package model.Dolci;


public class Dolci {

    private double prezzoAlKg,peso;
    private String cover,descrizione,nome,tempoCottura,tempoConservazione;  //cover rappresenta la path del file (quindi immagine)
    private int codice, idTipologia;


    public Dolci() {
        super();
    }

    public double getPrezzoAlKg() {
        return prezzoAlKg;
    }

    public void setPrezzoAlKg(double prezzoAlKg) {
        this.prezzoAlKg = prezzoAlKg;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTempoCottura() {
        return tempoCottura;
    }

    public void setTempoCottura(String tempoCottura) {
        this.tempoCottura = tempoCottura;
    }

    public String getTempoConservazione() {
        return tempoConservazione;
    }

    public void setTempoConservazione(String tempoConservazione) {
        this.tempoConservazione = tempoConservazione;
    }

    public int getCodice() {
        return codice;
    }

    public void setCodice(int codice) {
        this.codice = codice;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getIdTipologia() {
        return idTipologia;
    }

    public void setIdTipologia(int idTipologia) {
        this.idTipologia = idTipologia;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "Dolci{" +
                "prezzoAlKg=" + prezzoAlKg +
                ", peso=" + peso +
                ", cover='" + cover + '\'' +
                ", descrizione='" + descrizione + '\'' +
                ", nome='" + nome + '\'' +
                ", tempoCottura='" + tempoCottura + '\'' +
                ", tempoConservazione='" + tempoConservazione + '\'' +
                ", codice=" + codice +
                ", idTipologia=" + idTipologia +
                '}';
    }


    public String toJSON(){

        return "{\"prezzoAlKg\":\""+prezzoAlKg+"\",\"peso\":\""+peso+"\",\"cover\":\""+cover+"\",\"nome\":\""+nome+"\",\"tempoCottura\":\""+tempoCottura+"\",\"tempoConservazione\":\""+tempoConservazione+"\",\"codice\":\""+codice+"\",\"idTipologia\":\""+idTipologia+"\"}";
    }
}
