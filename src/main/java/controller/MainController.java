/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.validation.Valid;
import javax.ws.rs.QueryParam;
import model.Breweries;
import model.BreweriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author hyoku
 */

@Controller
@RequestMapping("/main") 
//@SessionAttributes("main")
public class MainController {
    
    @Autowired
    BreweriesService service;
    
    
    @RequestMapping("")
    public ModelAndView diplayAllBrews() {
        
        return new ModelAndView("/allBrews", "brewList", service.getAllBrews());
    }
    
    @GetMapping("/add")
    public ModelAndView displayAgentAddForm() {
        return new ModelAndView("/addBrewery", "brewery", new Breweries());
    }

    @PostMapping("/addBrewery")
    public ModelAndView addBrewery(@Valid @ModelAttribute("brewery") Breweries brewery, BindingResult result, ModelMap model) {
        brewery.setImage("no_image.jpg");
        if (result.hasErrors()) {
            return new ModelAndView("/editBrewery");
        }
        System.out.println("Add Brewery!!!!!!!!!!!!!!!!!!!!!!");
        service.addBrewery(brewery);
        return new ModelAndView("redirect:/main/");
    }
 
    
    
    
    
    @RequestMapping("/edit")
    public ModelAndView editBreweryForm(@QueryParam("id") int id) {
        return new ModelAndView("/editBrewery", "brewery", service.getBreweryById(id));
    }
    
    
    @PostMapping("/editBrewery")
    public ModelAndView editAgent(@Valid @ModelAttribute("brewery") Breweries brewery, BindingResult result, ModelMap model) {
        System.out.println("Brewery: " + brewery);
        brewery.setImage("no_image.jpg");
        if (result.hasErrors()) {
            return new ModelAndView("/editBrewery");
        }
        
        service.editBrewery(brewery);
        return new ModelAndView("redirect:/main/");
    }
        
    
    
    @GetMapping("/delete")
    public ModelAndView deleteBrewery(@QueryParam("id") int id) {
  
        System.out.println("delete stuff!!");
        service.deleteBrewery(id);
        return new ModelAndView("redirect:/main/", "brewList", service.getAllBrews());
    }

    
         

    
    
}
