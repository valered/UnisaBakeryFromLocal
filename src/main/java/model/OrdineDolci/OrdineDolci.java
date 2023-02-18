package model.OrdineDolci;

public class OrdineDolci {

   private int idOrdine,codiceDolci,quantita;

    public OrdineDolci() {
    }

    public int getIdOrdine() {
        return idOrdine;
    }

    public void setIdOrdine(int idOrdine) {
        this.idOrdine = idOrdine;
    }

    public int getCodiceDolci() {
        return codiceDolci;
    }

    public void setCodiceDolci(int codiceDolci) {
        this.codiceDolci = codiceDolci;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    @Override
    public String toString() {
        return "OrdineDolci{" +
                "idOrdine=" + idOrdine +
                ", codiceDolci=" + codiceDolci +
                ", quantita=" + quantita +
                '}';
    }
}
