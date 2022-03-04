package com.codingdojo.controladores;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.modelos.Book;
import com.codingdojo.servicios.BookService;


@Controller
public class ControladorBook {
	private final BookService bookService;
	
    public ControladorBook(BookService bookService){   //constructor
        this.bookService = bookService;
    }
	
    //empiezo a definir rutas
    
    @RequestMapping(value ="/", method = RequestMethod.GET)
    public String index (Model model) {  //model atributo de lista
    	List<Book> listaBooks = bookService.allBooks();
    	model.addAttribute("listaBooks", listaBooks);
    	return "index.jsp";
    }
   
    
    @RequestMapping(value ="/books", method = RequestMethod.GET)
    public String despliegaBooks (Model model) {  //model atributo de lista
    	List<Book> listaBooks = bookService.allBooks();
    	model.addAttribute("listaBooks", listaBooks);
    	return "index.jsp";
    }
    
    @RequestMapping( value="/registro", method=RequestMethod.GET)
	public String despliegaRegistro(@ModelAttribute("book") Book nuevoBook) {
		return "new.jsp";
	}
    
    @RequestMapping( value="/registrar", method=RequestMethod.POST)
	public String registrarBook(@Valid @ModelAttribute("book")Book nuevoBook,BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("ENTRANDO AL");
			return "new.jsp";
		}
		else {
		//System.out.println(nuevoUsuario.getNombre());
			bookService.createBook(nuevoBook);
			
			return "redirect:/books";
	    }	
	}
    
    @RequestMapping( value="/books/{id}", method = RequestMethod.GET)
	public String showBook(@PathVariable("id") Long id, Model model) {
    	Book libro = bookService.findBook(id);
    	model.addAttribute("libro", libro);
		return "show.jsp";
	}
    
    @RequestMapping(value="/books/{id}/edicion", method = RequestMethod.GET)
    public String despliegaEdicionBook(@PathVariable("id") Long id, Model model) {
    	Book book = bookService.findBook(id);
        model.addAttribute("book", book);
    	return "editar.jsp";
    }
    
    
    @RequestMapping( value="/books/{id}/editar", method = RequestMethod.PUT)
	public String editarBook(@Valid @PathVariable("id") Long id, Model model, @ModelAttribute("book")Book editarBook) {
    	bookService.updateBook(editarBook.getId(), editarBook.getTitle(), editarBook.getDescription(), editarBook.getLanguage(), editarBook.getNumberOfPages());
		return "redirect:/books/{id}";
	}

    @RequestMapping( value="/eliminar/{id}", method = RequestMethod.DELETE)
	public String eliminarBook(@PathVariable("id") Long id ) {
		bookService.deleteBook(id);
		return "redirect:/books";
	}
}
