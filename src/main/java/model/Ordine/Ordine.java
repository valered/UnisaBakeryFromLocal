package model.Ordine;

import java.sql.Date;
import java.util.GregorianCalendar;

public class Ordine {

    private String email,dataOrdine;
    private int  idOrdine;


    public Ordine() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public int getIdOrdine() {
        return idOrdine;
    }

    public void setIdOrdine(int idOrdine) {
        this.idOrdine = idOrdine;
    }

    public String getDataOrdine() {
        return dataOrdine;
    }

    public void setDataOrdine(String dataOrdine) {
        this.dataOrdine = dataOrdine;
    }

    @Override
    public String toString() {
        return "Ordine{" +
                "email='" + email + '\'' +
                ", dataOrdine='" + dataOrdine + '\'' +
                ", idOrdine=" + idOrdine +
                '}';
    }
}
