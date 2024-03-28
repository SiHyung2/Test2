package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDTO;
import mvc.model.Freedom_BoardDAO;
import mvc.model.Game_BoardDAO;
import mvc.model.Information_BoardDAO;
import mvc.model.Notification_BoardDAO;
import mvc.model.Popular_BoardDAO;

//@WebServlet("/")
public class BoardController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 15; 

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		
		// 홈페이지 매핑
		if (command.equals("/homepage_do.do")) {//등록된 글 목록 페이지 출력하기
			Popular_requestBoardList(request);
			Freedom_requestBoardList(request);
			Game_requestBoardList(request);
			Information_requestBoardList(request);
			Notification_requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./homepage_do.jsp");
			rd.forward(request, response);
		}
		
		
		//인기 게시판 매핑
		if (command.equals("/Popular_BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
			Popular_requestBoardList(request);
			Information_requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/Popular_list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/Popular_BoardWriteForm.do")) { // 글 등록 페이지 출력하기
			Popular_requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./board/Popular_writeForm.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/Popular_BoardWriteAction.do")) {// 새로운 글 등록하기
			Popular_requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Popular_BoardListAction.do");
				rd.forward(request, response);						
		} else if (command.equals("/Popular_BoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
				//탭 메뉴에 게시물 리스트 가져올 메소드 와 현제 게시물 상세 페이지 메소드
				Popular_requestBoardView(request);
				Popular_requestBoardList(request);
				Information_requestBoardList(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Popular_BoardView.do");
				rd.forward(request, response);						
		} else if (command.equals("/Popular_BoardView.do")) { //글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("./board/Popular_view.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/Popular_BoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
				Popular_requestBoardList(request);
				Information_requestBoardList(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Popular_BoardListAction.do");
				rd.forward(request, response);
		}else if (command.equals("/Popular_BoardDeleteAction.do")) { //선택된 글 삭제하기
			Popular_requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Popular_BoardListAction.do");
				rd.forward(request, response);				
		}
		
		//자유 게시판 매핑 
		else if (command.equals("/Freedom_BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
			Freedom_requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/Freedom_list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/Freedom_BoardWriteForm.do")) { // 글 등록 페이지 출력하기
			Freedom_requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./board/Freedom_writeForm.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/Freedom_BoardWriteAction.do")) {// 새로운 글 등록하기
			Freedom_requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Freedom_BoardListAction.do");
				rd.forward(request, response);						
		} else if (command.equals("/Freedom_BoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
			Freedom_requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Freedom_BoardView.do");
				rd.forward(request, response);						
		} else if (command.equals("/Freedom_BoardView.do")) { //글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("./board/Freedom_view.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/Freedom_BoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
			Freedom_requestBoardUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Freedom_BoardListAction.do");
				rd.forward(request, response);
		}else if (command.equals("/Freedom_BoardDeleteAction.do")) { //선택된 글 삭제하기
			Freedom_requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Freedom_BoardListAction.do");
				rd.forward(request, response);				
		} 
		
		//정보 게시판 매핑
		else if (command.equals("/Information_BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
			Information_requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/Information_list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/Information_BoardWriteForm.do")) { // 글 등록 페이지 출력하기
			Information_requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./board/Information_writeForm.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/Information_BoardWriteAction.do")) {// 새로운 글 등록하기
			Information_requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Information_BoardListAction.do");
				rd.forward(request, response);						
		} else if (command.equals("/Information_BoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
			Information_requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Information_BoardView.do");
				rd.forward(request, response);						
		} else if (command.equals("/Information_BoardView.do")) { //글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("./board/Information_view.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/Information_BoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
			Information_requestBoardUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Information_BoardListAction.do");
				rd.forward(request, response);
		}else if (command.equals("/Information_BoardDeleteAction.do")) { //선택된 글 삭제하기
			Information_requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Information_BoardListAction.do");
				rd.forward(request, response);				
		} 

		//게임 게시판 매핑 
		else if (command.equals("/Game_BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
			Game_requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/Game_list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/Game_BoardWriteForm.do")) { // 글 등록 페이지 출력하기
			Game_requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./board/Game_writeForm.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/Game_BoardWriteAction.do")) {// 새로운 글 등록하기
			Game_requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Game_BoardListAction.do");
				rd.forward(request, response);						
		} else if (command.equals("/Game_BoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
			Game_requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Game_BoardView.do");
				rd.forward(request, response);						
		} else if (command.equals("/Game_BoardView.do")) { //글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("./board/Game_view.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/Game_BoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
			Game_requestBoardUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Game_BoardListAction.do");
				rd.forward(request, response);
		}else if (command.equals("/Game_BoardDeleteAction.do")) { //선택된 글 삭제하기
			Game_requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Game_BoardListAction.do");
				rd.forward(request, response);				
		} 
		
		
		//공지 게시판 매핑
				if (command.equals("/Notification_BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
					Notification_requestBoardList(request);
					RequestDispatcher rd = request.getRequestDispatcher("./board/Notification_list.jsp");
					rd.forward(request, response);
				} else if (command.equals("/Notification_BoardWriteForm.do")) { // 글 등록 페이지 출력하기
					Notification_requestLoginName(request);
						RequestDispatcher rd = request.getRequestDispatcher("./board/Notification_writeForm.jsp");
						rd.forward(request, response);				
				} else if (command.equals("/Notification_BoardWriteAction.do")) {// 새로운 글 등록하기
					Notification_requestBoardWrite(request);
						RequestDispatcher rd = request.getRequestDispatcher("/Notification_BoardListAction.do");
						rd.forward(request, response);						
				} else if (command.equals("/Notification_BoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
					Notification_requestBoardView(request);
						RequestDispatcher rd = request.getRequestDispatcher("/Notification_BoardView.do");
						rd.forward(request, response);						
				} else if (command.equals("/Notification_BoardView.do")) { //글 상세 페이지 출력하기
						RequestDispatcher rd = request.getRequestDispatcher("./board/Notification_view.jsp");
						rd.forward(request, response);	
				} else if (command.equals("/Notification_BoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
					Notification_requestBoardUpdate(request);
						RequestDispatcher rd = request.getRequestDispatcher("/Notification_BoardListAction.do");
						rd.forward(request, response);
				}else if (command.equals("/Notification_BoardDeleteAction.do")) { //선택된 글 삭제하기
					Notification_requestBoardDelete(request);
						RequestDispatcher rd = request.getRequestDispatcher("/Notification_BoardListAction.do");
						rd.forward(request, response);				
				}
		
		
		
		
		
	}
	
	
		//인기게시판 메소드 모음
	
	//등록된 글 목록 가져오기	
	public void Popular_requestBoardList(HttpServletRequest request){
			
		Popular_BoardDAO dao = Popular_BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record=dao.getListCount(items, text);
		boardlist = dao.getBoardList(pageNum,limit, items, text); 
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("Popular_pageNum", pageNum);		  
   		request.setAttribute("Popular_total_page", total_page);   
		request.setAttribute("Popular_total_record",total_record); 
		request.setAttribute("Popular_boardlist", boardlist);								
	}
	//인증된 사용자명 가져오기
	public void Popular_requestLoginName(HttpServletRequest request){
					
		String id = request.getParameter("id");
		
		Popular_BoardDAO  dao = Popular_BoardDAO.getInstance();
		
		String name = dao.getLoginNameById(id);		
		
		request.setAttribute("name", name);									
	}
	// 새로운 글 등록하기
	public void Popular_requestBoardWrite(HttpServletRequest request){
					
		Popular_BoardDAO dao = Popular_BoardDAO.getInstance();		
		
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));	
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date()); 
		
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());			
		
		dao.insertBoard(board);								
	}
	//선택된 글 상세 페이지 가져오기
	public void Popular_requestBoardView(HttpServletRequest request){
					
		Popular_BoardDAO dao = Popular_BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int Popular_pageNum = Integer.parseInt(request.getParameter("Popular_pageNum"));	
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num);		
		
		request.setAttribute("num", num);		 
   		request.setAttribute("page", Popular_pageNum); 
   		request.setAttribute("board", board);   									
	}
	//선택된 글 내용 수정하기
	public void Popular_requestBoardUpdate(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
		int Popular_pageNum = Integer.parseInt(request.getParameter("Popular_pageNum"));	
		
		Popular_BoardDAO dao = Popular_BoardDAO.getInstance();		
		
		BoardDTO board = new BoardDTO();		
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));		
		
		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		 String regist_day = formatter.format(new java.util.Date()); 
		 
		 board.setHit(0);
		 board.setRegist_day(regist_day);
		 board.setIp(request.getRemoteAddr());			
		
		 dao.updateBoard(board);								
	}
	//선택된 글 삭제하기
	public void Popular_requestBoardDelete(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
		int Popular_pageNum = Integer.parseInt(request.getParameter("Popular_pageNum"));	
		
		Popular_BoardDAO dao = Popular_BoardDAO.getInstance();
		dao.deleteBoard(num);							
	}	
	
	
	
	
	
	
	
	
			//자유 게시판 메소드 모음
	
		//등록된 글 목록 가져오기	
		public void Freedom_requestBoardList(HttpServletRequest request){
				
			Freedom_BoardDAO dao = Freedom_BoardDAO.getInstance();
			List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
			
		  	int pageNum=1;
			int limit=LISTCOUNT;
			
			if(request.getParameter("pageNum")!=null)
				pageNum=Integer.parseInt(request.getParameter("pageNum"));
					
			String items = request.getParameter("items");
			String text = request.getParameter("text");
			
			int total_record=dao.getListCount(items, text);
			boardlist = dao.getBoardList(pageNum,limit, items, text); 
			
			int total_page;
			
			if (total_record % limit == 0){     
		     	total_page =total_record/limit;
		     	Math.floor(total_page);  
			}
			else{
			   total_page =total_record/limit;
			   Math.floor(total_page); 
			   total_page =  total_page + 1; 
			}		
	   
	   		request.setAttribute("Freedom_pageNum", pageNum);		  
	   		request.setAttribute("Freedom_total_page", total_page);   
			request.setAttribute("Freedom_total_record",total_record); 
			request.setAttribute("Freedom_boardlist", boardlist);								
		}
		//인증된 사용자명 가져오기
		public void Freedom_requestLoginName(HttpServletRequest request){
						
			String id = request.getParameter("id");
			
			Freedom_BoardDAO  dao = Freedom_BoardDAO.getInstance();
			
			String name = dao.getLoginNameById(id);		
			
			request.setAttribute("name", name);									
		}
		// 새로운 글 등록하기
		public void Freedom_requestBoardWrite(HttpServletRequest request){
						
			Freedom_BoardDAO dao = Freedom_BoardDAO.getInstance();		
			
			BoardDTO board = new BoardDTO();
			board.setId(request.getParameter("id"));
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));	
			
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("subject"));
			System.out.println(request.getParameter("content"));
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			String regist_day = formatter.format(new java.util.Date()); 
			
			board.setHit(0);
			board.setRegist_day(regist_day);
			board.setIp(request.getRemoteAddr());			
			
			dao.insertBoard(board);								
		}
		//선택된 글 상세 페이지 가져오기
		public void Freedom_requestBoardView(HttpServletRequest request){
						
			Freedom_BoardDAO dao = Freedom_BoardDAO.getInstance();
			int num = Integer.parseInt(request.getParameter("num"));
			int Freedom_pageNum = Integer.parseInt(request.getParameter("Freedom_pageNum"));	
			
			BoardDTO board = new BoardDTO();
			board = dao.getBoardByNum(num);		
			
			request.setAttribute("num", num);		 
	   		request.setAttribute("page", Freedom_pageNum); 
	   		request.setAttribute("board", board);   									
		}
		//선택된 글 내용 수정하기
		public void Freedom_requestBoardUpdate(HttpServletRequest request){
						
			int num = Integer.parseInt(request.getParameter("num"));
			int Freedom_pageNum = Integer.parseInt(request.getParameter("Freedom_pageNum"));	
			
			Freedom_BoardDAO dao = Freedom_BoardDAO.getInstance();		
			
			BoardDTO board = new BoardDTO();		
			board.setNum(num);
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));		
			
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			 String regist_day = formatter.format(new java.util.Date()); 
			 
			 board.setHit(0);
			 board.setRegist_day(regist_day);
			 board.setIp(request.getRemoteAddr());			
			
			 dao.updateBoard(board);								
		}
		//선택된 글 삭제하기
		public void Freedom_requestBoardDelete(HttpServletRequest request){
						
			int num = Integer.parseInt(request.getParameter("num"));
			int Freedom_pageNum = Integer.parseInt(request.getParameter("Freedom_pageNum"));	
			
			Freedom_BoardDAO dao = Freedom_BoardDAO.getInstance();
			dao.deleteBoard(num);							
		}	
		
		
		
		
		
		
		
		
		
				//정보 게시판 메소드 모음
		
			//등록된 글 목록 가져오기	
			public void Information_requestBoardList(HttpServletRequest request){
					
				Information_BoardDAO dao = Information_BoardDAO.getInstance();
				List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
				
			  	int pageNum=1;
				int limit=LISTCOUNT;
				
				if(request.getParameter("pageNum")!=null)
					pageNum=Integer.parseInt(request.getParameter("pageNum"));
						
				String items = request.getParameter("items");
				String text = request.getParameter("text");
				
				int total_record=dao.getListCount(items, text);
				boardlist = dao.getBoardList(pageNum,limit, items, text); 
				
				int total_page;
				
				if (total_record % limit == 0){     
			     	total_page =total_record/limit;
			     	Math.floor(total_page);  
				}
				else{
				   total_page =total_record/limit;
				   Math.floor(total_page); 
				   total_page =  total_page + 1; 
				}		
		   
		   		request.setAttribute("Information_pageNum", pageNum);		  
		   		request.setAttribute("Information_total_page", total_page);   
				request.setAttribute("Information_total_record",total_record); 
				request.setAttribute("Information_boardlist", boardlist);								
			}
			//인증된 사용자명 가져오기
			public void Information_requestLoginName(HttpServletRequest request){
							
				String id = request.getParameter("id");
				
				Information_BoardDAO  dao = Information_BoardDAO.getInstance();
				
				String name = dao.getLoginNameById(id);		
				
				request.setAttribute("name", name);									
			}
			// 새로운 글 등록하기
			public void Information_requestBoardWrite(HttpServletRequest request){
							
				Information_BoardDAO dao = Information_BoardDAO.getInstance();		
				
				BoardDTO board = new BoardDTO();
				board.setId(request.getParameter("id"));
				board.setName(request.getParameter("name"));
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));	
				
				System.out.println(request.getParameter("name"));
				System.out.println(request.getParameter("subject"));
				System.out.println(request.getParameter("content"));
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
				String regist_day = formatter.format(new java.util.Date()); 
				
				board.setHit(0);
				board.setRegist_day(regist_day);
				board.setIp(request.getRemoteAddr());			
				
				dao.insertBoard(board);								
			}
			//선택된 글 상세 페이지 가져오기
			public void Information_requestBoardView(HttpServletRequest request){
							
				Information_BoardDAO dao = Information_BoardDAO.getInstance();
				int num = Integer.parseInt(request.getParameter("num"));
				int Information_pageNum = Integer.parseInt(request.getParameter("Information_pageNum"));	
				
				BoardDTO board = new BoardDTO();
				board = dao.getBoardByNum(num);		
				
				request.setAttribute("num", num);		 
		   		request.setAttribute("page", Information_pageNum); 
		   		request.setAttribute("board", board);   									
			}
			//선택된 글 내용 수정하기
			public void Information_requestBoardUpdate(HttpServletRequest request){
							
				int num = Integer.parseInt(request.getParameter("num"));
				int Information_pageNum = Integer.parseInt(request.getParameter("Information_pageNum"));	
				
				Information_BoardDAO dao = Information_BoardDAO.getInstance();		
				
				BoardDTO board = new BoardDTO();		
				board.setNum(num);
				board.setName(request.getParameter("name"));
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));		
				
				 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
				 String regist_day = formatter.format(new java.util.Date()); 
				 
				 board.setHit(0);
				 board.setRegist_day(regist_day);
				 board.setIp(request.getRemoteAddr());			
				
				 dao.updateBoard(board);								
			}
			//선택된 글 삭제하기
			public void Information_requestBoardDelete(HttpServletRequest request){
							
				int num = Integer.parseInt(request.getParameter("num"));
				int Information_pageNum = Integer.parseInt(request.getParameter("Information_pageNum"));	
				
				Information_BoardDAO dao = Information_BoardDAO.getInstance();
				dao.deleteBoard(num);							
			}	
			
			
			
			
			
			
			//게임 게시판 메소드 모음
			
			//등록된 글 목록 가져오기	
			public void Game_requestBoardList(HttpServletRequest request){
					
				Game_BoardDAO dao = Game_BoardDAO.getInstance();
				List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
				
			  	int pageNum=1;
				int limit=LISTCOUNT;
				
				if(request.getParameter("pageNum")!=null)
					pageNum=Integer.parseInt(request.getParameter("pageNum"));
						
				String items = request.getParameter("items");
				String text = request.getParameter("text");
				
				int total_record=dao.getListCount(items, text);
				boardlist = dao.getBoardList(pageNum,limit, items, text); 
				
				int total_page;
				
				if (total_record % limit == 0){     
			     	total_page =total_record/limit;
			     	Math.floor(total_page);  
				}
				else{
				   total_page =total_record/limit;
				   Math.floor(total_page); 
				   total_page =  total_page + 1; 
				}		
		   
		   		request.setAttribute("Game_pageNum", pageNum);		  
		   		request.setAttribute("Game_total_page", total_page);   
				request.setAttribute("Game_total_record",total_record); 
				request.setAttribute("Game_boardlist", boardlist);								
			}
			//인증된 사용자명 가져오기
			public void Game_requestLoginName(HttpServletRequest request){
							
				String id = request.getParameter("id");
				
				Game_BoardDAO  dao = Game_BoardDAO.getInstance();
				
				String name = dao.getLoginNameById(id);		
				
				request.setAttribute("name", name);									
			}
			// 새로운 글 등록하기
			public void Game_requestBoardWrite(HttpServletRequest request){
							
				Game_BoardDAO dao = Game_BoardDAO.getInstance();		
				
				BoardDTO board = new BoardDTO();
				board.setId(request.getParameter("id"));
				board.setName(request.getParameter("name"));
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));	
				
				System.out.println(request.getParameter("name"));
				System.out.println(request.getParameter("subject"));
				System.out.println(request.getParameter("content"));
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
				String regist_day = formatter.format(new java.util.Date()); 
				
				board.setHit(0);
				board.setRegist_day(regist_day);
				board.setIp(request.getRemoteAddr());			
				
				dao.insertBoard(board);								
			}
			//선택된 글 상세 페이지 가져오기
			public void Game_requestBoardView(HttpServletRequest request){
							
				Game_BoardDAO dao = Game_BoardDAO.getInstance();
				int num = Integer.parseInt(request.getParameter("num"));
				int Game_pageNum = Integer.parseInt(request.getParameter("Game_pageNum"));	
				
				BoardDTO board = new BoardDTO();
				board = dao.getBoardByNum(num);		
				
				request.setAttribute("num", num);		 
		   		request.setAttribute("page", Game_pageNum); 
		   		request.setAttribute("board", board);   									
			}
			//선택된 글 내용 수정하기
			public void Game_requestBoardUpdate(HttpServletRequest request){
							
				int num = Integer.parseInt(request.getParameter("num"));
				int Game_pageNum = Integer.parseInt(request.getParameter("Game_pageNum"));	
				
				Game_BoardDAO dao = Game_BoardDAO.getInstance();		
				
				BoardDTO board = new BoardDTO();		
				board.setNum(num);
				board.setName(request.getParameter("name"));
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));		
				
				 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
				 String regist_day = formatter.format(new java.util.Date()); 
				 
				 board.setHit(0);
				 board.setRegist_day(regist_day);
				 board.setIp(request.getRemoteAddr());			
				
				 dao.updateBoard(board);								
			}
			//선택된 글 삭제하기
			public void Game_requestBoardDelete(HttpServletRequest request){
							
				int num = Integer.parseInt(request.getParameter("num"));
				int Game_pageNum = Integer.parseInt(request.getParameter("Game_pageNum"));	
				
				Game_BoardDAO dao = Game_BoardDAO.getInstance();
				dao.deleteBoard(num);							
			}
			
			
			

			//공지게시판 메소드 모음
		
		//등록된 글 목록 가져오기	
		public void Notification_requestBoardList(HttpServletRequest request){
				
			Notification_BoardDAO dao = Notification_BoardDAO.getInstance();
			List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
			
		  	int pageNum=1;
			int limit=LISTCOUNT;
			
			if(request.getParameter("pageNum")!=null)
				pageNum=Integer.parseInt(request.getParameter("pageNum"));
					
			String items = request.getParameter("items");
			String text = request.getParameter("text");
			
			int total_record=dao.getListCount(items, text);
			boardlist = dao.getBoardList(pageNum,limit, items, text); 
			
			int total_page;
			
			if (total_record % limit == 0){     
		     	total_page =total_record/limit;
		     	Math.floor(total_page);  
			}
			else{
			   total_page =total_record/limit;
			   Math.floor(total_page); 
			   total_page =  total_page + 1; 
			}		
	   
	   		request.setAttribute("Notification_pageNum", pageNum);		  
	   		request.setAttribute("Notification_total_page", total_page);   
			request.setAttribute("Notification_total_record",total_record); 
			request.setAttribute("Notification_boardlist", boardlist);								
		}
		//인증된 사용자명 가져오기
		public void Notification_requestLoginName(HttpServletRequest request){
						
			String id = request.getParameter("id");
			
			Notification_BoardDAO  dao = Notification_BoardDAO.getInstance();
			
			String name = dao.getLoginNameById(id);		
			
			request.setAttribute("name", name);									
		}
		// 새로운 글 등록하기
		public void Notification_requestBoardWrite(HttpServletRequest request){
						
			Notification_BoardDAO dao = Notification_BoardDAO.getInstance();		
			
			BoardDTO board = new BoardDTO();
			board.setId(request.getParameter("id"));
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));	
			
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("subject"));
			System.out.println(request.getParameter("content"));
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			String regist_day = formatter.format(new java.util.Date()); 
			
			board.setHit(0);
			board.setRegist_day(regist_day);
			board.setIp(request.getRemoteAddr());			
			
			dao.insertBoard(board);								
		}
		//선택된 글 상세 페이지 가져오기
		public void Notification_requestBoardView(HttpServletRequest request){
						
			Notification_BoardDAO dao = Notification_BoardDAO.getInstance();
			int num = Integer.parseInt(request.getParameter("num"));
			int Notification_pageNum = Integer.parseInt(request.getParameter("Notification_pageNum"));	
			
			BoardDTO board = new BoardDTO();
			board = dao.getBoardByNum(num);		
			
			request.setAttribute("num", num);		 
	   		request.setAttribute("page", Notification_pageNum); 
	   		request.setAttribute("board", board);   									
		}
		//선택된 글 내용 수정하기
		public void Notification_requestBoardUpdate(HttpServletRequest request){
						
			int num = Integer.parseInt(request.getParameter("num"));
			int Notification_pageNum = Integer.parseInt(request.getParameter("Notification_pageNum"));	
			
			Notification_BoardDAO dao = Notification_BoardDAO.getInstance();		
			
			BoardDTO board = new BoardDTO();		
			board.setNum(num);
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));		
			
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			 String regist_day = formatter.format(new java.util.Date()); 
			 
			 board.setHit(0);
			 board.setRegist_day(regist_day);
			 board.setIp(request.getRemoteAddr());			
			
			 dao.updateBoard(board);								
		}
		//선택된 글 삭제하기
		public void Notification_requestBoardDelete(HttpServletRequest request){
						
			int num = Integer.parseInt(request.getParameter("num"));
			int Notification_pageNum = Integer.parseInt(request.getParameter("Notification_pageNum"));	
			
			Notification_BoardDAO dao = Notification_BoardDAO.getInstance();
			dao.deleteBoard(num);							
		}	
		
			
}





