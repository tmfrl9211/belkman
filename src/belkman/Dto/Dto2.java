package belkman.Dto;

public class Dto2
{
   private int id;
   private String name;
   private String title;
   private String content;
   private String writeday;
   private int readnum;
   
//public BoardDto() {} // 매개변수 없는 생성자
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getTitle() {
	return title;
}  
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getWriteday() {
	return writeday;
}
public void setWriteday(String writeday) {
	this.writeday = writeday;
}
public int getReadnum() {
	return readnum;
}
public void setReadnum(int readnum) {
	this.readnum = readnum;
}
 public Dto2(int id, String name, String title, String content, String writeday, int readnum) {
	super();
	this.id = id;
	this.name = name;
	this.title = title;
	this.content = content;
	this.writeday = writeday;
	this.readnum = readnum;
} 
    
   // 생성자 , getter,setter
   
}
