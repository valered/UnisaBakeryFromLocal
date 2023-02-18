package model.Cart;

import model.Dolci.Dolci;

public class CartItem {  /* singolo item del carrello */
    private String emailUtente;
    private Dolci dolce;
    private int quantita;

    public CartItem() {}

    public Dolci getDolce() {
        return dolce;
    }

    public double getTotale(){
        return dolce.getPrezzoAlKg()*dolce.getPeso()* quantita;
    }

    public void setDolce(Dolci d){
        this.dolce=d;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public void setEmailUtente(String email){
        this.emailUtente=email;
    }

    public String getEmailUtente(){
        return this.emailUtente;
    }
}
