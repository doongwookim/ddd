package com.micro.shop.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.micro.shop.board.vo.BoardVO;
import com.micro.shop.common.DAO;

public class BoardDao extends DAO {
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BoardDao() {
		super();
	}

	public ArrayList<BoardVO> selectList() {

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();

		return list;
	}

	public BoardVO select(BoardVO vo) {

		return vo;
	}

	public int insert(BoardVO vo) {

		int n = 0;

		return n;

	}

	public int delete(BoardVO vo) {

		int n = 0;

		return n;

	}

	public int update(BoardVO vo) {

		int n = 0;

		String sql = "update tableName set col = ? where id= ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setInt(2, vo.getId());
			n=pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;

	}

	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
