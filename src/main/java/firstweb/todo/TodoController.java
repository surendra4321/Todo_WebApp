package firstweb.todo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import firstweb.dto.Todo;
import firstweb.todoService.TodoService;

@Controller
@SessionAttributes("name")
public class TodoController {

	private TodoService todoService;

	public TodoController(TodoService todoService) {
		this.todoService = todoService;

	}

	@RequestMapping(value = "list-todos", method = RequestMethod.GET)
	public String listAllTodos(ModelMap model) {
		List<Todo> todos = todoService.findByUsername("surendra");
		model.addAttribute("todos", todos);

		return "welcomeTodo";
	}
	
	public String showNewTodoPage(ModelMap model) {
		String username = (String) model.get("name");
		Todo todo = new Todo(0, username, "Des", LocalDate.now().plusYears(1),false);
		model.put("todo", todo);
		return "todo";
	}
	 

	@RequestMapping(value="add-todo", method= RequestMethod.POST)
	public String addNewTodo(ModelMap model, Todo todo) {
		String username = (String)model.get("name");
		todoService.addTodo(username, todo.getDiscription(), LocalDate.now().plusYears(1),true);
			
		return "redirect:welcomeTodo";
	}
	

}
