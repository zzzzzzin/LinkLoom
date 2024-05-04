package com.link.user.model;

import lombok.Data;

@Data
public class UserDTO {

	private static String name;
	private static String user_account_pk;
	public static String getUser_account_pk() {
		return user_account_pk;
	}
	public static void setUser_account_pk(String user_account_pk) {
		UserDTO.user_account_pk = user_account_pk;
	}
	private static String user_pk;
	private static String account_status_pk;
	private static String id;
	private static String nickname;
	private static String representative_interests;
	private static String join_date;
	
	public static String getName() {
		return name;
	}
	public static void setName(String name) {
		UserDTO.name = name;
	}
	public static String getUser_pk() {
		return user_pk;
	}
	public static void setUser_pk(String user_pk) {
		UserDTO.user_pk = user_pk;
	}
	public static String getAccount_status_pk() {
		return account_status_pk;
	}
	public static void setAccount_status_pk(String account_status_pk) {
		UserDTO.account_status_pk = account_status_pk;
	}
	public static String getId() {
		return id;
	}
	public static void setId(String id) {
		UserDTO.id = id;
	}
	public static String getNickname() {
		return nickname;
	}
	public static void setNickname(String nickname) {
		UserDTO.nickname = nickname;
	}
	public static String getRepresentative_interests() {
		return representative_interests;
	}
	public static void setRepresentative_interests(String representative_interests) {
		UserDTO.representative_interests = representative_interests;
	}
	public static String getJoin_date() {
		return join_date;
	}
	public static void setJoin_date(String join_date) {
		UserDTO.join_date = join_date;
	}
	
}
