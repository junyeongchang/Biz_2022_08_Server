package com.callor.todo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class TodoVO {
	private long t_seq;
	private String t_author;
	private String t_date;
	private String t_time;
	private String t_todo;
	private String t_check;
	private String t_completion_date;
	private String t_completion_time;
}
