package firstweb.todo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import firstweb.dto.Todo;
import firstweb.todoRepository.TodoRepository;
import firstweb.todoService.TodoService;
import jakarta.validation.Valid;

@Controller
@SessionAttributes("name")
public class TodoControllerJpa {

	public TodoControllerJpa() {

	}

	@Autowired
	private TodoService todoService;
	@Autowired
	private TodoRepository todoRepository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String gotoLoginPage(ModelMap model) {
		model.put("name", getLoggedinUsername());
		return "welcome";
	}

	private String getLoggedinUsername() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return authentication.getName();
	}

	@RequestMapping(value = "/welcomeTodo", method = RequestMethod.GET)
	public String listAllTodos(ModelMap model) {
		String username = (String) model.get("name");
		List<Todo> todos = todoRepository.findByUsername(username);
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
		todo.setUsername(username);
		todoRepository.save(todo);
		return "redirect:/welcomeTodo";
	}

	@RequestMapping("delete-todo")
	public String deleteTodo(@RequestParam int id, RedirectAttributes redirectAttributes) {
		if (todoRepository.existsById(id)) {
			todoRepository.deleteById(id);
			redirectAttributes.addFlashAttribute("msg", "Todo Deleted Succesfully!");
		} else {
			redirectAttributes.addFlashAttribute("msg", "Todo Not found");
		}
		return "redirect:/welcomeTodo";
	}

	@RequestMapping(value = "update-todo", method = RequestMethod.GET)
	public String showUpdateTodoPage(@RequestParam int id, ModelMap model) {
		Todo todo = todoRepository.findById(id).get();
		model.addAttribute("todo", todo);
		return "todo";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
		if (result.hasErrors()) {
			return "todo";
		}
		String username = (String) model.get("name");
		todo.setUsername(username);
		todoRepository.save(todo);
		return "redirect:welcomeTodo";
	}
}
