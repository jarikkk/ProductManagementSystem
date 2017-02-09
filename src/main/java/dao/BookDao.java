package dao;


import model.Product;

public interface BookDao {

    public void addProduct(Product product);

    public void updateProduct(Product product);

    public void removeProduct(int id);

}
