/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model;

/**
 *
 * @author hazee
 */
public class QRCode {
    private int qrCodeID;
    private String userID;
    private String scanType; // e.g. "Check-In", "Check-Out"
    private String scanDateTime;

    public QRCode() {}

    public QRCode(int qrCodeID, String userID, String scanType, String scanDateTime) {
        this.qrCodeID = qrCodeID;
        this.userID = userID;
        this.scanType = scanType;
        this.scanDateTime = scanDateTime;
    }

    public int getQrCodeID() {
        return qrCodeID;
    }

    public void setQrCodeID(int qrCodeID) {
        this.qrCodeID = qrCodeID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getScanType() {
        return scanType;
    }

    public void setScanType(String scanType) {
        this.scanType = scanType;
    }

    public String getScanDateTime() {
        return scanDateTime;
    }

    public void setScanDateTime(String scanDateTime) {
        this.scanDateTime = scanDateTime;
    }
}
