package model.Cart;

import model.ConPool;
import model.Dolci.Dolci;
import model.Dolci.DolciDAO;

import java.sql.*;
import java.util.ArrayList;

public class CartItemDAO {

    public CartItemDAO(){}

    public boolean insertCartItem(CartItem cartItem) throws SQLException {
        int quantita=getQuantitaSePresenteDolce(cartItem);
        try (Connection conn = ConPool.getConnection()){

            if(quantita==0){
                System.out.println("sono in quantita == 0 in CartItem DAO ");
            PreparedStatement ps= conn.prepareStatement("INSERT  into cart (email,codice,quantita) VALUES (?,?,?)");
            ps.setString(1,cartItem.getEmailUtente());
            ps.setInt(2,cartItem.getDolce().getCodice());
            ps.setInt(3,cartItem.getQuantita());
            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;}
            else if(quantita!=0){
                PreparedStatement ps = conn.prepareStatement("update cart set quantita=? where email=? and codice = ?");
                ps.setInt(1,quantita+cartItem.getQuantita());
                ps.setString(2, cartItem.getEmailUtente());
                ps.setInt(3,cartItem.getDolce().getCodice());
                int ritorno= ps.executeUpdate();
                if(ritorno==2) return false;
                else return true;
            }
        }catch(SQLException e){
            throw  new RuntimeException(e);

        }
        return false;
    }

    public int getQuantitaSePresenteDolce(CartItem cartItem) throws SQLException {
        int quantita=0;
        ArrayList<CartItem> lista = selectAllCartByEmail(cartItem.getEmailUtente());
        if(lista!=null){
            for(CartItem c : lista){
                if(c.getDolce().getCodice()== cartItem.getDolce().getCodice()){
                    quantita=c.getQuantita(); //restituisco solo la quantità attuale nel carrello.
                }
            }
        }
        return quantita;
    }

    public ArrayList<CartItem> selectAllCartByEmail(String email) throws SQLException {
        ArrayList<CartItem> lista = new ArrayList<>();
        DolciDAO dolciDAO = new DolciDAO();
        try(Connection conn = ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM cart WHERE email=?");
            ps.setString(1,email);
            ResultSet set= ps.executeQuery();
            while (set.next()){
                CartItem cart = new CartItem();
                Dolci dolce = dolciDAO.cercaDolceByCodice(set.getInt("codice"));
                cart.setDolce(dolce);
                cart.setEmailUtente(set.getString("email"));
                cart.setQuantita(set.getInt("quantita"));
                lista.add(cart);
            }
        }
        if(lista!=null) return lista;
        else return null;
    }

    public boolean cancellaTuttiDolciUtente(String email){
        try(Connection conn = ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("DELETE  FROM cart WHERE email=?");
            ps.setString(1,email);
            int ritorno= ps.executeUpdate();
            if(ritorno==2) return false;
            else return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean cancellaDolce(CartItem cartItem){
        String email = cartItem.getEmailUtente();
        int codice= cartItem.getDolce().getCodice();
        try(Connection conn = ConPool.getConnection()){
            PreparedStatement ps=conn.prepareStatement("DELETE  FROM cart WHERE email=? AND codice=?");
            ps.setString(1,email);
            ps.setInt(2,codice);
            int ritorno= ps.executeUpdate();
            if(ritorno==2) return false;
            else return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean updateQuantita(CartItem item){
        try(Connection conn=ConPool.getConnection()) {
            PreparedStatement ps= conn.prepareStatement("UPDATE cart SET  quantita=? WHERE  email=? and codice=?;");

            ps.setInt(1,item.getQuantita());
            ps.setString(2,item.getEmailUtente());
            ps.setInt(3,item.getDolce().getCodice());

            int ritorno=ps.executeUpdate();
            if (ritorno==2) return false;
            else return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
