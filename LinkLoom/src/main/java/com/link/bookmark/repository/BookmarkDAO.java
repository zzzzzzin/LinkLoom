package com.link.bookmark.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.util.DBUtil;

public class BookmarkDAO {

	private DBUtil db;
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BookmarkDAO() {
		this.conn = DBUtil.open("13.209.132.224", "linkloom", "java1234");
	}
	
	
}
