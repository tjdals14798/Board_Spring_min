package com.spring.ext.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Comment {

	private int c_idx;
	private int board_num;
	private String c_content;
	private String c_writer;
	private String c_indate;
	private int c_chu;
}
