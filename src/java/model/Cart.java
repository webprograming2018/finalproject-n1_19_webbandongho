/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Trang Nguyen
 */
public class Cart {
    private HashMap<Long, Item> cartItems; //cartItems lưu trữ dữ liệu dưới dạng Long-Item, truy xuất Item thông qua Long

    public Cart() {
        cartItems = new HashMap<>();
    }

    public Cart(HashMap<Long, Item> CartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<Long, Item> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }
    //insert to cart
    public void plusToCart(Long key, Item item) {
        boolean check = cartItems.containsKey(key);//containsKey(Object key): trả về true nếu Map có chứa key, ngược lại trả về false
                                                  //get (Object key): trả về giá trị của key nếu key tồn tại, ngược lại trả về null
                                                  //put (K key, V value): thêm vào một phần tử có key và value tương ứng
        if(check) {
            int quantitty_old = item.getQuatitty();
            item.setQuatitty(quantitty_old + 1);
            cartItems.put(key, item);
        }else {
            cartItems.put(key, item);
        }
    }
    //sub to cart
    public void subToCart(Long key, Item item) {
        boolean check = cartItems.containsKey(key);
        if(check) {
            int quantity_old = item.getQuatitty();
            if(quantity_old <= 1) {
                cartItems.remove(key);
            }
            else {
                item.setQuatitty(quantity_old - 1);
                cartItems.put(key, item);
            }
            
        }
//        else {
//            cartItems.put(key, item);
//        }
    }
    //remove to cart
    public void removeToCart(Long key) {
        boolean check = cartItems.containsKey(key);
        if(check) {
            cartItems.remove(key);
        }
    }
    //count item
    public int countItem() {
        return cartItems.size();
    }
    //sum total
    public double totalCart() {
        double count = 0;
        //count = product price * quantity
        //cung cấp các phương pháp để truy xuất các key và value.
        for(Map.Entry<Long, Item> list: cartItems.entrySet()){ //show CartItems; trả lại đối tượng CartItems có chứa tất cả các keys và values.
            count += list.getValue().getProduct().getProductPrice() * list.getValue().getQuatitty();
        }
        return count;
    }
}
