package service;

import dao.ProductDao;
import model.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    ProductDao productDao;

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    @Override
    @Transactional
    public void addProduct(Product product) {

    }

    @Override
    @Transactional
    public void updateProduct(Product product) {

    }

    @Override
    @Transactional
    public void removeProduct(int id) {

    }

    @Override
    @Transactional
    public Product getProductId(int id) {
        return null;
    }

    @Override
    @Transactional
    public List<Product> listProducts() {
        return null;
    }
}
