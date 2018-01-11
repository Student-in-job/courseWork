
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ksinn
 */
public class DBHelper {
    private static DBHelper helper;
    
    public static DBHelper getInstance(){
        if(helper == null)
            helper = new DBHelper();
        return helper;
            
    }
    
    
    private Connection getConnection() throws NamingException, SQLException{
        InitialContext initContext;
        initContext = new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/DB");
        return ds.getConnection();
    }
    
    public Collection<Theme> getFreeThemes(int subject_id, int group_id) throws SQLException, NamingException{
        String sql = "select * from themes where subject_id=? and id not in (select theme_id from works where group_id=?)";
        Connection conn = getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, subject_id);
        stmt.setInt(2, group_id);
        ResultSet rs = stmt.executeQuery();
        ArrayList<Theme> list = new ArrayList<Theme>();
        while(rs.next()){
            Theme t = new Theme(rs.getInt("id"), rs.getString("title"));
            list.add(t);
        }
        conn.close();
        return list;
        
    }
    
    public boolean checkStudent(int subject_id, int student_id) throws SQLException, NamingException{
        String sql = "select * from works where theme_id in (select id from themes where subject_id=?) and stud_id=? ";
        Connection conn = getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, subject_id);
        stmt.setInt(2, student_id);
        ResultSet rs = stmt.executeQuery();
        boolean res = rs.next();
        conn.close();
        return !res;
    }
    
    public boolean saveWork(Work work) throws SQLException, NamingException{
        String sql = "insert into works(stud_id, theme_id, group_id, subject_id) value (?, ?, (select group_id from students where id=?), (select subject_id from themes where id=?));";
        Connection conn = getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, work.student.id);
        stmt.setInt(2, work.theme);
        stmt.setInt(3, work.student.id);  
        stmt.setInt(4, work.theme);
        int executeUpdate = stmt.executeUpdate();
        conn.close();
        return executeUpdate!=0;
    }
    
    public Student getStudent(String pass) throws SQLException, NamingException{
        Student s = null;
        String sql = "select * from students where id=(select stud_id from passwords where pass=?)";
        Connection conn = getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, pass);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            s = new Student();
            s.id = rs.getInt("id");
            s.name = rs.getString("name");
            s.name2 = rs.getString("surname");
            s.group_id = rs.getInt("group_id");
            
        }
        conn.close();
        return s;
    }
    
    
    public Collection<Student> getStudents(int group_id) throws SQLException, NamingException{
        Student s = null;
        String sql = "select * from students where group_id=?";
        Connection conn = getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, group_id);
        ResultSet rs = stmt.executeQuery();
        ArrayList<Student> list = new ArrayList<Student>();        
        while(rs.next()){
            s = new Student();
            s.id = rs.getInt("id");
            s.name = rs.getString("name");
            s.name2 = rs.getString("surname");
            s.group_id = rs.getInt("group_id");
            
            list.add(s);
         }
        conn.close();
        return list;
    }
    
    public Map<Integer, String> getGroups() throws SQLException, NamingException{
        String sql = "select * from groups";
        Connection conn = getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        HashMap<Integer, String> list = new HashMap<Integer, String>();
        while(rs.next()){
            int id = rs.getInt("id");
            String num = rs.getString("number");
            list.put(id, num);
         }
        conn.close();
        return list;
    }
    
}
