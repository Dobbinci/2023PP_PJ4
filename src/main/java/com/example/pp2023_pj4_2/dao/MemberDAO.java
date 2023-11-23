package com.example.pp2023_pj4_2.dao;

import com.example.pp2023_pj4_2.bean.MemberVO;
import com.example.pp2023_pj4_2.util.MariaDBUtil;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    private final String Member_INSERT = "insert into Member (name, local_planet, species, " +
            "purpose) values(?,?,?,?)";
    private final String Member_GET = "select * from Member where id=?";
    private final String Member_LIST = "select * from Member order by id desc";
    private final String Member_DELETE = "delete from Member where id=?";
    private final String Member_UPDATE = "update Member set name=?, local_planet=?, species=?, purpose=? where id=?";

    public MemberVO getMember(int id) {
        System.out.println("===> get 처리");
        try{
            conn = MariaDBUtil.getConnection();

            stmt = conn.prepareStatement(Member_GET);

            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            MemberVO vo = new MemberVO();
            if(rs.next()) {
                vo.setId(rs.getInt("id"));
                vo.setName(rs.getString("name"));
                vo.setLocal_planet(rs.getString("local_planet"));
                vo.setSpecies(rs.getString("species"));
                vo.setPurpose(rs.getString("purpose"));
            }

            return vo;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void deleteMember(int id) {
        System.out.println("===> delete 처리");
        try {
            conn = MariaDBUtil.getConnection();
            stmt = conn.prepareStatement(Member_DELETE);

            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public void updateMember(MemberVO vo) {
        System.out.println("===> update 처리");
        try {
            conn = MariaDBUtil.getConnection();
            stmt = conn.prepareStatement(Member_UPDATE);

            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getLocal_planet());
            stmt.setString(3, vo.getSpecies());
            stmt.setString(4, vo.getPurpose());
            stmt.setInt(5, vo.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }


    public int insertMember(MemberVO vo) {
        System.out.println("===> insert 처리");
        try {
            conn = MariaDBUtil.getConnection();
            stmt = conn.prepareStatement(Member_INSERT);
            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getLocal_planet());
            stmt.setString(3, vo.getSpecies());
            stmt.setString(4, vo.getPurpose());

            stmt.executeUpdate();
            return 1;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public List<MemberVO> listMember() {
        System.out.println("==> list 처리");
        List<MemberVO> memberList = new ArrayList<>();
        try {
            conn = MariaDBUtil.getConnection();
            stmt = conn.prepareStatement(Member_LIST);
            rs = stmt.executeQuery();

            while(rs.next()) {
                MemberVO vo = new MemberVO();
                vo.setId(rs.getInt("id"));
                vo.setName(rs.getString("name"));
                vo.setLocal_planet(rs.getString("local_planet"));
                vo.setSpecies(rs.getString("species"));
                vo.setPurpose(rs.getString("purpose"));

                memberList.add(vo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
                if (rs != null) rs.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return memberList;
    }
}
