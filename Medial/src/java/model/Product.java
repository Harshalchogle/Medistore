/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author harshal
 */
public class Product 
{
    private int Product_Id;
    private String Product_Code;
    private String Product_Name;
    private String Company_Name;
    private String Description;
    private String Description2;
    private double price;
    private String Category;
    private int Quantity;

    public int getProduct_Id() {
        return Product_Id;
    }

    public void setProduct_Id(int Product_Id) {
        this.Product_Id = Product_Id;
    }

    public String getProduct_Name() {
        return Product_Name;
    }

    public void setProduct_Name(String Product_Name) {
        this.Product_Name = Product_Name;
    }

    public String getCompany_Name() {
        return Company_Name;
    }

    public void setCompany_Name(String Company_Name) {
        this.Company_Name = Company_Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

  

    public String getDescription2() {
        return Description2;
    }

    public void setDescription2(String Description2) {
        this.Description2 = Description2;
    }

    public String getProduct_Code() {
        return Product_Code;
    }

    public void setProduct_Code(String Product_Code) {
        this.Product_Code = Product_Code;
    }
    
}
