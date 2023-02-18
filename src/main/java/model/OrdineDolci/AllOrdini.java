package model.OrdineDolci;

import model.Ordine.Ordine;

public class AllOrdini {

    private Ordine ordine;
    private OrdineDolci ordineDolci;

    public AllOrdini(){ }

    public Ordine getOrdine() {
        return ordine;
    }

    public void setOrdine(Ordine ordine) {
        this.ordine = ordine;
    }

    public OrdineDolci getOrdineDolci() {
        return ordineDolci;
    }

    public void setOrdineDolci(OrdineDolci ordineDolci) {
        this.ordineDolci = ordineDolci;
    }

    @Override
    public String toString() {
        return "AllOrdini{" +
                "ordine=" + ordine.toString() +
                ", ordineDolci=" + ordineDolci.toString() +
                '}';
    }
}
