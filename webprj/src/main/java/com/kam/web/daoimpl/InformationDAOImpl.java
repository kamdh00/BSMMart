package com.kam.web.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kam.web.conn.DBConn;
import com.kam.web.dao.InformationDAO;
import com.kam.web.vo.InformationVO;
import com.kam.web.vo.ProductVO;

@Repository
public class InformationDAOImpl implements InformationDAO {

	@Autowired
	private DataSource dataSource;

	// 공지사항 목록 보기
	public ArrayList<InformationVO> getInformationList() {
		ArrayList<InformationVO> informationList = new ArrayList<InformationVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT I_NO, I_TITLE, I_WRITER ,I_WRITEDAY FROM INFORMATION ORDER BY I_NO DESC";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				InformationVO informationBoard = new InformationVO();
				informationBoard.setiNo(rs.getInt(1));
				informationBoard.setiTitle(rs.getString(2));
				informationBoard.setiWriter(rs.getString(3));
				informationBoard.setiWriteday(rs.getString(4));
				informationList.add(informationBoard);
			}

		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return informationList;
	}
	
	// 공지사항 글 정보 
		public InformationVO getInformationDetail(int no){			
			InformationVO informationDetail=new InformationVO();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try{
				System.out.println("공지사항 상세보기 IN");
				conn = dataSource.getConnection();
				String sql = "SELECT I_NO, I_TITLE, I_CONTENT, I_PWD";
				sql +=" FROM INFORMATION WHERE I_NO="+no;
				pstmt = conn.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				if(rs.next()){
					System.out.println(">>>>>"+rs.getString(2));
					informationDetail.setiNo(rs.getInt(1));
					informationDetail.setiTitle(rs.getString(2));
					informationDetail.setiContent(rs.getString(3));		
					informationDetail.setiPwd(rs.getString(4));
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				try{
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
			return informationDetail;
		}
}
