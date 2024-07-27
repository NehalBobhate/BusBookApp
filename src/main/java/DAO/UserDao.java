package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.User;

public class UserDao {

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/busdb", "root", "root");
		return connection;

	}

	public int signUp(User user) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO USER VALUES(?,?,?,?,?,?)");
		preparedStatement.setString(1, user.getFirstName());
		preparedStatement.setString(2, user.getLastName());
		preparedStatement.setLong(3, user.getPhoneNo());
		preparedStatement.setString(4, user.getEmail());
		preparedStatement.setString(5, user.getPassword());
		preparedStatement.setString(6, user.getConfirmPassword());
		
		return preparedStatement.executeUpdate();

	}

	public String login(String email) throws ClassNotFoundException, SQLException {
		Connection connection=getConnection();
		
		PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM USER WHERE EMAIL=?");
				preparedStatement.setString(1, email);
				ResultSet resultSet=preparedStatement.executeQuery();
				String dbPassword=null;
				while(resultSet.next()) {
					dbPassword=resultSet.getString("password");
				}
				return dbPassword;
	}
	public User findByEmail(String email) throws SQLException, ClassNotFoundException {
			Connection connection=getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM USER WHERE EMAIL=?");
			preparedStatement.setString(1, email);
			ResultSet resultSet=preparedStatement.executeQuery();
			
			User user=new User();
			while (resultSet.next()) {
				user.setFirstName(resultSet.getString("firstname"));
				user.setLastName(resultSet.getString("lastname"));
				user.setPhoneNo(resultSet.getLong("phoneno"));
				user.setEmail(email);
				user.setPassword(resultSet.getString("password"));
				user.setConfirmPassword(resultSet.getString("confirmpassword"));
				
			}
			return user;
	}

}
