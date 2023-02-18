package model;

import model.Dolci.Dolci;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Carrello {
        private HashMap<Dolci, Integer> lista;


    public Carrello() {
        lista=new HashMap<>();
    }

    public void aggiungiDolceAlCarrello(Dolci dolce, int quantità){
        if (lista.containsKey(dolce)) {

            int q = lista.get(dolce) +  quantità;    //lista.get(dolce) ritorna la quantità già presente nella lista

            lista.put(dolce, q);

        } else lista.put(dolce, quantità);
    }

    public Set<Map.Entry<Dolci, Integer>> getEntryset(){
        return lista.entrySet();
    }

    public int size(){
        return lista.size();
    }

    public HashMap<Dolci, Integer>  removeProduct(Dolci dolce  ){
        lista.remove(dolce);
        return lista;
    }

    public double totale(){
        double totale=0.0;
        for(Map.Entry<Dolci,Integer> dolce: lista.entrySet()){
            totale += (dolce.getKey().getPrezzoAlKg()* dolce.getValue());
        }
        return totale;
    }

    public HashMap<Dolci, Integer> getLista() {
        return lista;
    }

    public void setLista(HashMap<Dolci, Integer> lista) {
        this.lista = lista;
    }
}
