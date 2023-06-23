package com.itwillbs.domain;

/**
 * 페이징+검색기능+필터처리를 하기 위한 변수를 저장하는 도메인
 * 
 * @author 성찬스키
 */
public class PagingVO {
	/////기본사항////////////////////////////////
	
	//테이블 정보를 위한 변수 선언
	private String table;
	/*
	 * 사용하는 테이블에 맞게 변수값을 넣어 사용하세요.
	 */
	
	//컬럼 상태를 위한 변수 선언 
	private String status_name; 
	/*
	 *0일때 출력하도록 기본 설정 되어 있습니다 .주의하세요.
	 *데이타베이스 컬럼이름이 다를 경우 String 변수에 따로 저장해서 사용하세요. 
	 *ex) int status = CustomerVO.getCust_sataus();
	 */
	private String status_value;
	
	/////본격적인 페이징처리 변수들//////////////////
	
	//검색어처리를 위한 변수 선언
	private String selector; //검색자 
	private String search; //검색어

	//필터처리를 위한 변수 선언 
	private String column_name; //필터 컬럼 이름
	private String column_value; //필터 컬럼 
	
	//페이지번호
	private Integer pageNum;
	
	//글번호
	private String id;

	//페이징처리를 위한 변수 선언1 
	private Integer startRow; 
	private Integer pageSize;
	private Integer endRow;

	//페이징처리를 위한 변수 선언2
	private Integer pageCount;
	private Integer pageBlock;
	private Integer startPage;
	private Integer endPage;
	private Integer currentPage;
	
	
	//출력객체 지정을 위한 객체 변수 선언 
	private ContractVO ContractVO;
	private CustomerVO CustomerVO;
	private EmployeeVO EmployeeVO;
	private LoginVO LoginVO;
	private MaterialVO MaterialVO;
	private OrderVO OrderVO;
	private ProductionVO ProductionVO;
	
	
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	public String getStatus_value() {
		return status_value;
	}
	public void setStatus_value(String status_value) {
		this.status_value = status_value;
	}
	public String getSelector() {
		return selector;
	}
	public void setSelector(String selector) {
		this.selector = selector;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getColumn_name() {
		return column_name;
	}
	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}
	public String getColumn_value() {
		return column_value;
	}
	public void setColumn_value(String column_value) {
		this.column_value = column_value;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getEndRow() {
		return endRow;
	}
	public void setEndRow(Integer endRow) {
		this.endRow = endRow;
	}
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public Integer getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(Integer pageBlock) {
		this.pageBlock = pageBlock;
	}
	public Integer getStartPage() {
		return startPage;
	}
	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}
	public Integer getEndPage() {
		return endPage;
	}
	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public ContractVO getContractVO() {
		return ContractVO;
	}
	public void setContractVO(ContractVO contractVO) {
		ContractVO = contractVO;
	}
	public CustomerVO getCustomerVO() {
		return CustomerVO;
	}
	public void setCustomerVO(CustomerVO customerVO) {
		CustomerVO = customerVO;
	}
	public EmployeeVO getEmployeeVO() {
		return EmployeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		EmployeeVO = employeeVO;
	}
	public LoginVO getLoginVO() {
		return LoginVO;
	}
	public void setLoginVO(LoginVO loginVO) {
		LoginVO = loginVO;
	}
	public MaterialVO getMaterialVO() {
		return MaterialVO;
	}
	public void setMaterialVO(MaterialVO materialVO) {
		MaterialVO = materialVO;
	}
	public OrderVO getOrderVO() {
		return OrderVO;
	}
	public void setOrderVO(OrderVO orderVO) {
		OrderVO = orderVO;
	}
	public ProductionVO getProductionVO() {
		return ProductionVO;
	}
	public void setProductionVO(ProductionVO productionVO) {
		ProductionVO = productionVO;
	}
	@Override
	public String toString() {
		return "PagingVO [table=" + table + ", status_name=" + status_name + ", status_value=" + status_value
				+ ", selector=" + selector + ", search=" + search + ", column_name=" + column_name + ", column_value="
				+ column_value + ", pageNum=" + pageNum + ", id=" + id + ", startRow=" + startRow + ", pageSize="
				+ pageSize + ", endRow=" + endRow + ", pageCount=" + pageCount + ", pageBlock=" + pageBlock
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", currentPage=" + currentPage + ", ContractVO="
				+ ContractVO + ", CustomerVO=" + CustomerVO + ", EmployeeVO=" + EmployeeVO + ", LoginVO=" + LoginVO
				+ ", MaterialVO=" + MaterialVO + ", OrderVO=" + OrderVO + ", ProductionVO=" + ProductionVO + "]";
	}


}