package com.cyz.domain;

public class Course {

    private int cid;
    private String cname;
    private String cmsg;
    private int cgrade;

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

    public String getCmsg() {
        return cmsg;
    }

    public void setCmsg(String cmsg) {
        this.cmsg = cmsg;
    }

    public int getCgrade() {
        return cgrade;
    }

    public void setCgrade(int cgrade) {
        this.cgrade = cgrade;
    }

    @Override
    public String toString() {
        return "Course{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", cmsg='" + cmsg + '\'' +
                ", cgrade=" + cgrade +
                '}';
    }
}
