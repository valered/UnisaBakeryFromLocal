package model.Tipologia;

import model.ConPool;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class TipologiaDAO {


    public TipologiaDAO() {}

    public boolean insertTipologia(Tipologia tipologia) {
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO tipologia (id,nome) VALUES ?,?;");
            ps.setInt(1, tipologia.getId());
            ps.setString(2, tipologia.getNome());
            int ritorno = ps.executeUpdate();
            if (ritorno == 2) return false;
            else return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteTipologia(int id) {
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM tipologia WHERE id=?;");
            ps.setInt(1, id);
            int ritorno = ps.executeUpdate();
            if (ritorno == 2) return false;
            else return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateTipologia(int id, String newTipologia) {
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("UPDATE FROM tipologia SET nome=? WHERE id=?");
            ps.setString(1, newTipologia);
            ps.setInt(2, id);
            int ritorno = ps.executeUpdate();
            if (ritorno == 2) return false;
            else return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public ArrayList<Tipologia> selectAllTipologia() {
        ArrayList<Tipologia> lista = new ArrayList<>();
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM 'tipologia'");
            ResultSet set = ps.executeQuery();
            Tipologia tipologiaPrimoRecord = new Tipologia();
            tipologiaPrimoRecord.setId(set.getInt("id"));
            tipologiaPrimoRecord.setNome("nome");
            lista.add(tipologiaPrimoRecord);
            while (set.next()) {
                Tipologia tipologia = new Tipologia();
                tipologia.setId(set.getInt("id"));
                tipologia.setNome("nome");
                lista.add(tipologia);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }


    public int selectTipologiaByName(String nomeTipologia){
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM tipologia where nome=?");
            ps.setString(1,nomeTipologia);
            ResultSet set = ps.executeQuery();
            Tipologia tipologia = new Tipologia();
            while (set.next()) {

                tipologia.setId(set.getInt("id"));
                tipologia.setNome("nome");

            }
                tipologia.setNome("tipologia");
                return tipologia.getId();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }


}
