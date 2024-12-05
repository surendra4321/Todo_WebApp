package firstweb.todo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import firstweb.dto.Todo;
import firstweb.service.AuthenticationService;
import firstweb.todoService.TodoService;

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
			model.put("name", name);
			return "welcome";
		}
		model.put("errorMessage", "Invalid Credentials!, Please try again!");
		return "welcome";
	}

	@RequestMapping(value = "list-todos", method = RequestMethod.GET)
	public String listAllTodos(ModelMap model) {
		List<Todo> todos = todoService.findByUsername("surendra");
		model.addAttribute("todos", todos);

		return "welcomeTodo";
	}

}
