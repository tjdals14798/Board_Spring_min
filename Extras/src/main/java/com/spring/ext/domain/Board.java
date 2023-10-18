package com.spring.ext.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Board {
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private String address;
	private int chu;
	private int hits;
	private int bcnt;
}
