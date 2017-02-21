package com.stadograchey.dao;


import com.stadograchey.model.Product;

import java.util.List;

public interface ProductDao {

    public void addProduct(Product product);

    public void updateProduct(Product product);

    public void removeProduct(int id);

    public Product getProductId(int id);

    public List<Product> listProducts();

}
