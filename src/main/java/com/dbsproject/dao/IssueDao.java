package com.dbsproject.dao;

import com.dbsproject.bean.Issue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class IssueDao {
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/issueTracker","root","froozer");
        }catch(Exception e){System.out.println(e);}
        return con;
    }

    public static int save(Issue i){
        int status = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "insert into issues(title, description, status, owner, assignedTo) values(?,?,?,?,?)");
            ps.setString(1, i.getTitle());
            ps.setString(2, i.getDescription());
            ps.setString(3, i.getStatus());
            ps.setString(4, i.getOwner());
            ps.setString(5, i.getAssignedTo());
            status = ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }

    public static int update(Issue i){
        int status = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "update issues set title=?,description=?,status=?,owner=?,assignedTo=? where id=?");
            ps.setString(1,i.getTitle());
            ps.setString(2,i.getDescription());
            ps.setString(3,i.getStatus());
            ps.setString(4,i.getOwner());
            ps.setString(5,i.getAssignedTo());
            ps.setInt(6,i.getId());
            status = ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }

    public static int delete(Issue i){
        int status = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from issues where id=?");
            ps.setInt(1,i.getId());
            status = ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}

        return status;
    }

    public static List<Issue> getAllRecords(){
        List<Issue> list=new ArrayList<Issue>();

        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from issues");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Issue i = new Issue();
                i.setId(rs.getInt("id"));
                i.setTitle(rs.getString("title"));
                i.setDescription(rs.getString("description"));
                i.setStatus(rs.getString("status"));
                i.setOwner(rs.getString("owner"));
                i.setAssignedTo(rs.getString("assignedTo"));
                list.add(i);
            }
        }catch(Exception e){System.out.println(e);}
        return list;
    }

    public static Issue getRecordById(int id){
        Issue i = null;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from issues where id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                i=new Issue();
                i.setId(rs.getInt("id"));
                i.setTitle(rs.getString("title"));
                i.setDescription(rs.getString("description"));
                i.setStatus(rs.getString("status"));
                i.setOwner(rs.getString("owner"));
                i.setAssignedTo(rs.getString("assignedTo"));
            }
        }catch(Exception e){System.out.println(e);}
        return i;
    }

    public static int getTotalNumIssues() {
        int count = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select count(id) from issues");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                count = rs.getInt("count(id)");
//                System.out.println(count);
            }
        }catch(Exception e){System.out.println(e);}
        return count;
    }

    public static int getNumFromStatus(String status) {
        int count = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select count(id) from issues where status=?");
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                count = rs.getInt("count(id)");
                System.out.println(count);
            }
        }catch(Exception e){System.out.println(e);}
        return count;
    }
}
