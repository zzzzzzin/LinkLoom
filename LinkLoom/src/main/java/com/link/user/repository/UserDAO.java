package com.link.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.link.user.model.UserDTO;
import com.test.util.DBUtil;

public class UserDAO {

	private DBUtil db;
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO() {
		this.conn = DBUtil.open("13.209.132.224", "linkloom", "java1234");
	}

	
	public UserDTO getUserInfo(String id) {

		try {
			
			String sql = "select * from tblUserAccount where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				UserDTO udto = new UserDTO();
				
				udto.setUser_account_pk(rs.getString("user_account_pk"));
				udto.setUser_pk(rs.getString("user_pk"));
				udto.setAccount_status_pk(rs.getString("account_status_pk"));
				udto.setId(rs.getString("id"));
				udto.setNickname(rs.getString("nickname"));
				udto.setRepresentative_interests(rs.getString("representative_interests"));
				udto.setJoin_date(rs.getString("join_date"));
				
				return udto;
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
	
	
}
