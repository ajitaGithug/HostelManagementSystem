package com.hostel.model;

import java.util.Date;

public class Approval {
    private String approvalID;
    private String approvalStatus;
    private Date requestedAt;
    private Date approvedAt;
    private String requestedByID;
    private String approvedByID;

    // Getters
    public String getApprovalID() {
        return approvalID; 
    }
    public String getApprovalStatus() {
        return approvalStatus; 
    }
    public Date getRequestedAt() {
        return requestedAt; 
    }
    public Date getApprovedAt() {
        return approvedAt; 
    }
    public String getRequestedByID() {
        return requestedByID; 
    }
    public String getApprovedByID() {
        return approvedByID; 
    }

    // Setters
    public void setApprovalID(String approvalID) {
        this.approvalID = approvalID; 
    }
    public void setApprovalStatus(String approvalStatus) { 
        this.approvalStatus = approvalStatus; 
    }
    public void setRequestedAt(Date requestedAt) {
        this.requestedAt = requestedAt; 
    }
    public void setApprovedAt(Date approvedAt) {
        this.approvedAt = approvedAt; 
    }
    public void setRequestedByID(String requestedByID) {
        this.requestedByID = requestedByID; 
    }
    public void setApprovedByID(String approvedByID) {
        this.approvedByID = approvedByID; 
    }
}
