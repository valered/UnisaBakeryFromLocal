package model.Ordine;

import model.ConPool;
import model.OrdineDolci.AllOrdini;
import model.OrdineDolci.OrdineDolci;
import model.OrdineDolci.OrdineDolciDAO;

import java.sql.*;
import java.util.ArrayList;

public class OrdineDAO {

    public OrdineDAO(){}

    public boolean insertOrdine(Ordine ordine){
        try (Connection conn = ConPool.getConnection()){
            PreparedStatement ps= conn.prepareStatement("INSERT  into ordine ( idOrdine, email, dataOrdine) VALUES (?,?,?);");
            ps.setInt(1,ordine.getIdOrdine());
            ps.setString(2,ordine.getEmail());
            ps.setString(3,ordine.getDataOrdine());
            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;
        }catch(SQLException e){
            throw  new RuntimeException(e);
        }
    }

    public boolean deleteOrdineById(int id){
        try(Connection conn=ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("DELETE FROM ordine WHERE idOrdine=?;");
            ps.setInt(1,id);
            int ritorno=ps.executeUpdate();
            if(ritorno==2) return false;
            else return true;
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    public ArrayList<Ordine> selectAllOrdini(){
        ArrayList<Ordine> lista= new ArrayList<>();
        try(Connection conn=ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM ordine;");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Ordine ordine = new Ordine();
                ordine.setIdOrdine(rs.getInt("idOrdine"));
                ordine.setEmail(rs.getString("email"));
                ordine.setDataOrdine(rs.getString("dataOrdine"));
                lista.add(ordine);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Ordine selectOrdineById(int id){
        Ordine ordinePrimoRecord = new Ordine();
        try(Connection conn=ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM ordine where idOrdine=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            ordinePrimoRecord.setIdOrdine(rs.getInt("idOrdine"));
            ordinePrimoRecord.setEmail(rs.getString("email"));
            ordinePrimoRecord.setDataOrdine(rs.getString("dataOrdine"));


        }catch (SQLException e) {
            e.printStackTrace();
        }
        return ordinePrimoRecord;
    }

    public int contaOrdini(){
       int size=0;
        ArrayList<Ordine> lista = selectAllOrdini();
        size= lista.size();
        return size;
    }


    public ArrayList<AllOrdini> selectAllOrdiniConDolci(){
        ArrayList<AllOrdini> lista = new ArrayList<>();
        try(Connection conn=ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("SELECT ordine.idOrdine, ordine.dataOrdine,ordine.email, ordinedolci.codice,ordinedolci.quantita FROM ordine , ordinedolci where ordine.idOrdine=ordinedolci.idOrdine ");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Ordine ordine = new Ordine();
                OrdineDolci ordineDolci = new OrdineDolci();
                AllOrdini allOrdine = new AllOrdini();
                ordine.setIdOrdine(rs.getInt("ordine.idOrdine"));
                ordine.setEmail(rs.getString("ordine.email"));
                ordine.setDataOrdine(rs.getString("ordine.dataOrdine"));
                ordineDolci.setIdOrdine(rs.getInt("ordine.idOrdine"));
                ordineDolci.setCodiceDolci(rs.getInt("ordinedolci.codice"));
                ordineDolci.setQuantita(rs.getInt(ordineDolci.getQuantita()));

                allOrdine.setOrdine(ordine);
                allOrdine.setOrdineDolci(ordineDolci);
                lista.add(allOrdine);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public ArrayList<Ordine> selectAllOrdiniByEmail(String email){
        ArrayList<Ordine> lista= new ArrayList<>();
        try(Connection conn=ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM ordine where email=?;");
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Ordine ordine = new Ordine();
                ordine.setIdOrdine(rs.getInt("idOrdine"));
                ordine.setEmail(rs.getString("email"));
                ordine.setDataOrdine(rs.getString("dataOrdine"));
                lista.add(ordine);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
