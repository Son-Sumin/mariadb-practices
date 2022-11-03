package test;
//VO; 데이터베이스 row를 담는 객체

public class DeptVo {
	private Long no;
	private String name;

	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "DeptVo [no=" + no + ", name=" + name + "]";
	}

}
