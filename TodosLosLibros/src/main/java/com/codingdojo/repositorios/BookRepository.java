package com.codingdojo.repositorios;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

import com.codingdojo.modelos.Book;

//...
@Repository
public interface BookRepository extends CrudRepository<Book, Long>{
 // este método recupera todos los libros de la base de datos
 List<Book> findAll();
 // este método encuentra libros con descripciones que contienen la cadena de búsqueda
 List<Book> findById(long id);
 // este método cuenta cuántos títulos contienen una determinada cadena
 Long countByTitleContaining(String search);
 // este método elimina un libro que comienza con un título específico
 //Long deleteByTitleStartingWith(String search);
 
 @SuppressWarnings("unchecked")
	Book save(Book nuevoBook);
 
 @Transactional
	Long deleteById (long id);
 
}
