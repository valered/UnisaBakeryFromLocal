package model.Utente;

import model.ConPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UtenteDAO {

    public UtenteDAO(){}

    public ArrayList<Utente> selectAllUtenti(){
        ArrayList<Utente> list = new ArrayList<>();
        try(Connection conn= ConPool.getConnection()){
            PreparedStatement ps= conn.prepareStatement("SELECT * FROM utente;");
            ResultSet set = ps.executeQuery();
            while(set.next()){
                Utente utente = new Utente();
                utente.setIfAdmin(set.getBoolean("ifAdmin")); //IfAdmin in parentesi è quello del database (NOME)
                utente.setCap(set.getString("Cap"));
                utente.setCitta(set.getString("Citta"));
                utente.setVia(set.getString("Via"));
                utente.setNome(set.getString("Nome"));
                utente.setUsername(set.getString("Username"));
                utente.setEmail(set.getString("email"));
                utente.setPsword(set.getString("Psword"));
                utente.setTelefono(set.getString("telefono"));
                list.add(utente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Utente selectUtenteByNomeUtentePassword(String nomeUtente,String password){
        Utente utenteRitorno = new Utente();
        try(Connection conn= ConPool.getConnection()){
            PreparedStatement ps= conn.prepareStatement("SELECT * FROM utente WHERE Username = '"+nomeUtente+"' AND Psword = '"+password+"'");
            //ps.setString(1, email);
            ResultSet set = ps.executeQuery();
            while(set.next()){
            utenteRitorno.setEmail(set.getString("email"));
            System.out.println(utenteRitorno.getEmail());
            utenteRitorno.setUsername(set.getString("Username"));
            utenteRitorno.setPsword(set.getString("Psword"));
            utenteRitorno.setIfAdmin(set.getBoolean("ifAdmin"));
            utenteRitorno.setNome(set.getString("Nome"));
            utenteRitorno.setVia(set.getString("Via"));
            utenteRitorno.setCap(set.getString("Cap"));
            utenteRitorno.setCitta(set.getString("Citta"));
            utenteRitorno.setTelefono(set.getString("telefono"));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return utenteRitorno;
    }

    public boolean insertUtente(Utente utente){
        try(Connection conn=ConPool.getConnection()) {
            PreparedStatement ps= conn.prepareStatement("INSERT INTO utente ( email, username, psword, ifAdmin, nome, via, cap,citta,telefono) VALUES (?,?,?,?,?,?,?,?,?);");
            ps.setString(1, utente.getEmail());
            ps.setString(2,utente.getUsername());
            ps.setString(3,utente.getPsword());
            ps.setBoolean(4, utente.isIfAdmin());
            ps.setString(5, utente.getNome());
            ps.setString(6,utente.getVia());
            ps.setString(7,utente.getCap());
            ps.setString(8,utente.getCitta());
            ps.setString(9, utente.getTelefono());

            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteUtente(String email) {
        try(Connection conn = ConPool.getConnection()){
            PreparedStatement ps = conn.prepareStatement("DELETE FROM utente WHERE email='"+email+"'");
           // ps.setString(1,email);
            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;
        } catch (SQLException e) {
        e.printStackTrace();
    }
        return false;
    }


    public boolean updateUtente(Utente utente){
        try(Connection conn=ConPool.getConnection()) {
            PreparedStatement ps= conn.prepareStatement("UPDATE utente SET  (username=?, psword=?, nome=?, via=?, cap=?,citta=?,telefono=?) WHERE  (email=?);");

            ps.setString(1,utente.getUsername());
            ps.setString(2,utente.getPsword());
            ps.setString(3, utente.getNome());
            ps.setString(4,utente.getVia());
            ps.setString(5,utente.getCap());
            ps.setString(6,utente.getCitta());
            ps.setString(7, utente.getTelefono());
            ps.setString(8, utente.getEmail());

            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



    public boolean controllaEmail(Utente utente){

        Utente utenteRitorno = new Utente();
        try(Connection conn = ConPool.getConnection()){

            PreparedStatement ps= conn.prepareStatement("SELECT * FROM utente WHERE email = '"+utente.getEmail()+"'");
            //ps.setString(1, email);
            ResultSet set = ps.executeQuery();
            while(set.next()){
                utenteRitorno.setEmail(set.getString("email"));
                System.out.println(utenteRitorno.getEmail());
                utenteRitorno.setUsername(set.getString("Username"));
                utenteRitorno.setPsword(set.getString("Psword"));
                utenteRitorno.setIfAdmin(set.getBoolean("ifAdmin"));
                utenteRitorno.setNome(set.getString("Nome"));
                utenteRitorno.setVia(set.getString("Via"));
                utenteRitorno.setCap(set.getString("Cap"));
                utenteRitorno.setCitta(set.getString("Citta"));
                utenteRitorno.setTelefono(set.getString("telefono"));
            }

            if(utenteRitorno.getEmail()!=null) {System.out.println("Utente ritorno del DAO:"+utenteRitorno.toString()); return true;}
            else return false;


        }catch(SQLException e){
            System.out.println("non presente in Database");
            return false;
        }


    }

    public boolean controllaNomeUtente(Utente utente){

        Utente utenteRitorno = new Utente();
        try(Connection conn = ConPool.getConnection()){

            PreparedStatement ps= conn.prepareStatement("SELECT * FROM utente WHERE Username = '"+utente.getUsername()+"'");
            //ps.setString(1, email);
            ResultSet set = ps.executeQuery();
            while(set.next()){
                utenteRitorno.setEmail(set.getString("email"));
                System.out.println(utenteRitorno.getEmail());
                utenteRitorno.setUsername(set.getString("Username"));
                utenteRitorno.setPsword(set.getString("Psword"));
                utenteRitorno.setIfAdmin(set.getBoolean("ifAdmin"));
                utenteRitorno.setNome(set.getString("Nome"));
                utenteRitorno.setVia(set.getString("Via"));
                utenteRitorno.setCap(set.getString("Cap"));
                utenteRitorno.setCitta(set.getString("Citta"));
                utenteRitorno.setTelefono(set.getString("telefono"));
            }

            if(utenteRitorno.getUsername()!=null) return true;
            else return false;

        }catch(SQLException e){
            System.out.println("non presente in Database");
            return false;
        }


    }

}
