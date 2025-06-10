/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model;

/**
 *
 * @author hazee
 */
public class Room {
    private String roomID;
    private String blockName; 
    private String status;   
    private int capacity;
    private int currentOccupancy;

    public Room() {}

    public Room(String roomID, String blockName, String status, int capacity, int currentOccupancy) {
        this.roomID = roomID;
        this.blockName = blockName;
        this.status = status;
        this.capacity = capacity;
        this.currentOccupancy = currentOccupancy;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public String getBlockName() {
        return blockName;
    }

    public void setBlockName(String roomType) {
        this.blockName = roomType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCurrentOccupancy() {
        return currentOccupancy;
    }

    public void setCurrentOccupancy(int currentOccupancy) {
        this.currentOccupancy = currentOccupancy;
    }
}
