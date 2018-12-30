/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Trang Nguyen
 */
public class Item {
    private Product product;
    private int quatitty;

    public Item() {
    }

    public Item(Product product, int quatitty) {
        this.product = product;
        this.quatitty = quatitty;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuatitty() {
        return quatitty;
    }

    public void setQuatitty(int quatitty) {
        this.quatitty = quatitty;
    }


}
