package model.Tipologia;


public class Tipologia {

    private int id;
    private String nome; //o prodotto forno o prodotto frigo



    public Tipologia() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
