/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ksinn
 */
public class Theme {
    
    private String name;
    private int id;
    
    public Theme(int id, String name){
        this.id = id;
        this.name = name;
    }
    
    public Theme(){
    }
    
    public String getName(){
        return name;
    }
    
    public int getId(){
        return id;
    }
    
}
