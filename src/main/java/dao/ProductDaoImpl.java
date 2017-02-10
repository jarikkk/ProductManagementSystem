package dao;

import model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;


public class ProductDaoImpl implements ProductDao {

    private static final Logger logger = LoggerFactory.getLogger(ProductDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(product);
        logger.info("Product successfully saved. Product details: " + product);
    }

    @Override
    public void updateProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(product);
        logger.info("Product successfully updated. Product details: " + product);
    }

    @Override
    public void removeProduct(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = session.load(Product.class, new Integer(id));
        if(product != null) {
            session.delete(product);

        }
        logger.info("Product successfully removed. Product details: " + product);
    }

    @Override
    public Product getProductId(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = session.load(Product.class, new Integer(id));
        logger.info("Product successfully loaded. Product details: " + product);
        return product;
    }

    @Override
    public List<Product> listProducts() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Product> productList = session.createQuery("from Product").list();
        for (Product product : productList) {
            logger.info("Product list: " + product);
        }
        return productList;
    }
}
