package firstweb.todoService;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import firstweb.dto.Todo;
import jakarta.validation.Valid;

@Service
public class TodoService {

	private static List<Todo> todos = new ArrayList<Todo>();
	private static int todoCount = 0;

	static {
		todos.add(new Todo(++todoCount, "in28minutes", "Learn AWS", LocalDate.now().plusYears(1), false));
		todos.add(new Todo(++todoCount, "in28minutes", "Learn DevOps", LocalDate.now().plusYears(2), false));
		todos.add(new Todo(++todoCount, "in28minutes", "Learn Full Stack Development", LocalDate.now().plusYears(3),
				false));
	}

	public List<Todo> findByUsername(String username) {

		return todos;
	}

	public void addTodo(String username, String discription, LocalDate plusYears, boolean b) {

		todos.add(new Todo(++todoCount, username, discription, plusYears, b));

	}

	public boolean deleteById(int id) {
//		Todo todo = new Todo();
//		     Predicate<? super Todo> predicate= t -> todo.getId()==id;
//		     todos.removeIf(predicate);
		
		return todos.removeIf(todo ->todo.getId()==id);
		
		
	}

	public Todo findById(int id) {
		Predicate<? super Todo> predicate = todo -> todo.getId() == id;
		Todo todo = todos.stream().filter(predicate).findFirst().get();
		return todo;
	}

	public void updateTodo(@Valid Todo todo) {
		for(int i=0; i<todos.size(); i++) {
			if(todos.get(i).getId()== todo.getId()) {
				todos.set(i, todo);
				return;
			}
			
		}
		todos.add(todo);
		 
		
	}

	 

}
