package com.team03.prototype.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.team03.prototype.dto.HomeDto;
import com.team03.prototype.dto.MonthlyOrderDto;
import com.team03.prototype.dto.OrderStateCurrentGraphDto;
import com.team03.prototype.dto.PTOrderDto;
import com.team03.prototype.dto.PTProductDto;
import com.team03.prototype.dto.PTrBoardDto;
import com.team03.prototype.dto.ProductCurrentGraphDto;

public class PTBoardDao implements IBoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	//home/main slide,MainPhoto,socialLink
	@Override
	public HomeDto homeView(){
		System.out.println("homeView() method");
		ArrayList<HomeDto> dtos = (ArrayList)sqlSession.selectList("homeView");
		HomeDto dto = dtos.get(0);
		System.out.println("등록일: "+dto.getHmDate());
		return dto;
	}
	@Override
	public void homeWrite(HomeDto dto) {
		System.out.println("homeWrite() method");
		int res = sqlSession.update("homeWrite", dto);
	}
	
	//product 등록
	@Override
	public ArrayList<PTProductDto> productList(){
		System.out.println("productList() method");
		ArrayList<PTProductDto> dtos = (ArrayList)sqlSession.selectList("productList");
		return dtos;
	}
	@Override
	public String productwrite(PTProductDto pdto) {
		System.out.println("productwrite() method");
		String result;
		int res = sqlSession.insert("productwrite", pdto);
		if(res==1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		return result;
	}
	@Override
	public PTProductDto pmProductView(int pId) {
		System.out.println("pmProductView("+pId+") method");
		PTProductDto dto = sqlSession.selectOne("pmProductView", pId);
		return dto;
	}
	@Override
	public void pmProductUpdate(PTProductDto pdto) {
		System.out.println("pmProductUpdate() method");
		int res=sqlSession.update("pmProductUpdate", pdto);
		System.out.println("result: " + res);
	}
	@Override
	public void productDelete(int pId) {
		System.out.println("productDelete("+pId+") method");
		int res=sqlSession.delete("productDelete", pId);
		System.out.println("result: " + res);
	}
//user page
	@Override
	public PTProductDto productView(int pId) {
		System.out.println("productView("+pId+") method");
		PTProductDto dto = sqlSession.selectOne("pmProductView", pId);
		productHitCheck(pId);
		return dto;
	}
	private void productHitCheck(int pId) {
		System.out.println("product no."+pId+" hit");
		sqlSession.update("productHitCheck", pId);
	}
	@Override
	public ArrayList<PTOrderDto> userOrderedList(String uEmail){
		System.out.println("userOrderedList");
		ArrayList<PTOrderDto> dtos = (ArrayList)sqlSession.selectList("userOrderedList", uEmail);
		return dtos;
	}
	/*rBoard list*/
	@Override
	public ArrayList<PTrBoardDto> reviewList() {
		System.out.println("reviewList() method");
		ArrayList<PTrBoardDto> dtos = (ArrayList)sqlSession.selectList("reviewList");		
		System.out.println(dtos.get(0).getrTitle());
		return dtos;
	}
	@Override
	public ArrayList<PTrBoardDto> userReviewList(String uEmail){
		System.out.println("userReviewList() method");
		ArrayList<PTrBoardDto> dtos = (ArrayList)sqlSession.selectList("userReviewList",uEmail);		
		return dtos;		
	}
	@Override
	public ArrayList<PTrBoardDto> productReviewList(String pid){
		System.out.println("productReviewList() method");
		int pId=Integer.parseInt(pid);
		ArrayList<PTrBoardDto> dtos = (ArrayList)sqlSession.selectList("productReviewList",pId);		
		return dtos;		
	}

	//searchList
	@Override
	public ArrayList<PTrBoardDto> searchList() {
		ArrayList<PTrBoardDto> dtos = (ArrayList)sqlSession.selectList("searchList");		
		return dtos;
	}
	@Override
	public ArrayList<PTrBoardDto> userSearchList(String uEmail){
		ArrayList<PTrBoardDto> dtos = (ArrayList)sqlSession.selectList("userSearchList",uEmail);		
		return dtos;
	}
	/*rBoard page list */
	@Override
	//DAO 의 객체로 구동할 method(DB의 데이ㅣ터를 전달하는 기능)
	public ArrayList<PTrBoardDto> pageList(String pageNo) {
		System.out.println("pageList");
		int page = Integer.parseInt(pageNo);
		int startNo = (page-1) * 10 +1;
		System.out.println("startNo : " + startNo);
		ArrayList<PTrBoardDto> result = (ArrayList)sqlSession.selectList("pageList",startNo);
		return result;
	}
	/*rbaoard write */
	@Override
	public void rWrite(PTrBoardDto bdto) {
		int res = sqlSession.insert("rWrite",bdto);
	}
	/*게시판 내용 보기 */
	@Override
	public PTrBoardDto rContentView(String bid) {
		int bId = Integer.parseInt(bid);
		PTrBoardDto dto = sqlSession.selectOne("rContentView",bId);
		return dto;
	}
	/*게시판 수정 */
	@Override
	public void rmodify(PTrBoardDto dto) {
		sqlSession.update("rmodify",dto);
	}
	/*게시판 삭제 */
	@Override
	public void rdelete(int bId) {
		int res = sqlSession.delete("rdelete",bId);
	}
	/*게시판 댓글 창 보여 주기 */
	@Override
	public PTrBoardDto replyView(int rbId) {
		System.out.println("댓글창 보여주기");
		PTrBoardDto dto = sqlSession.selectOne("replyView",rbId);
		return dto;
	}
	/*댓글 내용 저장 */
	@Override
	public void reply(PTrBoardDto dto) {
		System.out.println("댓글내용 저장 하기");
		replyShape(dto.getrGroup(), dto.getrStep());
		int res = sqlSession.insert("reply",dto);
	}
	/*댓글 모양 처리 */
	@Override
	public void replyShape(int rGroup,int rStep) {
		PTrBoardDto dto = new PTrBoardDto(rGroup,rStep);
		int res = sqlSession.update("replyShape",dto);
	}
	
//shopping page
	@Override
	public ArrayList<PTProductDto> bottomList(){
		System.out.println("bottomList() method");
		ArrayList<PTProductDto> dtos = (ArrayList)sqlSession.selectList("bottomList");
		System.out.println(dtos.get(0).getpName()); //data 체크용
		return dtos;
	}
	@Override
	public ArrayList<PTProductDto> outerList(){
		System.out.println("outerList() method");
		ArrayList<PTProductDto> dtos = (ArrayList)sqlSession.selectList("outerList");
		return dtos;
	}
	@Override
	public ArrayList<PTProductDto> topList(){
		System.out.println("topList() method");
		ArrayList<PTProductDto> dtos = (ArrayList)sqlSession.selectList("topList");
		return dtos;
	}
	@Override
	public ArrayList<PTProductDto> etcList(){
		System.out.println("etcList() method");
		ArrayList<PTProductDto> dtos = (ArrayList)sqlSession.selectList("etcList");
		return dtos;
	}
	@Override
	public ArrayList<PTProductDto> newList(){
		System.out.println("newList() method");
		ArrayList<PTProductDto> dtos = (ArrayList)sqlSession.selectList("newList");
		return dtos;
	}
	@Override
	public ArrayList<PTProductDto> bestList(){
		System.out.println("bestList() method");
		ArrayList<PTProductDto> dtos = (ArrayList)sqlSession.selectList("bestList");
		return dtos;
	}
//order
	@Override
	public void orderSave(PTOrderDto dto) {
		System.out.println("orderSave() method");
		int res = sqlSession.insert("orderSave",dto);			
	}
	@Override
	public ArrayList<PTOrderDto> orderList(String uEmail){
		System.out.println("user's order list() method");
		ArrayList<PTOrderDto> dtos = (ArrayList)sqlSession.selectList("orderList", uEmail);
		return dtos;
	}
	@Override
	public String orderRequest (PTOrderDto dto) {
		System.out.println("order Request() method");
		String result="";
		int res=sqlSession.update("orderRequest", dto);
		if(res>0) {
			result="success";
			reduceQuanty(dto);
		}
		else {
			//실패
			result="none";
		}
		return result;
	}
	//구입 후 수량 변경
	private void reduceQuanty(PTOrderDto dto) {
		System.out.println("reduceQuanty("+dto.getpId()+"): -"+dto.getOpQuanty());
		sqlSession.update("reduceQuanty",dto);
	}
	//product manager order
	@Override
	public ArrayList<PTOrderDto> pmOrderList(){
		System.out.println("product manager OrderList() method");
		ArrayList<PTOrderDto> dtos = (ArrayList)sqlSession.selectList("pmOrderList");
		return dtos;
	}
	@Override
	public void opStateModify(PTOrderDto dto) {
		System.out.println("order State Modify() method");
		int res=sqlSession.update("opStateModify",dto);
	}
	@Override
	public ArrayList<PTOrderDto> searchOrder(){
		System.out.println("search OrderList() method");
		ArrayList<PTOrderDto> dtos = (ArrayList)sqlSession.selectList("searchOrder");
		return dtos;
	}
//page information
	@Override
	public ArrayList<ProductCurrentGraphDto> productCurrentGraph(){
		System.out.println("productCurrentGraph() method");
		ArrayList<ProductCurrentGraphDto> dtos= (ArrayList)sqlSession.selectList("productCurrentGraph");
		return dtos;
	}
	@Override
	public ArrayList<OrderStateCurrentGraphDto> orderStateCurrentGraph(){
		System.out.println("orderStateCurrentGraph() method");
		ArrayList<OrderStateCurrentGraphDto> dtos = (ArrayList)sqlSession.selectList("orderStateCurrentGraph");
		return dtos;
	}
	@Override
	public ArrayList<MonthlyOrderDto> monthlyOrderData(){
		System.out.println("monthlyOrderData() method");
		ArrayList<MonthlyOrderDto> dtos = (ArrayList)sqlSession.selectList("monthlyOrderData");
		return dtos;
	}
	@Override
	public ArrayList<MonthlyOrderDto> monthlyCompleteData(){
		System.out.println("monthlyCompleteData() method");
		ArrayList<MonthlyOrderDto> dtos = (ArrayList)sqlSession.selectList("monthlyCompleteData");
		return dtos;
	}

}
