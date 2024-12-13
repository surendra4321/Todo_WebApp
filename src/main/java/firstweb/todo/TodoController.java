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

import firstweb.todoService.TodoService;
import jakarta.validation.Valid;

@Controller
@SessionAttributes("name")
public class TodoController {

	public TodoController() {

	}

	@Autowired
	private TodoService todoService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String gotoLoginPage(ModelMap model) {
		model.put("name", "surendra");
		return "welcome";
	}

//	private String getLoggedinUsername() {
//		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//	return authentication.getName();
//	}

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

	@RequestMapping("delete-todo")
	public String deleteTodo(@RequestParam int id, RedirectAttributes redirectAttributes) {
		boolean isDeleted = todoService.deleteById(id);
		if (isDeleted) {
			redirectAttributes.addFlashAttribute("msg", "Todo Deleted Succesfully!");
		} else {
			redirectAttributes.addFlashAttribute("msg", "Todo Not found");
		}
		return "redirect:/welcomeTodo";
	}

	@RequestMapping(value = "update-todo", method = RequestMethod.GET)
	public String showUpdateTodoPage(@RequestParam int id, ModelMap model) {
		Todo todo = todoService.findById(id);
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
		todoService.updateTodo(todo);
		return "redirect:welcomeTodo";
	}
}
