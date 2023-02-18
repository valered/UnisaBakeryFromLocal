package model.Dolci;


import model.ConPool;
import model.Tipologia.TipologiaDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DolciDAO {

    public DolciDAO(){}

    public Dolci cercaDolceByCodice(int codice){
        Dolci dolce=new Dolci();
        try(Connection conn= ConPool.getConnection()){
            PreparedStatement ps= conn.prepareStatement("SELECT * FROM dolci WHERE  cod=?");
            ps.setInt(1,codice);
            ResultSet set= ps.executeQuery();
            while(set.next()) {
                dolce.setCodice(set.getInt("Cod"));
                dolce.setDescrizione(set.getString("Descrizione"));
                dolce.setNome(set.getString("Nome"));
                dolce.setPrezzoAlKg(set.getDouble("Prezzokg"));
                dolce.setTempoConservazione(set.getString("Tconservazione"));
                dolce.setTempoCottura(set.getString("Tcottura"));
                dolce.setIdTipologia(set.getInt("idTipologia"));
                dolce.setPeso(set.getDouble("Peso"));
                dolce.setCover(set.getString("cover"));
            }

            return dolce;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }

    public ArrayList<Dolci> selectAllDolci(){
        ArrayList<Dolci> lista=new ArrayList<>();
        try(Connection conn= ConPool.getConnection()){
            PreparedStatement ps= conn.prepareStatement("SELECT * FROM dolci");
            ResultSet set= ps.executeQuery();

            while(set.next()) {
                Dolci dolce = new Dolci();
                dolce.setCodice(set.getInt("Cod"));
                dolce.setDescrizione(set.getString("Descrizione"));
                dolce.setNome(set.getString("Nome"));
                dolce.setPrezzoAlKg(set.getDouble("Prezzokg"));
                dolce.setTempoConservazione(set.getString("Tconservazione"));
                dolce.setTempoCottura(set.getString("Tcottura"));
                dolce.setIdTipologia(set.getInt("idTipologia"));
                dolce.setPeso(set.getDouble("Peso"));
                dolce.setCover(set.getString("cover"));
                lista.add(dolce);
            }

            return lista;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }

    public boolean insertDolce(Dolci dolce) {
        try (Connection conn = ConPool.getConnection()){
                PreparedStatement ps= conn.prepareStatement("INSERT  into dolci ( prezzoKg,nome, descrizione,Tcottura,Tconservazione, cod,idTipologia,peso,cover) VALUES (?,?,?,?,?,?,?,?,?);");
            ps.setDouble(1,dolce.getPrezzoAlKg());
            ps.setString(2,dolce.getNome());
            ps.setString(3,dolce.getDescrizione());
            ps.setString(4, dolce.getTempoCottura());
            ps.setString(5,dolce.getTempoConservazione());
            ps.setInt(6,dolce.getCodice());
            ps.setInt(7,dolce.getIdTipologia());
            ps.setDouble(8,dolce.getPeso());
            ps.setString(9, dolce.getCover());
            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;
        }catch(SQLException e){
            throw  new RuntimeException(e);

        }
    }

    public boolean updateDolce(Dolci dolce){
        try(Connection conn = ConPool.getConnection()) {
            PreparedStatement ps=conn.prepareStatement("UPDATE dolci SET prezzoKg=?, descrizione=?, idTipologia=?,peso=? WHERE cod=?;");
            ps.setDouble(1,dolce.getPrezzoAlKg());
            ps.setString(2,dolce.getDescrizione());
            ps.setInt(3,dolce.getIdTipologia());
            ps.setDouble(4,dolce.getPeso());
            ps.setInt(5,dolce.getCodice());
            int ritorno= ps.executeUpdate();
            if(ritorno==2) return false;
            else return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteDolce(int codice){
        System.out.println("Sono entrata in deleteDolce");
        try(Connection conn=ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("DELETE FROM dolci WHERE cod=?;");
            ps.setInt(1,codice);
            int ritorno=ps.executeUpdate();
            if(ritorno==2) return false;
            else return true;
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public ArrayList<Dolci> cercaDolciPerTipologia(String tipologia){
        ArrayList<Dolci> lista=new ArrayList<>();
        TipologiaDAO tDAO = new TipologiaDAO();
        int idTipologia = tDAO.selectTipologiaByName(tipologia);
        System.out.println(idTipologia);
        try(Connection conn=ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM dolci WHERE  idTipologia="+idTipologia+";");
            //ps.setInt(1, idTipolgia);
            ResultSet set = ps.executeQuery();



            while(set.next()){
            Dolci dolce = new Dolci();
            dolce.setCodice(set.getInt("Cod"));
            dolce.setDescrizione(set.getString("Descrizione"));
            dolce.setNome(set.getString("Nome"));
            dolce.setPrezzoAlKg(set.getDouble("Prezzokg"));
            dolce.setTempoConservazione(set.getString("Tconservazione"));
            dolce.setTempoCottura(set.getString("Tcottura"));
            dolce.setIdTipologia(set.getInt("idTipologia"));
            dolce.setPeso(set.getDouble("Peso"));
            dolce.setCover(set.getString("cover"));
            lista.add(dolce);
            }

            return lista;
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }




}
