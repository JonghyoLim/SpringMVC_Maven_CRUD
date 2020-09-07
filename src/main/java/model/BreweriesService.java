/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Service;

/**
 *
 * @author hyoku
 */
@Service
public class BreweriesService {

    public List<Breweries> getAllBrews() {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        TypedQuery<Breweries> tq = em.createNamedQuery("Breweries.findAll", Breweries.class);
        System.out.println("Display All");
        List<Breweries> breweriesList = new ArrayList<>();
        try {
            breweriesList = tq.getResultList();
        } catch (Exception e) {
            System.out.println(e);
        }
        return breweriesList;
    }

    public Breweries getBreweryById(int id) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        TypedQuery<Breweries> tq = em.createNamedQuery("Breweries.findById", Breweries.class).setParameter("id", id);

        Breweries b = null;
        try {
            b = tq.getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
        return b;
    }
    
    
        
    public void addBrewery(Breweries b) { 
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction transaction = em.getTransaction();
      
        try {
            transaction.begin();
            em.persist(b);
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

    public void editBrewery(Breweries b) {
        System.out.println(" -- Brewery -- : edit Breweries Service!!!!!!!!!!!!!!!!!!!!!!!!!!");
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.merge(b);
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
       
            em.close();
        }
    }

    public void deleteBrewery(int id) {

        EntityManager em = DBUtil.getEmf().createEntityManager();
        TypedQuery<Breweries> tq = em.createNamedQuery("Breweries.findById", Breweries.class).setParameter("id", id);
        EntityTransaction trans = em.getTransaction();

        try {
            Breweries b = tq.getSingleResult();
            trans.begin();
            em.remove(em.merge(b));
            trans.commit();
            System.out.println("Removed: " + b.getId());
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {

            em.close();
        }

    }
    
    
    

}
