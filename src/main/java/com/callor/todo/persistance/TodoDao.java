package com.callor.todo.persistance;

import com.callor.todo.model.TodoVO;

public interface TodoDao extends GenericDao<TodoVO, Long> {
	public void create_user_table();
}
