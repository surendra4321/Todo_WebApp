package firstweb.todoService;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import firstweb.dto.Todo;

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

}
