package firstweb.todo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import firstweb.dto.Todo;
import firstweb.service.AuthenticationService;
import firstweb.todoService.TodoService;
import jakarta.validation.Valid;

@Controller
@SessionAttributes("name")
public class TodoController {

	public TodoController() {

	}

	@Autowired
	private TodoService todoService;
	@Autowired
	private AuthenticationService authenticationService;

	public TodoController(TodoService todoService, AuthenticationService authenticationService) {
		this.todoService = todoService;
		this.authenticationService = authenticationService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String gotoLoginPage() {
		return "login";
	}

	@RequestMapping(value = "log", method = RequestMethod.POST)
	public String gotoWelcomePage(@RequestParam String name, @RequestParam String password, ModelMap model) {
		if (authenticationService.auth(name, password)) {
			 model.addAttribute("name",name);
			return "welcome";
		}else
		{
		model.addAttribute("errorMessage", "Invalid Credentials!, Please try again!");  
		}
		return "login";
	}

	@RequestMapping(value = "/welcomeTodo", method = RequestMethod.GET)
	public String listAllTodos(ModelMap model) {
		List<Todo> todos = todoService.findByUsername("surendra");
		model.addAttribute("todos", todos);

		return "welcomeTodo";
	}

	@RequestMapping(value = "add-todo", method = RequestMethod.GET)
	public String showNewTodoPage(ModelMap model) {
		String username = (String) model.get("name");
		Todo todo = new Todo(0, username, "", LocalDate.now().plusYears(1), false);
		model.put("todo", todo);
		return "todo";
	}

	@RequestMapping(value = "add-todos", method = RequestMethod.POST)
	public String addNewTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
		if (result.hasErrors()) {
			return "todo";
		}
		String username = (String) model.get("name");
		todoService.addTodo(username, todo.getDiscription(), LocalDate.now().plusYears(1), false);
		return "redirect:/welcomeTodo";
	}

}
