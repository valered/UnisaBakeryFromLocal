package model.OrdineDolci;

import model.ConPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrdineDolciDAO {

    public OrdineDolciDAO(){}

    public ArrayList<OrdineDolci> selctAllOrdineDolci(){
        ArrayList<OrdineDolci> list = new ArrayList<>();
        try(Connection conn = ConPool.getConnection()) {
            PreparedStatement ps= conn.prepareStatement("SELECT * FROM ordineDolci");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                OrdineDolci ordineDolci = new OrdineDolci();
                ordineDolci.setIdOrdine(rs.getInt("idOrdine"));
                ordineDolci.setCodiceDolci(rs.getInt("codice"));
                ordineDolci.setQuantita(rs.getInt("quantita"));
                list.add(ordineDolci);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public OrdineDolci selectOrdineDolciByIdOrdineIdDolce(int idordine,int idDolce){
        OrdineDolci ordineDolciPrimoR = new OrdineDolci();
        try(Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM ordineDolci WHERE idOrdine=? AND codice=?");
            ps.setInt(1,idordine);
            ps.setInt(2,idDolce);

            ResultSet rs = ps.executeQuery();

            ordineDolciPrimoR.setIdOrdine(rs.getInt("idOrdine"));
            ordineDolciPrimoR.setCodiceDolci(rs.getInt("codice"));
            ordineDolciPrimoR.setQuantita(rs.getInt("quantita"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return  ordineDolciPrimoR;
    }


    public boolean insertOrdineDolci(OrdineDolci ordineDolci){
        try(Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO  ordineDolci (idOrdine,codice,quantita) VALUES (?,?,?) ");
            ps.setInt(1,ordineDolci.getIdOrdine());
            ps.setInt(2,ordineDolci.getCodiceDolci());
            ps.setInt(3,ordineDolci.getQuantita());

            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateOrdineDolci(OrdineDolci ordineDolci){
        try(Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("UPDATE FROM ordineDolci SET quantita=? WHERE idOrdine=? AND codice=?;");
            ps.setInt(1,ordineDolci.getQuantita());
            ps.setInt(2,ordineDolci.getIdOrdine());
            ps.setInt(3,ordineDolci.getCodiceDolci());


            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteOrdineDolci(int idOrdine,int idDolce){
        try(Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE ordine WHERE idOrdine=? AND codice=?;");
            ps.setInt(1,idOrdine);
            ps.setInt(2,idDolce);
            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<OrdineDolci> selectAllOrdineDolciById(int id){
        ArrayList<OrdineDolci> list = new ArrayList<>();
        try(Connection conn = ConPool.getConnection()) {
            PreparedStatement ps= conn.prepareStatement("SELECT * FROM ordineDolci where idOrdine=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                OrdineDolci ordineDolci = new OrdineDolci();
                ordineDolci.setIdOrdine(rs.getInt("idOrdine"));
                ordineDolci.setCodiceDolci(rs.getInt("codice"));
                ordineDolci.setQuantita(rs.getInt("quantita"));
                list.add(ordineDolci);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
