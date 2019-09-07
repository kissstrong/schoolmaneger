package com.cyz.domain;

public class Stu_Course {
    private int sid;
    private String sname;
    private int cid;
    private String cname;
    private int cgrade;

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getCgrade() {
        return cgrade;
    }

    public void setCgrade(int cgrade) {
        this.cgrade = cgrade;
    }

    @Override
    public String toString() {
        return "Stu_Course{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                ", cid=" + cid +
                ", cname='" + cname + '\'' +
                ", cgrade=" + cgrade +
                '}';
    }
}
