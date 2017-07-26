package mis;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 连接数据库的通用类。
 * @author Administrator
 *
 */
public class BaseDao {

	/**
	 * 得到连接对象的方法
	 * @return
	 */
	public Connection getConn(){
		Connection conn=null;
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("com.mysql.jdbc.Driver");
			//根据用户名和密码连接到指定url的数据库
			conn=DriverManager.getConnection("jdbc:mysql://115.236.64.234:3306/bojcf","root","Bdone2016!@");
			//conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "XJGL2", "XJGL2");	
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return conn;
	}
	
	/**
	 * 增删改
	 * @param sql 执行的sql语句
	 * @param param 数组中存放的是?号的填充数据
	 */
	public void exeSql(String sql,Object[] param){//insert into dept(deptno,dname,loc) values(?,?,?)
		Connection conn=null;
		conn=this.getConn();
		
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql);
			//如果数组不为空，说明这个sql语句有?号，那我们就用数组中的数据，一一填充。
			if(param!=null){
				for(int i=0;i<param.length;i++){
					pstmt.setObject(i+1, param[i]);
				}
			}
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 
	 * @param sql
	 * @param param
	 * @return 查询之后的结果集 使用ResultSet来表示
	 */
	public ResultSet getRs(String sql,Object[] param){//select * from 表 where id=? and name=?
		ResultSet rs=null;
		Connection conn=null;
		conn=this.getConn();
		
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql);
			if(param!=null){
				for(int i=0;i<param.length;i++){
					pstmt.setObject(i+1,param[i]);
				}
			}
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}	
	
	/**
	 * 得到总记录数
	 * @param sql
	 * @param param
	 * @return
	 */
	public int getRowCount(String sql,Object[] param){//select count(*) from dept
		ResultSet rs=this.getRs(sql, param);
		int count=0;
		try {
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ResultSet getResult(String sql,Object[] param){//select * from 表 where id=? and name=?
		ResultSet rs=null;
		Connection conn=null;
		conn=this.getConn();
		
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql);
			if(param!=null){
				for(int i=0;i<param.length;i++){
					pstmt.setObject(i+1,param[i]);
				}
			}
			rs=pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		
		return rs;
	}	
	
	
    
}
