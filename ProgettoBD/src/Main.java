

import java.sql.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        //Inizializzazione della connessione fuori dal try
        Connection con = null;
        //Connessione al database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            //Stringa per richiedere la conessione
            String url = "jdbc:mysql://localhost:3306/sushi";

            con = DriverManager.getConnection(url,"root", "Emulsio45!");
            System.out.println("Connessione OK!!!\n");
        } catch (Exception e) {
            System.out.println("Connessione fallita");
        }
        //Dichiarazione
        ResultSet resultSet = null;
        Statement query = null;

        //Esecuzione della prima query: la visualizzazione di un elenco di tuple
        String sql = "SELECT * FROM cliente";
        System.out.println("Visualizzazione del risultato della query: "+ sql);
        try {
            //inizializzazione
             query = con.createStatement();
             resultSet = query.executeQuery(sql);
            while (resultSet.next()){
                String email = resultSet.getString("email");
                String nome = resultSet.getString("nome");
                String cognome = resultSet.getString("cognome");
                System.out.println("Cliente: " + email+ ", " + nome + ", " + cognome);
            }
        } catch (SQLException e) {
            System.out.println("Si é verificato un errore nell'esecuzione della query");
        }


        //un inserimento
        Scanner scanner = new Scanner(System.in);

        System.out.println("\nInserisici i dati di un nuovo cliente");
        System.out.print("Email: ");
        String email = scanner.next();
        System.out.print("Nome: ");
        String nome = scanner.next();
        System.out.print("Cognome: ");
        String cognome = scanner.next();

        sql = "INSERT INTO Cliente (email, nome, cognome) VALUES " +
                "(?, ?, ?)";

        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,email );
            ps.setString(2, nome);
            ps.setString(3, cognome);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Si è verificato un errore nell'inserimento");
        }
        //fine inserimento

        //Esecuzione della query: la visualizzazione di un elenco di tuple
        sql = "SELECT * FROM cliente";
        System.out.println("\nVisualizzazione del risultato della query: "+ sql);
        try {
            query = con.createStatement();
            resultSet = query.executeQuery(sql);
            while (resultSet.next()){
                email = resultSet.getString("email");
                nome = resultSet.getString("nome");
                cognome = resultSet.getString("cognome");
                System.out.println("Cliente: " + email+ ", " + nome + ", " + cognome);
            }
        } catch (SQLException e) {
            System.out.println("Si é verificato un errore nell'esecuzione della query");
        }
        //fine esecuzione tabella


        //una eliminazione
        System.out.println("\n\nEliminazione di un cliente data una mail in input");
        sql = "DELETE FROM Cliente WHERE email = ?";
        System.out.print("Email: ");
        email = scanner.next();

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,email);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Si è verificato un errore nell'eliminazione");
        }

        //Esecuzione della query: la visualizzazione di un elenco di tuple
        sql = "SELECT * FROM cliente";
        System.out.println("\nVisualizzazione del risultato della query: "+ sql);
        try {
            query = con.createStatement();
            resultSet = query.executeQuery(sql);
            while (resultSet.next()){
                email = resultSet.getString("email");
                nome = resultSet.getString("nome");
                cognome = resultSet.getString("cognome");
                System.out.println("Cliente: " + email+ ", " + nome + ", " + cognome);
            }
        } catch (SQLException e) {
            System.out.println("Si é verificato un errore nell'esecuzione della query");
        }

        //aggiornamento
        System.out.println("\n\nCambio nome del cliente  Elena Marroni a un nome dato in input");
        sql = "UPDATE  Cliente  SET nome = ? WHERE email = 'cliente8@email.com'";
        System.out.println("Esecuzione query: "+sql );
        System.out.print("Nome: ");
        nome = scanner.next();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, nome);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Si è verificato un errore nell'aggiornamento");
        }

        //Esecuzione della query: la visualizzazione di un elenco di tuple
        sql = "SELECT * FROM cliente";
        System.out.println("\nVisualizzazione del risultato della query: "+ sql);
        try {
            query = con.createStatement();
            resultSet = query.executeQuery(sql);
            while (resultSet.next()){
                 email = resultSet.getString("email");
                 nome = resultSet.getString("nome");
                 cognome = resultSet.getString("cognome");
                System.out.println("Cliente: " + email+ ", " + nome + ", " + cognome);
            }
        } catch (SQLException e) {
            System.out.println("Si é verificato un errore nell'esecuzione della query");
        }




        //Rilascio della connessione, dello statement e del result set alla fine dell'applicativo
        try {
            con.close();
            resultSet.close();
            query.close();
        } catch (SQLException e) {
            System.out.println("Si é verificato un errore nella chiusura dell'applicazione");
        }

    }
    }
