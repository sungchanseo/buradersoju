package com.itwillbs.domain;

/**
 * 페이징 처리를 하기 위한 변수를 저장하는 도메인
 * 
 * @author 성찬스키
 */
public class PagingVO {
	private int startRow;
	private int pageSize;

	public PagingVO() {
		this(1, 5);
	}

	public PagingVO(int startRow, int pageSize) {
		this.startRow = startRow;
		this.pageSize = pageSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "PagingVO [startRow=" + startRow + ", pageSize=" + pageSize + "]";
	}
}
